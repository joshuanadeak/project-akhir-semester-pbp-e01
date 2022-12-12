import 'package:http/http.dart' as http;
import 'package:investops/page/login.dart';

Future<String> sendReply(String reply, String id) async {
  var url = Uri.parse('https://investops.up.railway.app/suggestionbox/replyFeedback/'+id+'/');
  // var url = Uri.parse('http://localhost:8000/suggestionbox/replyFeedback/'+id+'/');
  Map<String, String> requestBody = {
    'reply': reply,
  };
  var request = http.MultipartRequest('POST', url)..fields.addAll(requestBody);
  var response = await request.send();

  if (response.statusCode == 200) {
    return 'Reply sent';
  } else {
    return 'Reply not sent';
  }
}