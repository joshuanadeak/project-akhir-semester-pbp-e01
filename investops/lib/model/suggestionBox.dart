import 'dart:convert' as convert;

class FeedbackUser {
  FeedbackUser ({
    required this.pk,
    required this.fields,
  });

  int pk;
  Fields fields;
  
  factory FeedbackUser.fromJson(String str) => FeedbackUser.fromMap(convert.json.decode(str));

  String toJson() => convert.json.encode(toMap());

  factory FeedbackUser.fromMap(Map<String, dynamic> json) => FeedbackUser(
    pk: json["pk"],
    fields: Fields.fromMap(json["fields"]),
  );

  Map<String, dynamic> toMap() => {
    "pk": pk,
    "fields": fields.toMap(),
  };
}

class Fields {
  Fields({
    required this.feedback,
    required this.reply,
    required this.user,
    required this.username,
  });

  String feedback;
  String reply;
  int user;
  String username;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    feedback: json["feedback"],
    reply: json["reply"],
    user: json["user"],
    username: json["username"],
  );

  Map<String, dynamic> toMap() => {
    "feedback": feedback,
    "reply": reply,
    "user": user,
    "username": username,
  };

  factory Fields.fromMap(Map<String, dynamic> json) => Fields(
    feedback: json["feedback"],
    reply: json["reply"],
    user: json["user"],
    username: json["username"],
  );
}