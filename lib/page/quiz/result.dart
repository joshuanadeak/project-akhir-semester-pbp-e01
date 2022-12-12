import 'package:flutter/material.dart';
import 'package:investops/main.dart';

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
        title: Text('Result Quiz'),
      ),
      body: Center(
        child:
          Column(
            children: [
              Spacer(flex: 2),
              Text(
                "Thank you for taking the quiz, ", //tambahin nama
                style:const TextStyle(color: Colors.black,
                      fontFamily: 'Alexandria',
                      fontSize: 18),
              ),
              Spacer(),
              Text(
                "Result, ", //tambahin nama
                style:const TextStyle(color: Colors.black,
                      fontFamily: 'Alexandria',
                      fontSize: 24),
              ),
              Text(
                " ", //tambahin score
                style:const TextStyle(color: Colors.black,
                      fontFamily: 'Alexandria',
                      fontSize: 32),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 74, 229, 154),
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                child: const Text('Home'),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyApp()),
                  );
                }, // on pressed leads to quiz.
              ),
            ],
          )
      ),
    );
  }
}