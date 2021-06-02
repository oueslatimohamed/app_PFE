import 'package:flutter/material.dart';
import 'package:talebcom_app/Screen/details/detail_screen.dart';
import 'package:talebcom_app/Screen/profile/component/edit_annonce.dart';
import 'package:talebcom_app/Screen/profile/component/myannonce_card.dart';
import 'package:talebcom_app/Services/getData.dart';
import 'package:talebcom_app/Services/sendData.dart';
import 'package:talebcom_app/constant.dart';
import 'package:talebcom_app/models/annonce.dart';

class MyAnnonceScreen extends StatefulWidget {
  @override
  _MyAnnonceScreenState createState() => _MyAnnonceScreenState();
}

class _MyAnnonceScreenState extends State<MyAnnonceScreen> {
  GetData getData = GetData();
  SendData sendData = SendData();
  List<Annonce> myAnnonces = [];
  Future<void> fetchMyannonces() async {
   myAnnonces= await getData.fetchMyAnnonces();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes Annonces",style:  TextStyle(fontFamily: "Montserrat",color: theredColor)),

        backgroundColor: Color(0xFFEAEAED),
        leading: IconButton(icon:Icon(Icons.arrow_back_ios_outlined),color: theredColor,onPressed: (){
          Navigator.pop(context);
        },),
        elevation: 2,
      ),
      body: FutureBuilder(
        future: fetchMyannonces(),
        builder: (context,snapshot){
          return ListView.builder(
              itemCount: myAnnonces.length,
              itemBuilder: (context, index){
                return MyAnnonceCard(annonce: myAnnonces[index],press: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailScreen(annonce: myAnnonces[index])),
                  );
                },
                  delete: () {
                  sendData.deletemyannonce(myAnnonces[index].id.toString());
                  setState(() {
                    myAnnonces[index];
                  });
                  },
                  edit: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditAnnonce(annonce: myAnnonces[index])),
                    );
                  },
                );
              });
        },
      ),
    );
  }
}
