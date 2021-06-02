import 'package:talebcom_app/models/annonce.dart';
import 'package:talebcom_app/models/user.dart';

class Wishlist {
  int id;
  Annonce annonce;

  Wishlist({this.id, this.annonce});

  factory Wishlist.fromJson(Map<String , dynamic> json) {
    return Wishlist(
      id: json['id'],
      annonce: Annonce.fromJson(json['annonce']),
    );
  }
}