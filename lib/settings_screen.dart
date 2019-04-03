import 'package:flutter/material.dart';

/// Settings screen used to show setting data
class SettingsScreen extends StatelessWidget {
  static const String routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: RaisedButton(
              child: Text('Click here'),
              onPressed: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Hello!'),
                ));
              },
            ),
          );
        },
      ),
    );
  }
}
