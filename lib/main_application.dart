import 'package:enough_platform_widgets/enough_platform_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif_search/main_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // See https://github.com/stryder-dev/flutter_platform_widgets/issues/202
  Brightness _brightness =
      WidgetsBinding.instance.platformDispatcher.platformBrightness;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    setState(() {
      _brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: _brightness,
        primarySwatch: Colors.lightBlue,
      ),
      child: PlatformProvider(
        settings: PlatformSettingsData(
          // This makes the platform widget use the Material icons
          // For example - icon: Icon(Icons.adaptive.more),
          // IconData get more_outlined => !_isCupertino() ? Icons.more_vert_outlined : Icons.more_horiz_outlined;
          platformStyle: PlatformStyleData(
            web: Icons.adaptive.more == Icons.more_vert
                ? PlatformStyle.Material
                : PlatformStyle.Cupertino,
          ),
        ),
        builder: (context) => const PlatformApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: <LocalizationsDelegate<dynamic>>[
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          title: 'Gif Search',
          home: MyHomeScreen(),
        ),
      ),
    );
  }
}
