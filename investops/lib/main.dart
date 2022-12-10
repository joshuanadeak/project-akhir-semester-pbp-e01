import 'package:flutter/material.dart';
import 'package:investops/page/drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

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
              iconTheme: IconThemeData(color: Colors.white)),
          home: const MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final String title = 'Investops';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter != 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        drawer: UniversalDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Using ternary operator
              ((_counter % 2 == 1)
                  ? const Text('GANJIL', style: TextStyle(color: Colors.blue))
                  : const Text('GENAP', style: TextStyle(color: Colors.red))),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
          // color: Colors.amber,
          child: Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                backgroundColor: Color.fromARGB(255, 150, 252, 3),
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.add, color: Colors.black),
              ),
              if (_counter != 0)
                FloatingActionButton(
                  backgroundColor: Color.fromARGB(255, 150, 252, 3),
                  onPressed: _decrementCounter,
                  tooltip: 'Decrement',
                  child: const Icon(
                    Icons.remove,
                    color: Colors.black,
                  ),
                ),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
