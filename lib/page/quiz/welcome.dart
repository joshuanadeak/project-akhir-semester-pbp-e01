import 'package:flutter/material.dart';
import 'package:investops/page/login.dart';
import 'package:investops/page/quiz/quiz.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

import '../drawer.dart';

class WelcomeQuizPage extends StatefulWidget {
  const WelcomeQuizPage({Key? key}) : super(key: key);

  @override
  State<WelcomeQuizPage> createState() => _WelcomeQuizPageState();
}

class _WelcomeQuizPageState extends State<WelcomeQuizPage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Quiz'),
      ),
      drawer: const UniversalDrawer(),
      body: Padding (
        padding: const EdgeInsets.only(left: 20.0),
        child :Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Stock and Trading Quiz",
                  style: TextStyle(
                      color: Color.fromARGB(255, 150, 252, 3),
                      fontFamily: 'Alexandria',
                      fontSize: 32)),
              const Text("By Investops",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Alexandria',
                      fontSize: 18)),
              const Text(
                  "It only takes a few minutes to train your knowledge and skill about stock and trading.",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Alexandria',)),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 74, 229, 154),
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                child: const Text('Start Quiz'),
                onPressed: () {
                   if (!request.loggedIn) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        }
                        else{
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QuizFormPage()),
                  );}
                }, // on pressed leads to quiz.
              ),
            ]),
      )
      )
    );
  }
}
