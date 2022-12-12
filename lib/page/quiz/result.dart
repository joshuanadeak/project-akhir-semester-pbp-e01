import 'package:flutter/material.dart';
import 'package:investops/page/login.dart';
import 'package:investops/page/mainpage.dart';
import 'package:investops/page/quiz/quiz.dart';

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
          child: Column(
        children: [
          const Spacer(flex: 1),
          Text(
            "Thank you for taking the quiz, $nama", //tambahin nama
            style: const TextStyle(
                color: Colors.white, fontFamily: 'Alexandria', fontSize: 18),
          ),
          const Spacer(flex: 1),
          const Text(
            "Result", //tambahin nama
            style: TextStyle(
                color: Colors.white, fontFamily: 'Alexandria', fontSize: 24),
          ),
          Text(
            "$nilaiKuis/100", //tambahin score
            style: const TextStyle(
                color: Color.fromARGB(255, 74, 229, 154),
                fontFamily: 'Alexandria',
                fontSize: 32),
          ),
          const Spacer(flex: 1),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 74, 229, 154),
              padding: const EdgeInsets.all(16.0),
              textStyle: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            child: const Text('Home'),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyMainPage()),
              );
            }, // on pressed leads to quiz.
          ),
          const Spacer(flex: 1)
        ],
      )),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:investops/page/login.dart';
// import 'package:investops/page/mainpage.dart';
// import 'package:investops/page/quiz/quiz.dart';

// import '../drawer.dart';

// class ResultPage extends StatefulWidget {
//   const ResultPage({Key? key}) : super(key: key);

//   @override
//   State<ResultPage> createState() => _ResultPageState();
// }

// class _ResultPageState extends State<ResultPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Result Quiz'),
//       ),
//       drawer: const UniversalDrawer(),
//       body: Center(
//           child: Column(
//         children: [
//           const Spacer(flex: 2),
//           Text(
//             "Thank you for taking the quiz, $nama", //tambahin nama
//             style: const TextStyle(
//                 color: Colors.white, fontFamily: 'Alexandria', fontSize: 18),
//           ),
//           const Spacer(),
//           const Text(
//             "Result", //tambahin nama
//             style: TextStyle(
//                 color: Colors.white, fontFamily: 'Alexandria', fontSize: 24),
//           ),
//           Text(
//             "$nilaiKuis", //tambahin score
//             style: const TextStyle(
//                 color: Colors.white, fontFamily: 'Alexandria', fontSize: 32),
//           ),
//           TextButton(
//             style: TextButton.styleFrom(
//               backgroundColor: const Color.fromARGB(255, 74, 229, 154),
//               padding: const EdgeInsets.all(16.0),
//               textStyle: const TextStyle(fontSize: 20, color: Colors.white),
//             ),
//             child: const Text('Home'),
//             onPressed: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => const MyMainPage()),
//               );
//             }, // on pressed leads to quiz.
//           ),
//         ],
//       )),
//     );
//   }
// }
