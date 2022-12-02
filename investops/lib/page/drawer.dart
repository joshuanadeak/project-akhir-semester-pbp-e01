import 'package:flutter/material.dart';
import 'package:investops/main.dart';

class UniversalDrawer extends StatefulWidget {
  const UniversalDrawer({super.key});

  @override
  State<UniversalDrawer> createState() => _UniversalDrawerState();
}

class _UniversalDrawerState extends State<UniversalDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Menu'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('Suggestion Box'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
