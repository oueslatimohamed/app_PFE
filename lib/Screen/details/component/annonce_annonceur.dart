import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:talebcom_app/constant.dart';
import 'package:talebcom_app/models/annonce.dart';

class AnnonceAnnonceur extends StatelessWidget {
  final Annonce annonce;

  AnnonceAnnonceur({this.annonce});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CircleAvatar(

            backgroundImage: NetworkImage(annonce.user.image)
            ),
          SizedBox(width: 20,),
          Text(annonce.user.name + " " + annonce.user.lastname,
          style: TextStyle(fontFamily: "Montserrat",
          fontWeight: FontWeight.bold,
          fontSize: 14,color: theredColor),)
        ],
      ),
    );
  }
}
