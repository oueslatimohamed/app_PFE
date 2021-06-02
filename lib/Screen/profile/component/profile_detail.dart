import 'package:flutter/material.dart';
import 'package:talebcom_app/Component/default_button.dart';
import 'package:talebcom_app/Screen/profile/component/card_detail.dart';
import 'package:talebcom_app/Screen/profile/component/edit_button.dart';
import 'package:talebcom_app/Screen/profile/component/edit_screen.dart';
import 'package:talebcom_app/Services/authService.dart';
import 'package:talebcom_app/constant.dart';
import 'package:talebcom_app/models/user.dart';

class ProfileDetail extends StatefulWidget {
  @override
  _ProfileDetailState createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Détails du profil",style:  TextStyle(fontFamily: "Montserrat",color: theredColor)),
        backgroundColor: Color(0xFFEAEAED),
        leading: IconButton(icon:Icon(Icons.arrow_back_ios_outlined),color: theredColor,onPressed: (){
          Navigator.pop(context);
        },),
        elevation: 2,
      ),
      body:  FutureBuilder<User>(
        future: authService.getCurrentUser(),
    builder: (BuildContext context, AsyncSnapshot snapshot){
    if(snapshot.connectionState == ConnectionState.done)
    {
      User user = snapshot.data;
      return  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            CardDetail(icon: "assets/images/profile.svg",text: user.name + " "+user.lastname,),
            CardDetail(icon: "assets/images/email.svg",text: user.email),
            CardDetail(icon: "assets/images/phone.svg",text: "+216 "+user.telephone,),
            CardDetail(icon: "assets/images/location.svg",text: user.adresse,),
            CardDetail(icon: "assets/images/adresse.svg",text: user.university.name,),
            Container(
              width: 200,
              child: DefaultButton(text: "Modifier",press: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditScreen(user: user,)),
                );
              },),
            )
          ],
        ),
      );
    }else{
      return Container();
    }
    }
      )
    );
  }

}
