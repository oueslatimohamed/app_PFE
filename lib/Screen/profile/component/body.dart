import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talebcom_app/Screen/profile/component/my_annonce.dart';
import 'package:talebcom_app/Screen/profile/component/profile_detail.dart';
import 'package:talebcom_app/Screen/profile/component/profile_menu.dart';
import 'package:talebcom_app/Screen/profile/component/profile_pic.dart';
import 'package:talebcom_app/Screen/profile/component/upload_photo.dart';
import 'package:talebcom_app/Services/authService.dart';
import 'package:talebcom_app/constant.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  AuthService authService = AuthService();
  File file;
  void _choose() async {
    //file = await ImagePicker.pickImage(source: ImageSource.camera);
    file = await ImagePicker.pickImage(source: ImageSource.gallery);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mon Profil",style:  TextStyle(fontFamily: "Montserrat",color: theredColor)),
        centerTitle: true,
        backgroundColor: Color(0xFFEAEAED),
        leading: Container(),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Container(
              alignment: Alignment.center,
              child: ProfilePic(press: (){
                //_choose();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UploadPhoto()),
                );
              },),
            ),
            SizedBox(height: 40,),
            ProfileMenu(text: "Mon Compte",press: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileDetail()),
              );
            },icon: "assets/images/profile.svg",),
            ProfileMenu(text: "Mes Annonces",press: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyAnnonceScreen()),
              );
            },icon: "assets/images/annonce.svg",),
            ProfileMenu(text: "Déconnexion",press: (){
              authService.logOut(context);
            },icon: "assets/images/logout.svg",),
          ],
        ),
      ),
    );
  }
}
