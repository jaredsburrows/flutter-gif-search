import 'package:flutter/material.dart';

/// Basic screen used to show account data
class AccountScreen extends StatelessWidget {
  static const String routeName = '/account';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Container(
        child: Center(
          child: Text('Account Screen'),
        ),
      ),
    );
  }
}
