import 'package:investops/model/suggestion_box.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future<List<FeedbackUser>> fetchSuggestion() async {
  final response = await http.get(Uri.parse('https://investops.up.railway.app/suggestionbox/showJson/'));
  // final response = await http.get(Uri.parse('http://localhost:8000/suggestionbox/showJson/'));
  if (response.statusCode == 200) {
    final List<FeedbackUser> feedback = [];
    final List<dynamic> data = convert.jsonDecode(response.body);
    for (Map<String, dynamic> i in data) {
      feedback.add(FeedbackUser.fromMap(i));
    }
    return feedback;
  } else {
    throw Exception('Failed to load suggestion');
  }
}