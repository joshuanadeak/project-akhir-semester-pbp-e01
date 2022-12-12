import 'package:http/http.dart' as http;

Future<bool> checkAdmin(username) async {
  var url = Uri.parse('https://investops.up.railway.app/suggestionbox/checkAdmin/');
  // var url = Uri.parse('http://localhost:8000/suggestionbox/checkAdmin/');
  Map<String, String> requestBody = {
    'username': username,
  };
  var request = http.MultipartRequest('POST', url)..fields.addAll(requestBody);
  var response = await request.send();

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}