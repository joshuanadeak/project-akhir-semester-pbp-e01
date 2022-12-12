import 'package:flutter/material.dart';
import 'package:investops/page/drawer.dart';
import 'package:investops/page/suggestion_box_page.dart';
import 'package:investops/data/send_suggestion.dart';



class SuggestionForm extends StatefulWidget {
  const SuggestionForm({super.key});

  @override
  State<SuggestionForm> createState() => _SuggestionFormState();
}

class Data {
  String feedback;

  Data({required this.feedback});
}

class _SuggestionFormState extends State<SuggestionForm> {
  final _formKey = GlobalKey<FormState>();
  final _suggestion = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suggestion Box'),
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
                  controller: _suggestion,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Suggestion',
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
                            const SnackBar(content: Text('We have received your suggestion!')),
                          );
                          sendSuggestion(_suggestion.text);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SuggestionBoxPage(),
                            ),);
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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SuggestionBoxPage(),
                          ),);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 150, 252, 3),
                      ),
                      child: const Text('Back')
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

