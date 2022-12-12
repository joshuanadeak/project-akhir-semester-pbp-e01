import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:investops/model/elearning.dart';

Future<List<Elearning>> fetchElearning() async {
  var url =
      Uri.parse('https://investops.up.railway.app/elearning/discussions/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object ToDo
  List<Elearning> listElearning = [];
  for (var d in data) {
    if (d != null) {
      listElearning.add(Elearning.fromJson(d));
    }
  }

  return listElearning;
}

Future<void> addIncome(String title) async {
  await http.post(
    Uri.parse('https://investops.up.railway.app/elearning/%20add_reply/'),
    headers: <String, String>{'Content-Type': 'application/json;charset=UTF-8'},
    body: jsonEncode(<String, dynamic>{
      'title': title,
    }),
  );
}
