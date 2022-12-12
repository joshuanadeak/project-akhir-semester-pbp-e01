import 'package:flutter/material.dart';
import 'package:investops/main.dart';
import 'package:investops/page/drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:investops/page/quiz/result.dart';

class QuizFormPage extends StatefulWidget {
  const QuizFormPage({Key? key}) : super(key: key);

  @override
  State<QuizFormPage> createState() => _QuizFormPageState();
}

class _QuizFormPageState extends State<QuizFormPage> {
  late List<double> scores = [for (var i = 0; i < questions.length; i++) 0];
  late List<double> answerIndex = [
    for (var i = 0; i < questions.length; i++) 0
  ];
  var answerList = [];

  List<String> option1 = [
    "A type of farmers market where people buy and sell food",
    "A place where parts of businesses are bought and sold",
    "A special type of grocery store that sells stocks",
    "A type of bank that gives out loans to new businesses"
  ];

  List<String> option2 = ["Part", "Marker", "Stocker", "Share"];

  List<String> option3 = [
    "A share of ownership in a company",
    "Lending money to a company for a fixed interest payment",
    "A building on wall street",
    "An investment that cannot be traded"
  ];

  List<String> option4 = [
    "Itemized Public Organization",
    "Initial Primary Offering",
    "Initial Public Offering",
    "Imminent Profitable Option"
  ];

  List<String> option5 = [
    "Private company",
    "Public company",
    "Industry",
    "Portfolio"
  ];

  List<String> option6 = ["Index", "Investment", "Profit", "Dividend"];

  List<String> option7 = [
    "When one or two stocks drop significantly",
    "Slow decrease in stock prices over a year",
    "Rapid but anticipated drop in stock prices.",
    "Rapid and unanticipated drop in stock prices"
  ];

  List<String> option8 = [
    "NASDAQ & NYSE",
    "Dow Jones Industrial Average & S&P 500",
    "NYSE & American",
    "NASDAQ & DJIA"
  ];

  List<String> option9 = [
    "Yes",
    "No",
  ];

  List<String> option10 = [
    "DOW JONES",
    "S & P 500",
    "NASDAQ COMPOSITE",
    "P/E RATIO"
  ];

  String? answer;
  String? answer2;
  String? answer3;
  String? answer4;
  String? answer5;
  String? answer6;
  String? answer7;
  String? answer8;
  String? answer9;
  String? answer10;

  List<Map<String, Object>> questions = [
    {
      "id": 1,
      "question": "What is the stock market?",
      "options": [
        "A type of farmers market where people buy and sell food",
        "A place where parts of businesses are bought and sold",
        "A special type of grocery store that sells stocks",
        "A type of bank that gives out loans to new businesses"
      ],
      "answer index": "2",
    },
    {
      "id": 2,
      "question":
          "The name for a part of a business that is bought and sold on the stock market is",
      "options": ["Part", "Marker", "Stocker", "Share"],
      "answer index": "4",
    },
    {
      "id": 3,
      "question": "What is a bond?",
      "options": [
        "A share of ownership in a company",
        "Lending money to a company for a fixed interest payment",
        "A building on wall street",
        "An investment that cannot be traded"
      ],
      "answer index": "2",
    },
    {
      "id": 4,
      "question": "IPO stands for?",
      "options": [
        "Itemized Public Organization",
        "Initial Primary Offering",
        "Initial Public Offering",
        "Imminent Profitable Option"
      ],
      "answer index": "3",
    },
    {
      "id": 5,
      "question":
          "A company owned by families or a small number of investors and do not issue stock to the public is called",
      "options": ["Private company", "Public company", "Industry", "Portfolio"],
      "answer index": "1",
    },
    {
      "id": 6,
      "question":
          "A sum of money paid to shareholders of a corporation out of its earnings",
      "options": ["Index", "Investment", "Profit", "Dividend"],
      "answer index": "4",
    },
    {
      "id": 7,
      "question": "What is a stock market crash?",
      "options": [
        "When one or two stocks drop significantly",
        "Slow decrease in stock prices over a year",
        "Rapid but anticipated drop in stock prices.",
        "Rapid and unanticipated drop in stock prices"
      ],
      "answer index": "4",
    },
    {
      "id": 8,
      "question": "The two major stock exchanges are",
      "options": [
        "NASDAQ & NYSE",
        "Dow Jones Industrial Average & S&P 500",
        "NYSE & American",
        "NASDAQ & DJIA"
      ],
      "answer index": "1",
    },
    {
      "id": 9,
      "question": "Can interest rates affect the stock market?",
      "options": [
        "Yes",
        "No",
      ],
      "answer index": "1",
    },
    {
      "id": 10,
      "question": "Which of the following is NOT a stock index?",
      "options": ["DOW JONES", "S & P 500", "NASDAQ COMPOSITE", "P/E RATIO"],
      "answer index": "4",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 74, 229, 154),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            ListTile(
              title: Text("What is the stock market?"),
            ),
            for (var i = 0; i < 4; i++)
              RadioListTile(
                title: Text(option1[i]),
                value: option1[i],
                groupValue: answer,
                onChanged: (var v) {
                  setState(() {
                    answer = v;
                    answerList.add(answer);
                  });
                },
              ),
            ListTile(
              title: Text(
                  "The name for a part of a business that is bought and sold on the stock market is"),
            ),
            for (var i = 0; i < 4; i++)
              RadioListTile(
                title: Text(option2[i]),
                value: option2[i],
                groupValue: answer2,
                onChanged: (var v) {
                  setState(() {
                    answer2 = v;
                    answerList.add(answer2);
                  });
                },
              ),
            ListTile(
              title: Text("What is a bond?"),
            ),
            for (var i = 0; i < 4; i++)
              RadioListTile(
                title: Text(option3[i]),
                value: option3[i],
                groupValue: answer3,
                onChanged: (var v) {
                  setState(() {
                    answer3 = v;
                    answerList.add(answer3);
                  });
                },
              ),
            ListTile(
              title: Text("IPO stands for?"),
            ),
            for (var i = 0; i < 4; i++)
              RadioListTile(
                title: Text(option1[i]),
                value: option4[i],
                groupValue: answer4,
                onChanged: (var v) {
                  setState(() {
                    answer4 = v;
                    answerList.add(answer4);
                  });
                },
              ),
            ListTile(
              title: Text(
                  "A company owned by families or a small number of investors and do not issue stock to the public is called"),
            ),
            for (var i = 0; i < 4; i++)
              RadioListTile(
                title: Text(option1[i]),
                value: option5[i],
                groupValue: answer5,
                onChanged: (var v) {
                  setState(() {
                    answer5 = v;
                    answerList.add(answer5);
                  });
                },
              ),
            ListTile(
              title: Text(
                  "A sum of money paid to shareholders of a corporation out of its earnings"),
            ),
            for (var i = 0; i < 4; i++)
              RadioListTile(
                title: Text(option6[i]),
                value: option6[i],
                groupValue: answer6,
                onChanged: (var v) {
                  setState(() {
                    answer6 = v;
                    answerList.add(answer6);
                  });
                },
              ),
            ListTile(
              title: Text("What is a stock market crash?"),
            ),
            for (var i = 0; i < 4; i++)
              RadioListTile(
                title: Text(option7[i]),
                value: option7[i],
                groupValue: answer7,
                onChanged: (var v) {
                  setState(() {
                    answer7 = v;
                    answerList.add(answer7);
                  });
                },
              ),
            ListTile(
              title: Text("The two major stock exchanges are"),
            ),
            for (var i = 0; i < 4; i++)
              RadioListTile(
                title: Text(option8[i]),
                value: option8[i],
                groupValue: answer8,
                onChanged: (var v) {
                  setState(() {
                    answer8 = v;
                    answerList.add(answer8);
                  });
                },
              ),
            ListTile(
              title: Text("Can interest rates affect the stock market?"),
            ),
            for (var i = 0; i < 2; i++)
              RadioListTile(
                title: Text(option9[i]),
                value: option9[i],
                groupValue: answer9,
                onChanged: (var v) {
                  setState(() {
                    answer9 = v;
                    answerList.add(answer9);
                  });
                },
              ),
            ListTile(
              title: Text("Which of the following is NOT a stock index?"),
            ),
            for (var i = 0; i < 4; i++)
              RadioListTile(
                title: Text(option10[i]),
                value: option10[i],
                groupValue: answer10,
                onChanged: (var v) {
                  setState(() {
                    answer10 = v;
                    answerList.add(answer10);
                  });
                },
              ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 74, 229, 154),
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              child: const Text('Submit'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              }, // on pressed leads to quiz.
            ),
          ],
        )),
      ),
    );
  }
}
