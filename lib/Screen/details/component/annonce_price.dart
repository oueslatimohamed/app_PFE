import 'package:flutter/material.dart';
import 'package:talebcom_app/constant.dart';
import 'package:talebcom_app/models/annonce.dart';

class AnnoncePrice extends StatelessWidget {
  final Annonce annonce;

  AnnoncePrice({this.annonce});

  @override
  Widget build(BuildContext context) {
    return Text(
      "${annonce.price} DT",
      style: TextStyle(
        fontFamily: "Montserrat",
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: primaryColor
      ),
    );
  }
}
