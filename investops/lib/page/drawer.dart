import 'package:flutter/material.dart';
import 'package:investops/assets/constants.dart';
import 'package:investops/main.dart';
import 'package:investops/page/login.dart';
import 'package:investops/page/stock/mywatchlist.dart';
import 'package:investops/page/crypto/crypto_watchlist.dart';
import 'package:investops/page/suggestionBoxPage.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class UniversalDrawer extends StatefulWidget {
  const UniversalDrawer({super.key});

  @override
  State<UniversalDrawer> createState() => _UniversalDrawerState();
}

class _UniversalDrawerState extends State<UniversalDrawer> {
  @override
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Drawer(
      backgroundColor: Colors.black,
      child: Column(
        children: [
          Container(
            height: 130,
            color: const Color.fromARGB(255, 21, 21, 21),
            child: Center(
              child: ListTile(
                minLeadingWidth: 10,
                leading: const Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                title: Text(
                  (request.loggedIn) ? nama : 'Belum Login',
                  style: TextStyle(
                      color: (request.loggedIn)
                          ? const Color.fromARGB(255, 150, 252, 3)
                          : Colors.white),
                ),
              ),
            ),
          ),
          if (!request.loggedIn)
            ListTile(
              minLeadingWidth: 10,
              leading: const Icon(
                Icons.login_rounded,
                color: const Color.fromARGB(255, 150, 252, 3),
              ),
              title: const Text(
                'Login',
                style: TextStyle(color: const Color.fromARGB(255, 150, 252, 3)),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ListTile(
            minLeadingWidth: 10,
            leading: const Icon(Icons.home_rounded, color: Colors.white),
            title: const Text(
              'Home',
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
            leading: const Icon(Icons.insert_chart_outlined_rounded,
                color: Colors.white),
            title: const Text(
              'Saham',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyWatchList()),
              );
            },
          ),
          ListTile(
            minLeadingWidth: 10,
            leading:
                const Icon(Icons.currency_bitcoin_rounded, color: Colors.white),
            title: const Text(
              'Kripto',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyCryptoWatchList()),
              );
            },
          ),
          ListTile(
            minLeadingWidth: 10,
            leading:
                const Icon(Icons.account_balance_rounded, color: Colors.white),
            title: const Text(
              'Perusahaan',
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
            leading: const Icon(Icons.book, color: Colors.white),
            title: const Text(
              'Akademi',
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
            leading: const Icon(Icons.assignment, color: Colors.white),
            title: const Text(
              'Kuis',
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
            leading: const Icon(
              Icons.comment_rounded,
              color: Colors.white,
            ),
            dense: true,
            title: const Text(
              'Suggestion',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const SuggestionBoxPage()),
              );
            },
          ),
          if (request.loggedIn)
            ListTile(
              minLeadingWidth: 10,
              leading: const Icon(
                Icons.logout_rounded,
                color: Colors.red,
              ),
              dense: true,
              title: const Text(
                'Log Out',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () async {
                if (request.loggedIn) {
                  final response =
                      await request.logout("$siteUrl/authenticate/logout/");
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                }
              },
            ),
        ],
      ),
    );
  }
}
