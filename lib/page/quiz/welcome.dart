import 'package:flutter/material.dart';
import 'package:investops/page/quiz/quiz.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:investops/page/quiz/quiz.dart';

class WelcomeQuizPage extends StatefulWidget {
  const WelcomeQuizPage({Key? key}) : super(key: key);

  @override
  State<WelcomeQuizPage> createState() => _WelcomeQuizPageState();
}

class _WelcomeQuizPageState extends State<WelcomeQuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Stock and Trading Quiz",
                  style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Alexandria',
                      fontSize: 32)),
              Text("By Investops",
                  style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Alexandria',
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              Text(
                  "It only takes a few minutes to train your knowledge and skill about stock and trading.",
                  style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Alexandria',
                      fontWeight: FontWeight.bold)),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 74, 229, 154),
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                child: const Text('Start Quiz'),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QuizFormPage()),
                  );
                }, // on pressed leads to quiz.
              ),
            ]),
      ),
    );
  }
}
