import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:investops/page/drawer.dart';
import 'package:flutter/services.dart';
import 'package:investops/page/suggestionBoxPage.dart';
import 'package:investops/data/sendReply.dart';
import 'package:investops/data/sendDeleteFeedback.dart';

class ReplyForm extends StatefulWidget {
  const ReplyForm({super.key, required this.id});
  final String id;

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
                      borderSide: BorderSide(color: Color.fromARGB(255, 150, 252, 3), width: 2.0),
                    ),
                    labelStyle: TextStyle(color: Color.fromARGB(255, 150, 252, 3)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  style: TextStyle(color: Color.fromARGB(255, 150, 252, 3)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Reply Submitted')),
                          );
                          sendReply(_reply.text, widget.id);
                          print(widget.id);

                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => const SuggestionBoxPage()));
                        }
                      },
                      child: const Text('Submit'),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 150, 252, 3),
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => const SuggestionBoxPage()));
                      },
                      child: const Text('Back'),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 150, 252, 3),
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        sendDeleteFeedback(widget.id);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => const SuggestionBoxPage()));
                      },
                      child: const Text('Delete'),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 150, 252, 3),
                      )
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}