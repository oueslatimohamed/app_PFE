import 'package:flutter/material.dart';
import 'package:talebcom_app/Component/default_button.dart';
import 'package:talebcom_app/Services/sendData.dart';
import 'package:talebcom_app/constant.dart';
import 'package:talebcom_app/models/user.dart';

class EditForm extends StatefulWidget {
  User user;
  EditForm({this.user});
  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  SendData sendData = SendData();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameCtrl = TextEditingController(text: widget.user.name);
    TextEditingController _lastNameCtrl = TextEditingController(text: widget.user.lastname);
    TextEditingController _emailCtrl = TextEditingController(text: widget.user.email);
    TextEditingController _passwordCtrl = TextEditingController(text: widget.user.password);
    TextEditingController _telCtrl = TextEditingController(text: widget.user.telephone);
    TextEditingController _adresseCtrl = TextEditingController(text: widget.user.adresse);
    TextEditingController _universityCtrl = TextEditingController(text: widget.user.university.name);
    return Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 18,),
            TextFormField(
              controller: _nameCtrl,
              decoration: InputDecoration(
                hintText: widget.user.name,
                hintStyle: TextStyle(fontFamily: "Montserrat",fontSize: 18,color: secondColor),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                    color: theredColor,
                    width: 1,
                    style: BorderStyle.solid
                ),borderRadius: BorderRadius.circular(16)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                    color: theredColor,
                    width: 1,
                    style: BorderStyle.solid
                ),borderRadius: BorderRadius.circular(16)),
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _lastNameCtrl,
              decoration: InputDecoration(
                hintText: "Prenom",
                hintStyle: TextStyle(fontFamily: "Montserrat",fontSize: 18,color: secondColor),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                    color: theredColor,
                    width: 1,
                    style: BorderStyle.solid
                ),borderRadius: BorderRadius.circular(16)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                    color: theredColor,
                    width: 1,
                    style: BorderStyle.solid
                ),borderRadius: BorderRadius.circular(16)),
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _emailCtrl,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "E-mail",
                hintStyle: TextStyle(fontFamily: "Montserrat",fontSize: 18,color: secondColor),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                    color: theredColor,
                    width: 1,
                    style: BorderStyle.solid
                ),borderRadius: BorderRadius.circular(16)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                    color: theredColor,
                    width: 1,
                    style: BorderStyle.solid
                ),borderRadius: BorderRadius.circular(16)),
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _passwordCtrl,
              keyboardType: TextInputType.number,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Mot de passe",
                hintStyle: TextStyle(fontFamily: "Montserrat",fontSize: 18,color: secondColor),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                    color: theredColor,
                    width: 1,
                    style: BorderStyle.solid
                ),borderRadius: BorderRadius.circular(16)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                    color: theredColor,
                    width: 1,
                    style: BorderStyle.solid
                ),borderRadius: BorderRadius.circular(16)),
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _telCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Tel",
                hintStyle: TextStyle(fontFamily: "Montserrat",fontSize: 18,color: secondColor),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                    color: theredColor,
                    width: 1,
                    style: BorderStyle.solid
                ),borderRadius: BorderRadius.circular(16)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                    color: theredColor,
                    width: 1,
                    style: BorderStyle.solid
                ),borderRadius: BorderRadius.circular(16)),
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _adresseCtrl,
              decoration: InputDecoration(
                hintText: "Adresse",
                hintStyle: TextStyle(fontFamily: "Montserrat",fontSize: 18,color: secondColor),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                    color: theredColor,
                    width: 1,
                    style: BorderStyle.solid
                ),borderRadius: BorderRadius.circular(16)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                    color: theredColor,
                    width: 1,
                    style: BorderStyle.solid
                ),borderRadius: BorderRadius.circular(16)),
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _universityCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Université",
                hintStyle: TextStyle(fontFamily: "Montserrat",fontSize: 18,color: secondColor),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                    color: theredColor,
                    width: 1,
                    style: BorderStyle.solid
                ),borderRadius: BorderRadius.circular(16)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                    color: theredColor,
                    width: 1,
                    style: BorderStyle.solid
                ),borderRadius: BorderRadius.circular(16)),
              ),
            ),
            SizedBox(height: 20,),
            DefaultButton(text: "Enregistrer",press: (){
              sendData.updateProfile(_nameCtrl.text,_lastNameCtrl.text,_telCtrl.text);
            },)

          ],
        )
    );
  }
}
