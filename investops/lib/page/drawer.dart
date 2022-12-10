import 'package:flutter/material.dart';
import 'package:investops/main.dart';
import 'package:investops/page/suggestionBoxPage.dart';

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
              color: Colors.amber,
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyApp()),
              );
            },
          ),
          ListTile(
            title: Text('Suggestion Box'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SuggestionBoxPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
