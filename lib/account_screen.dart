import 'package:flutter/material.dart';

/// Basic screen used to show account data
class AccountScreen extends StatelessWidget {
  static const String routeName = '/account';

  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: const Center(
        child: Text('Account Screen'),
      ),
    );
  }
}
