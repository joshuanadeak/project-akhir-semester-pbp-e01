import 'package:flutter/material.dart';
import 'package:investops/main.dart';
import 'package:investops/page/form.dart';
import 'package:investops/page/login.dart';
import 'package:investops/page/mywatchlist.dart';
import 'package:investops/page/suggestionBoxPage.dart';

class UniversalDrawer extends StatefulWidget {
  const UniversalDrawer({super.key});

  @override
  State<UniversalDrawer> createState() => _UniversalDrawerState();
}

class _UniversalDrawerState extends State<UniversalDrawer> {
  @override
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Column(
        children: [
          Container(height: 90, color: Colors.grey),
          ListTile(
            title: const Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'counter_7',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
          ListTile(
            minLeadingWidth: 10,
            // leading: const Icon(
            //   Icons.add_box_outlined,
            //   color: Colors.white,
            // ),
            dense: true,
            title: const Text(
              'Suggestion',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SuggestionBoxPage()),
              );
            },
          ),
          ListTile(
            minLeadingWidth: 10,
            leading: const Icon(
              Icons.add_box_outlined,
              color: Colors.white,
            ),
            dense: true,
            title: const Text(
              'Tambah Budget',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyFormPage()),
              );
            },
          ),
          // ListTile(
          //   title: const Text(
          //     'Data Budget',
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   onTap: () {
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(builder: (context) => const MyDataPage()),
          //     );
          //   },
          // ),
          ListTile(
            title: const Text(
              'My Watch List',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyWatchList()),
              );
            },
          ),
        ],
      ),
    );
  }
}
