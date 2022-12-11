import 'package:investops/model/suggestionBox.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future<String> sendSuggestion(String feedback) async {
  var url = Uri.parse('https://investops.up.railway.app/suggestionbox/giveFeedback/');
  Map<String, String> requestBody = {
    'feedback': feedback,
  };
  var request = http.MultipartRequest('POST', url)..fields.addAll(requestBody);
  var response = await request.send();

  if (response.statusCode == 200) {
    return 'Feedback sent';
  } else {
    return 'Feedback not sent';
  }
}