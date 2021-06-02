import 'package:flutter/material.dart';
import 'package:talebcom_app/Screen/details/detail_screen.dart';
import 'package:talebcom_app/Screen/favorite/component/favorite_card.dart';
import 'package:talebcom_app/Services/getData.dart';
import 'package:talebcom_app/Services/sendData.dart';
import 'package:talebcom_app/constant.dart';
import 'package:talebcom_app/models/annonce.dart';
import 'package:talebcom_app/models/wishlist.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GetData getData = GetData();
  SendData sendData = SendData();
  List <Wishlist>wishlist =[];
  Future<void> fetchTutos() async {
   wishlist = await getData.getWishList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Mes Favoris",style:  TextStyle(fontFamily: "Montserrat",color: theredColor)),
        centerTitle: true,
        backgroundColor: Color(0xFFEAEAED),
        leading: Container(),
        elevation: 2,
      ),
     body: Container(
       margin: EdgeInsets.all(15),
       child: FutureBuilder(
         future: fetchTutos(),
         builder: (context,snapshot){
           return ListView.builder(
             itemCount: wishlist.length,
             itemBuilder: (context, index) => Padding(
               padding: EdgeInsets.all(8),
               child: FavoriteCard(annonce: wishlist[index].annonce,press: (){
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => DetailScreen(annonce: wishlist[index].annonce)),
                 );
               },
                 delete: (){
                   sendData.deletefromwish(wishlist[index].annonce.id.toString());
                   setState(() {
                     wishlist[index];
                   });
                 },
               )
             ),
           );
         },
       )
     )

    );
  }
}
