import 'dart:convert';

import 'package:talebcom_app/models/university.dart';

class User {
  int id;
  String image;
  String name;
  String lastname;
  String email;
  String password;
  String date;
  String adresse;
  String telephone;
  University university;
  String universitys;
  String interested;

  User({this.id,this.image,this.name, this.lastname, this.email, this.password, this.date,
      this.adresse, this.telephone, this.university,this.universitys, this.interested});
  factory User.fromJson(Map<String , dynamic> json) {
    return User(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      lastname: json['lastname'],
      email: json['email'],
      telephone: json['tel'].toString(),
      adresse: json['adresse'],
      university: University.fromJson(json['univercity'])
    );
  }
}