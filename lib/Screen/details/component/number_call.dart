import 'package:flutter/material.dart';
import 'package:talebcom_app/constant.dart';
import 'package:talebcom_app/models/annonce.dart';
import 'package:url_launcher/url_launcher.dart';

class NumberCall extends StatelessWidget {
  Annonce annonce;

  NumberCall({this.annonce});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 250,
      decoration: BoxDecoration(color: fourColor,borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          SizedBox(width: 10,),
          Icon(Icons.call,size: 30,color: primaryColor,),
          SizedBox(width: 20,),
          InkWell(
            onTap: () async{
              await launch("tel:"+annonce.user.telephone);
            },
            child: Text(annonce.user.telephone,
              style: TextStyle(fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 18,color: primaryColor),),
          ),
        ],
      )
    );
  }
}
