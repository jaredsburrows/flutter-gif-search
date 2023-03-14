import 'package:flutter/material.dart';

import 'account_screen.dart';
import 'settings_screen.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  MyHomeScreenState createState() => MyHomeScreenState();
}

class MyHomeScreenState extends State<MyHomeScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Trending Gifs'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      drawer: _getNavDrawer(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('Click!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: _incrementCounter,
            ),
          ));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  Drawer _getNavDrawer(BuildContext context) {
    ListTile getNavItem(IconData icon, String title, String routeName) {
      return ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: () {
          setState(() {
            // pop closes the drawer
            Navigator.of(context).pop();

            // Stop here if we are simply returning back to "home"
            if (routeName == "/") return;

            // navigate to the route
            Navigator.of(context).pushNamed(routeName);
          });
        },
      );
    }

    var myNavChildren = [
      // Header
      const DrawerHeader(
        child: Text('Header'),
      ),
      // Nav Items
      getNavItem(Icons.home, 'Home', '/'),
      getNavItem(Icons.account_box, 'Account', AccountScreen.routeName),
      getNavItem(Icons.settings, 'Settings', SettingsScreen.routeName),
      // About dialog
      const AboutListTile(
        applicationName: 'Application Name',
        applicationVersion: 'v1.0.0',
        applicationIcon: Icon(Icons.adb),
        icon: Icon(Icons.info),
        child: Text('About'),
      )
    ];

    return Drawer(
      child: ListView(children: myNavChildren),
    );
  }
}

class ContactModal {
  final String fullName;
  final String email;

  const ContactModal({required this.fullName, required this.email});
}

class ContactsList extends StatelessWidget {
  final List<ContactModal> _contactModal;

  const ContactsList(this._contactModal, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      children: _buildContactsList(),
    );
  }

  List<ContactListItem> _buildContactsList() {
    return _contactModal.map((contact) => ContactListItem(contact)).toList();
  }
}

class ContactListItem extends StatelessWidget {
  final ContactModal _contactModal;

  const ContactListItem(this._contactModal, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text(_contactModal.fullName[0])),
      title: Text(_contactModal.fullName),
      subtitle: Text(_contactModal.email),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContactsList(
        _buildContactList(),
      ),
    );
  }

  List<ContactModal> _buildContactList() {
    List<ContactModal> items = [];
    for (int i = 0; i < 10; i++) {
      items.add(const ContactModal(
        fullName: 'Jared Burrows',
        email: 'jaredsburrows@gmail.com',
      ));
    }
    return items;
  }
}
