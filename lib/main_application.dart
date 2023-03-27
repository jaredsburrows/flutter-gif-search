import 'package:enough_platform_widgets/enough_platform_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif_search/main_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // See https://github.com/stryder-dev/flutter_platform_widgets/issues/202
  Brightness _brightness = WidgetsBinding.instance.window.platformBrightness;

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
      _brightness = WidgetsBinding.instance.window.platformBrightness;
    });
  }

  @override
  Widget build(BuildContext context) {
    final lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      useMaterial3: true,
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: Color(Colors.blue.value),
      ),
    );
    final darkTheme = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      useMaterial3: true,
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(Colors.blue.value),
      ),
    );

    return Theme(
      data: _brightness == Brightness.light ? lightTheme : darkTheme,
      child: PlatformProvider(
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
