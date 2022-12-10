import 'package:flutter/material.dart';
import 'package:investops/page/drawer.dart';
import 'package:flutter/services.dart';
import 'package:investops/page/suggestionBoxPage.dart';

class ReplyForm extends StatefulWidget {
  const ReplyForm({super.key});

  @override
  State<ReplyForm> createState() => _ReplyFormState();
}

class Data {
  String reply;

  Data({required this.reply});
}

class _ReplyFormState extends State<ReplyForm> {
  final _formKey = GlobalKey<FormState>();
  final _reply = TextEditingController();
  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reply Box'),
      ),
      drawer: UniversalDrawer(),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _reply,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Reply',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2.0),
                    ),
                    labelStyle: TextStyle(color: Colors.green),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.green),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextFormField(
              //     controller: _username,
              //     decoration: const InputDecoration(
              //       border: OutlineInputBorder(),
              //       labelText: 'Username',
              //       enabledBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Colors.green, width: 2.0),
              //       ),
              //       labelStyle: TextStyle(color: Colors.green),
              //     ),
              //     validator: (value) {
              //       if (value == null || value.isEmpty) {
              //         return 'Please enter some text';
              //       }
              //       return null;
              //     },
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextFormField(
              //     controller: _password,
              //     decoration: const InputDecoration(
              //       border: OutlineInputBorder(),
              //       labelText: 'Password',
              //       enabledBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Colors.green, width: 2.0),
              //       ),
              //       labelStyle: TextStyle(color: Colors.green),
              //     ),
              //     validator: (value) {
              //       if (value == null || value.isEmpty) {
              //         return 'Please enter some text';
              //       }
              //       return null;
              //     },
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SuggestionBoxPage()));
                  },
                  child: const Text('Back'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}