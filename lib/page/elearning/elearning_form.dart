import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class Addform extends StatefulWidget {
  const Addform({super.key});
  @override
  State<Addform> createState() => _AddformState();
}

class _AddformState extends State<Addform> {
  final _formKey = GlobalKey<FormState>();
  final List<String> typeChoices = <String>[
    'Very Good',
    'Good',
    'Mediocre',
    'Bad',
    'Very Bad'
  ];

  String title = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Testimoni Form"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(
                            top: 20, bottom: 20, right: 50, left: 50),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Title",
                          labelText: "Add new Discussion",
                          icon: const Icon(Icons.rate_review_rounded),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            title = value!;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            title = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Deskripsi tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                      ),
                      TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.reset();
                              String url =
                                  'https://investops.up.railway.app/elearning/%20add_reply/';
                              // var response = await http.post(Uri.parse('https://mypanel.up.railway.app/testimoni/create-ajax/'),
                              //  body: data,headers: {"Content-Type": "application/json"});
                              await request.post(url, {
                                "title": title,
                              });
                            }
                            // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            //     content: Text('Thank you for your response!')));
                            // Navigator.pop(context);
                          },
                          child: const Text(
                            'Save',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)),
                          )),
                    ]),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
