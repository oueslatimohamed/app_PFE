import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talebcom_app/Component/default_button.dart';
import 'package:talebcom_app/Screen/add_annonce/component/image_card.dart';
import 'package:talebcom_app/Services/authService.dart';
import 'package:talebcom_app/constant.dart';

class UploadPhoto extends StatefulWidget {
  @override
  _UploadPhotoState createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  AuthService authService = AuthService();
  File file;
  void _choose() async {
    //file = await ImagePicker.pickImage(source: ImageSource.camera);
    file = await ImagePicker.pickImage(source: ImageSource.gallery);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Importer une photo",style:  TextStyle(fontFamily: "Montserrat",color: theredColor)),
        backgroundColor: Color(0xFFEAEAED),
        leading: IconButton(icon:Icon(Icons.arrow_back_ios_outlined),color: theredColor,onPressed: (){
          Navigator.pop(context);
        },),
        elevation: 2,
      ),
      body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Container(
              alignment: Alignment.center,
              child: ImageCard(press: (){
                _choose();
              },),
            ),
            SizedBox(height: 20,),
            Text("Importer une photo",style:  TextStyle(fontFamily: "Montserrat",fontSize:14,fontWeight:FontWeight.bold,color: theredColor)),
            SizedBox(height: 20,),
            Container(
              width: 200,
              child: DefaultButton(text:"Confirmer",press: (){
                authService.updateProfile(file, context);
              },),
            )
          ],
        ),
    );
  }
}
