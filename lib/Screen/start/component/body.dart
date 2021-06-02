import 'package:flutter/material.dart';
import 'package:talebcom_app/Component/default_button.dart';
import 'package:talebcom_app/Component/second_button.dart';
import 'package:talebcom_app/Screen/login/login_screen.dart';
import 'package:talebcom_app/Screen/signup/signup_screen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void press(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png",width: 100,height: 100),
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.only(left: 15,right: 15),
              child: DefaultButton(text: "Se connecter",press: press),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(left: 15,right: 15),
              child: SecondButton(text: "S'inscrire",press: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
