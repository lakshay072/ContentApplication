// To parse this JSON data, do
//
//     final samplePosts = samplePostsFromJson(jsonString);

import 'dart:convert';

List<SamplePosts> samplePostsFromJson(String str) => List<SamplePosts>.from(json.decode(str).map((x) => SamplePosts.fromJson(x)));

String samplePostsToJson(List<SamplePosts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SamplePosts {
  SamplePosts({
    required this.id,
    required this.guid,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  int id;
  String guid;
  String name;
  String email;
  String phone;
  String password;

  factory SamplePosts.fromJson(Map<String, dynamic> json) => SamplePosts(
    id: json["id"],
    guid: json["guid"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "guid": guid,
    "name": name,
    "email": email,
    "phone": phone,
    "password": password,
  };
}
