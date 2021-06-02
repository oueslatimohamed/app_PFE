import 'dart:convert';
import 'dart:ffi';

import 'package:talebcom_app/models/categories.dart';
import 'package:talebcom_app/models/user.dart';

class Annonce {
  int id;
  List<dynamic> images;
  String title;
  String description;
  double price;
  String adresse;
  User user;
  String createdAt;
  String updatedAt;
  Category category;

  Annonce({this.id, this.images, this.title, this.description, this.price,
      this.adresse, this.user,this.createdAt, this.updatedAt,this.category});

  factory Annonce.fromJson(Map<String , dynamic> json) {

    return Annonce(
      id: json['id'],
      images: jsonDecode(json['images']),
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      adresse: json['adresse'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      user: User.fromJson(json['user']),
      category: Category.fromJson(json['category'])
    );
  }

}

