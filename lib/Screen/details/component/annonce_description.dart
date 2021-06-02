import 'package:flutter/material.dart';
import 'package:talebcom_app/models/annonce.dart';

class AnnonceDescription extends StatelessWidget {
  final Annonce annonce;

  AnnonceDescription({this.annonce});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(annonce.description,style: TextStyle(
        fontFamily: "Montserrat",
        fontSize: 12,
        fontWeight: FontWeight.w700
      ),
      ),
    );
  }
}
