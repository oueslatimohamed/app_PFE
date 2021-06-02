import 'package:flutter/material.dart';
import 'package:talebcom_app/models/annonce.dart';

class AnnonceTitle extends StatelessWidget {

  final Annonce annonce;

  AnnonceTitle({this.annonce});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(annonce.title,style: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 18,
          fontWeight: FontWeight.bold
      ),
      ),
    );
  }
}
