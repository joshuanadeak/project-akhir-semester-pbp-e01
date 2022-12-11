import 'package:flutter/material.dart';
import 'package:investops/data/fetchSuggestion.dart';
import 'package:investops/model/suggestionBox.dart';
import 'package:investops/page/drawer.dart';
import 'package:investops/form/suggestionForm.dart';
import 'package:investops/form/replyForm.dart';
import 'package:investops/page/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class SuggestionBoxPage extends StatefulWidget {
  const SuggestionBoxPage({super.key});

  @override
  State<SuggestionBoxPage> createState() => _SuggestionBoxPageState();
}

class _SuggestionBoxPageState extends State<SuggestionBoxPage> {
  late Future<List<FeedbackUser>> _futureFeedback;

  @override
  void initState() {
    super.initState();
    _futureFeedback = fetchSuggestion();
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suggestion Box'),
      ),
      drawer: const UniversalDrawer(),
      body: Center(
        child: FutureBuilder<List<FeedbackUser>>(
          future: _futureFeedback,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(snapshot.data![index].fields.feedback,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Color.fromARGB(255, 150, 252, 3),
                        ),),
                      subtitle: Text(snapshot.data![index].fields.reply,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 7,
                          color: Color.fromARGB(255, 150, 252, 3),
                        ),),
                      trailing: Text("From user : "+snapshot.data![index].fields.username),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: Color.fromARGB(255, 150, 252, 3),
                          width: 2,
                        ),
                      ),
                      onTap: () {
                        if (!request.loggedIn) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginPage()),);
                        } else {
                          if (nama == "TEST") {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => ReplyForm(id: snapshot.data![index].pk.toString(),)),);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('You are not an admin'),
                              ),
                            );
                          }
                        }
                      }, 
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                if (nama == "TEST") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('An admin cannot give suggestion'),
                    ),
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SuggestionForm()),);
                }
              },
              child: const Icon(Icons.add),
              backgroundColor: const Color.fromARGB(255, 150, 252, 3),
            ),
          ],
        ),
      ),
    );
  }
}
