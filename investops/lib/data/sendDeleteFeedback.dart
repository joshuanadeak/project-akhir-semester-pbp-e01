import 'package:http/http.dart' as http;

Future<bool> sendDeleteFeedback(id) async {
  var url = Uri.parse('https://investops.up.railway.app/suggestionbox/deleteFeedbackFlutter/');
  // var url = Uri.parse('http://localhost:8000/suggestionbox/deleteFeebdackFlutter/');
  Map<String, String> requestBody = {
    'id': id,
  };
  var request = http.MultipartRequest('POST', url)..fields.addAll(requestBody);
  var response = await request.send();

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}