import 'package:flutter/material.dart';
import 'package:investops/page/drawer.dart';
import 'package:investops/page/suggestion_box_page.dart';
import 'package:investops/data/send_reply.dart';
import 'package:investops/data/send_delete_feedback.dart';

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
        title: const Text('Reply Box'),
      ),
      drawer: const UniversalDrawer(),
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
                  style: const TextStyle(color: Color.fromARGB(255, 150, 252, 3)),
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

                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => const SuggestionBoxPage()));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 150, 252, 3),
                      ),
                      child: const Text('Submit')
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => const SuggestionBoxPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 150, 252, 3),
                      ),
                      child: const Text('Back')
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 150, 252, 3),
                      ),
                      child: const Text('Delete')
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