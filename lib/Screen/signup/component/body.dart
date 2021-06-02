import 'package:flutter/material.dart';
import 'package:talebcom_app/Screen/signup/component/step_one.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 80,),
            Image.asset("assets/images/logo.png",width: 200,height: 100),
            SizedBox(height: 30,),
            Text("Bienvenue sur ET'Expo",
              style:TextStyle(fontFamily:"Montserrat",fontWeight: FontWeight.bold,fontSize: 22,color: Colors.black),),
            SizedBox(height: 30,),
            Container(
            margin: EdgeInsets.only(left: 15,right: 15),
              child : StepOne()
          )
          ]
        )
      )
    );
  }
}
