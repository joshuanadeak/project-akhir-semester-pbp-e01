import 'package:http/http.dart' as http;
import 'package:investops/page/login.dart';

Future<String> sendSuggestion(String feedback) async {
  var url = Uri.parse('https://investops.up.railway.app/suggestionbox/giveFeedback/');
  // var url = Uri.parse('http://localhost:8000/suggestionbox/giveFeedback/');
  if (nama == "") {
    nama = "Anonymous";
  }
  Map<String, String> requestBody = {
    'feedback': feedback,
    'username': nama,
  };
  var request = http.MultipartRequest('POST', url)..fields.addAll(requestBody);
  var response = await request.send();

  if (response.statusCode == 200) {
    return 'Feedback sent';
  } else {
    return 'Feedback not sent';
  }
}