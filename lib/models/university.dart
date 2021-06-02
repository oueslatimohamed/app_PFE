import 'dart:convert';
class University {
  int id;
  String name;

  University({this.id, this.name});

  factory University.fromJson(Map<String , dynamic> json) {
    return University(
        id: json['id'],
        name: json['name']
    );
  }
}