// To parse this JSON data, do
//
//     final elearning = elearningFromJson(jsonString);

import 'dart:convert';

List<Elearning> elearningFromJson(String str) =>
    List<Elearning>.from(json.decode(str).map((x) => Elearning.fromJson(x)));

String elearningToJson(List<Elearning> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Elearning {
  Elearning({
    required this.id,
    required this.title,
    required this.user,
    required this.createdAt,
  });

  int id;
  String title;
  String user;
  String createdAt;

  factory Elearning.fromJson(Map<String, dynamic> json) => Elearning(
        id: json["id"],
        title: json["title"],
        user: json["user"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "user": user,
        "created_at": createdAt,
      };
}
