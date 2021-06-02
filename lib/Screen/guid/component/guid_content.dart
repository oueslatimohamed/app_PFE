import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talebcom_app/constant.dart';

class GuidContent extends StatelessWidget {
  final String title,text,image;
  const GuidContent({this.title,this.text,this.image});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment(0,0),
          margin: EdgeInsets.only(top: 50),
          child: Image.asset(image,
            height: 300,
            width: 300,),
        ),
        SizedBox(height: 20,),
        Container(
          margin: EdgeInsets.only(left: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: primaryColor,
                ),),
              Text(text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: secondColor
                ),),
            ],
          ),
        ),

      ],
    );
  }
}
