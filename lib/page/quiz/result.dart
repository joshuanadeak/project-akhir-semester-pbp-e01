import 'package:flutter/material.dart';
import 'package:investops/page/login.dart';
import 'package:investops/page/mainpage.dart';

import '../drawer.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Quiz'),
      ),
      drawer: const UniversalDrawer(),
      body: Center(
        child:
          Column(
            children: [
              const Spacer(flex: 2),
              const Text(
                "Thank you for taking the quiz, ", //tambahin nama
                style:TextStyle(color: Colors.white,
                      fontFamily: 'Alexandria',
                      fontSize: 18),
              ),
              const Spacer(),
              Text(
                "Result, $nama", //tambahin nama
                style:const TextStyle(color: Colors.white,
                      fontFamily: 'Alexandria',
                      fontSize: 24),
              ),
              const Text(
                " ", //tambahin score
                style:TextStyle(color: Colors.white,
                      fontFamily: 'Alexandria',
                      fontSize: 32),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 74, 229, 154),
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                child: const Text('Home'),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyMainPage()),
                  );
                }, // on pressed leads to quiz.
              ),
            ],
          )
      ),
    );
  }
}