import 'package:flutter/material.dart';
import 'package:talebcom_app/constant.dart';

class TextTitleF extends StatelessWidget {
  String text;

  TextTitleF({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      child: Text(text,style: TextStyle(
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w700,
        fontSize: 15,
        color: theredColor
      ),),
    );
  }
}
