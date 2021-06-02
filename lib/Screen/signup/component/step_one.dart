import 'package:flutter/material.dart';
import 'package:talebcom_app/Component/default_button.dart';
import 'package:talebcom_app/Screen/signup/component/step_two.dart';
import 'package:talebcom_app/constant.dart';
import 'package:talebcom_app/models/user.dart';

class StepOne extends StatelessWidget {
 final User user = new User();
  //StepOne({this.user});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    bool _autoValidator = false;
    TextEditingController _nameCtrl = TextEditingController();
    TextEditingController _lastnameCtrl = TextEditingController();
    TextEditingController _emailCtrl = TextEditingController();
    TextEditingController _passwordCtrl = TextEditingController();



    return Form(
        key: _formKey,
        autovalidate: _autoValidator,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,

                child: TextFormField(
                  validator: (value) {
                    if(value.isEmpty){
                      return 'Remplir ce champs';
                    } else {return null;}
                  },
                  controller: _nameCtrl,
                  decoration: InputDecoration(
                    hintText: "Nom",
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
                ),),
                SizedBox(width: 20),
                Container(
                  width: MediaQuery.of(context).size.width / 2.2,
                  child: TextFormField(
                    validator: (value) {
                      if(value.isEmpty){
                        return 'Remplir ce champs';
                      } else {return null;}
                    },
                    controller: _lastnameCtrl,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Prénom",
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
                  ),),
              ],
            ),
            SizedBox(height: 18,),
            Container(
              child: TextFormField(
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
            ),
            SizedBox(height: 18,),
            Container(
              child: TextFormField(
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
            ),
            SizedBox(height: 18,),
            Container(
              height: 60,
              child: TextFormField(
                validator: (value) {
                  if(value.isEmpty){
                    return 'Remplir ce champs';
                  } else {return null;}
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Confirmer votre mot de passe",
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
            ),
            //SizedBox(height: 10,),
            Container(
              alignment: Alignment(1,0),
              width: 50,
              height: 100,
                child: FlatButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        user.name = _nameCtrl.text;
                        user.lastname = _lastnameCtrl.text;
                        user.email = _emailCtrl.text;
                        user.password = _passwordCtrl.text;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StepTwo(user: user)),
                        );
                      } else {
                        _autoValidator = true;
                      }
                    },
                    color: primaryColor,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      child: Icon(Icons.navigate_next_outlined,color: Colors.white,size: 40,),
                    )
                ),
            ),

          ],
        )
    );
  }
}
