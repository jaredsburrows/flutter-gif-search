import 'package:flutter/material.dart';

import 'account_screen.dart';
import 'home_sceen.dart';
import 'settings_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Top Trending Gifs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomeScreen(),
      routes: <String, WidgetBuilder>{
        SettingsScreen.routeName: (BuildContext context) =>
            const SettingsScreen(),
        AccountScreen.routeName: (BuildContext context) =>
            const AccountScreen(),
      },
    );
  }
}
