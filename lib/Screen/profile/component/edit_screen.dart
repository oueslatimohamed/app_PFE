import 'package:flutter/material.dart';
import 'package:talebcom_app/Screen/profile/component/edit_form.dart';
import 'package:talebcom_app/constant.dart';
import 'package:talebcom_app/models/user.dart';

class EditScreen extends StatefulWidget {
  User user;


  EditScreen({this.user});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Modifier",style:  TextStyle(fontFamily: "Montserrat",color: theredColor)),
        backgroundColor: Color(0xFFEAEAED),
        leading: IconButton(icon:Icon(Icons.arrow_back_ios_outlined),color: theredColor,onPressed: (){
          Navigator.pop(context);
        },),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child:Container(
          margin: EdgeInsets.all(15),
          child:  EditForm(user: widget.user,),
        )
      ),
    );
  }
}
