import 'package:flutter/material.dart';
import 'package:talebcom_app/constant.dart';
import 'package:talebcom_app/models/user.dart';

class HeadDiscussion extends StatelessWidget {
  User user;

  HeadDiscussion({this.user});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 10,),
      Container(
      height: 100,
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.black,
          image: DecorationImage(
              image: NetworkImage(user.image),
              fit: BoxFit.fill
          )
      ),
    ),
        SizedBox(height: 20,),
        Text(user.name + " "+user.lastname,
          style:TextStyle(fontFamily: "Montserrat",fontSize: 15,fontWeight: FontWeight.bold,
              color: theredColor) ,),
        Container(
          margin: EdgeInsets.only(top: 30,left: 30,right: 30,bottom: 15),
          width: double.infinity,
          height: 1,
          color: Color(0xFFFFD9D5),
        )
      ],
    );
  }
}
