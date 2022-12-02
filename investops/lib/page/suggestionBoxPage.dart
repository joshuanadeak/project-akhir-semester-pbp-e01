import 'package:flutter/material.dart';
import 'package:investops/data/fetchSuggestion.dart';
import 'package:investops/model/suggestionBox.dart';
import 'package:investops/page/drawer.dart';


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
    return Scaffold(
      appBar: AppBar(
        title: Text('Suggestion Box'),
      ),
      drawer: UniversalDrawer(),
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
                      title: Text(snapshot.data![index].fields.feedback),
                      subtitle: Text(snapshot.data![index].fields.reply),
                      trailing: Text("From user : "+snapshot.data![index].fields.username),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Colors.green,
                          width: 2,
                        ),
                      ), 
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
    );
  }
}