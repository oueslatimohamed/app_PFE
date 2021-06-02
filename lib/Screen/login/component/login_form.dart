import 'package:flutter/material.dart';
import 'package:talebcom_app/Component/bottom_bar_navigation.dart';
import 'package:talebcom_app/Component/default_button.dart';
import 'package:talebcom_app/Screen/home/home_screen.dart';
import 'package:talebcom_app/Services/authService.dart';
import 'package:talebcom_app/constant.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidator = false;
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();

  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        autovalidate: _autoValidator,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              validator: (value) {
                if(value.isEmpty){
                  return 'Remplir ce champs';
                } else {return null;}
              },
              controller: _emailCtrl,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Entrer votre E-mail",
                hintStyle: TextStyle(fontFamily: "Montserrat",fontSize: 18,color: secondColor),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                    color: Colors.red,
                    width: 1,
                    style: BorderStyle.solid
                ),borderRadius: BorderRadius.circular(16)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                    color: Colors.red,
                    width: 1,
                    style: BorderStyle.solid
                ),borderRadius: BorderRadius.circular(16)),
              ),
            ),
            SizedBox(height: 18,),
            TextFormField(
              validator: (value) {
                if(value.isEmpty){
                  return 'Remplir ce champs';
                } else {return null;}
              },
              controller: _passwordCtrl,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Mot de passe",
                hintStyle: TextStyle(fontFamily: "Montserrat",fontSize: 18,color: secondColor),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                    color: Colors.red,
                    width: 1,
                    style: BorderStyle.solid
                ),borderRadius: BorderRadius.circular(16)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                    color: Colors.red,
                    width: 1,
                    style: BorderStyle.solid
                ),borderRadius: BorderRadius.circular(16)),
              ),
            ),
            SizedBox(height: 10,),
            /*Container(
              alignment: Alignment(1,0),
              child: GestureDetector(
                onTap: () {
                },
                child: Text(
                  "Mot de passe oublié?",
                  style: TextStyle(fontFamily:"Montserrat",fontSize: 18,color: primaryColor,decoration: TextDecoration.underline),
                ),
              ),
            ),*/
            SizedBox(height: 30,),
            DefaultButton(text:"Se connecter",press:(){
              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BottomBarNavigation()),
              );*/
              if(_formKey.currentState.validate()){
                authService.signIn(_emailCtrl.text, _passwordCtrl.text, context);
              } else {
                setState(() {
                  _autoValidator = true;
                });
              }

            })

          ],
        )
    );
  }
}
