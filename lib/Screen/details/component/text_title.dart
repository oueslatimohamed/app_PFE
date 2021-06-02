import 'package:flutter/material.dart';
import 'package:talebcom_app/constant.dart';

class TextTitle extends StatelessWidget {
  final String text;

  TextTitle({this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text,style:
          TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.bold,fontSize: 15,color: theredColor),),
        Container(
          width: 25,
          height: 2,
          color: primaryColor,
        )
      ],
    );
  }
}
