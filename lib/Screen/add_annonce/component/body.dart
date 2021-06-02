import 'package:flutter/material.dart';
import 'package:talebcom_app/Screen/add_annonce/component/add_form.dart';
import 'package:talebcom_app/Screen/add_annonce/component/image_card.dart';
import 'package:talebcom_app/Screen/details/component/text_title.dart';
import 'package:talebcom_app/constant.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Nouvelle annonce",style:  TextStyle(fontFamily: "Montserrat",color: theredColor)),
        leading: IconButton(icon:Icon(Icons.arrow_back_ios_outlined,color: theredColor,),onPressed: (){
          Navigator.pop(context);
        }),
        backgroundColor: Color(0xFFEAEAED),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 30, left: 25),
              child:  Text("Sélectionner des images",
                  style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.bold,color: theredColor, fontSize: 20)),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: AddForm(),
            )
          ],
        ),
      )
    );
  }
}
