import 'package:flutter/material.dart';
import 'package:investops/page/drawer.dart';
import 'package:flutter/services.dart';
import 'package:investops/page/suggestionBoxPage.dart';
import 'package:investops/data/sendSuggestion.dart';



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
  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suggestion Box'),
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
                  controller: _suggestion,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Suggestion',
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SuggestionBoxPage(),
                      ),);
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

