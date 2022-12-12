import 'package:flutter/material.dart';
import 'package:investops/page/drawer.dart';
import 'package:investops/page/mainpage.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ElearningPage extends StatefulWidget {
  const ElearningPage({Key? key}) : super(key: key);

  @override
  State<ElearningPage> createState() => _ElearningPage();
}

class _ElearningPage extends State<ElearningPage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            color: Colors.white,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyMainPage()),
              );
            },
          ),
          title: const Text('Elearning'),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              height: 150,
              width: double.infinity,
              color: Color.fromARGB(255, 249, 250, 246),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: const TextSpan(
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'Alexandria'),
                        children: [
                          TextSpan(
                              text: "Trading vs Investing\n\n",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  "Having problems to differ between Trading and Investing?\nThis video will help you to understand the difference between them."),
                        ]),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Watch the video',
                          style: TextStyle(color: Colors.black),
                        )),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: 150,
              width: double.infinity,
              color: Color.fromARGB(255, 249, 250, 246),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: const TextSpan(
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'Alexandria'),
                        children: [
                          TextSpan(
                              text: "How Stock Market Works\n\n",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  "Curious about how stock market works?\nHere is the right place to discuss about it!"),
                        ]),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Watch the video',
                          style: TextStyle(color: Colors.black),
                        )),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: 150,
              width: double.infinity,
              color: Color.fromARGB(255, 249, 250, 246),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: const TextSpan(
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'Alexandria'),
                        children: [
                          TextSpan(
                              text: "Trading for Beginners\n\n",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  "New to trading?\nStart your journey here! We will teach you how to trade!"),
                        ]),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Watch the video',
                          style: TextStyle(color: Colors.black),
                        )),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
