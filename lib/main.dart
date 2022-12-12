import 'package:flutter/material.dart';
import 'package:investops/page/login.dart';
import 'package:investops/page/mainpage.dart';
import 'package:investops/page/register.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:investops/widgets/elev_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) {
          CookieRequest request = CookieRequest();
          return request;
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Investops',
          theme: ThemeData(
              inputDecorationTheme: const InputDecorationTheme(
                  hintStyle: TextStyle(
                    color: Color.fromARGB(70, 171, 171, 171),
                    fontFamily: 'Alexandria-Light',
                    fontSize: 14,
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 21, 21, 21),
                  suffixIconColor: Color.fromARGB(255, 171, 171, 171),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(70, 171, 171, 171),
                          width: 0.2)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(70, 171, 171, 171),
                          width: 0.2))),
              textTheme: const TextTheme(
                bodyText1: TextStyle(),
                bodyText2: TextStyle(),
              ).apply(
                bodyColor: const Color.fromARGB(255, 150, 252, 3),
                displayColor: const Color.fromARGB(255, 150, 252, 3),
              ),
              fontFamily: 'Alexandria',
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(size: 20, color: Colors.white),
                titleTextStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontFamily: 'Alexandria'),
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                centerTitle: true,
              ),
              scaffoldBackgroundColor: Colors.black,
              // brightness: Brightness.light,
              // primaryColor: Color(0xff5D4524),
              primarySwatch: Colors.lime,
              iconTheme: const IconThemeData(color: Colors.white)),
          home: const MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final String title = 'INVESTOPS';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.only(top: 64),
                  child: const Text(
                    "INVESTOPS.",
                    style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  height: 520,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: const AssetImage(
                        'assets/images/logo.png'),
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                        const Color.fromARGB(255, 201, 200, 200)
                            .withOpacity(0.6),
                        BlendMode.dstATop),
                    )
                  )
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 32),
                      child: const Text(
                        "Stop Waiting, Start Investing",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: MyElevatedButton(
                        text: const Text("Log In"),
                        backgroundColor: const Color.fromARGB(255, 150, 252, 3),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginPage()),
                          );
                        },
                      ),
                    ),
                    MyElevatedButton(
                      text: const Text("Register"),
                      backgroundColor: const Color.fromARGB(255, 150, 252, 3),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const RegisterPage()),
                        );
                      },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontFamily: 'Alexandria-Light',),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const MyMainPage()),
                        );
                      },
                      child: const Text('Continue without Log In',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
