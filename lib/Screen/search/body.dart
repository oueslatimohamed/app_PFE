import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talebcom_app/Component/annonce_card.dart';
import 'package:talebcom_app/Screen/details/detail_screen.dart';
import 'package:talebcom_app/Screen/home/component/app_bar.dart';
import 'package:talebcom_app/Services/getData.dart';
import 'package:talebcom_app/constant.dart';
import 'package:talebcom_app/models/object.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();

}

class _BodyState extends State<Body> {
  GetData getData = GetData();
  List annoncess = [];
  SharedPreferences pref;
  Timer everyseconde;
  bool _disposed = false;
  Future<void> getToken() async {
    pref = await SharedPreferences.getInstance();
  }

  Future<void> fetchTutos() async {
    annoncess = await getData.searchAnnonces(pref.getString('val1'), pref.getString('val2'), pref.getString('val3'), pref.getString('val4'));
  }
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    getToken();
    annoncess;
    everyseconde = Timer.periodic(Duration(milliseconds: 400), (timer) {
      if(!_disposed){
        setState(() {
          annoncess;
        });
      }
    });
  }
  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Container(margin: EdgeInsets.only(top: 0),child: Image.asset("assets/images/logo.png",width: 80,height: 50),),
          centerTitle: true,
          actions :<Widget>[
            /*Container(margin: EdgeInsets.only(top: 15 , left: 15,right: 15),child: IconBtnWithCounter(svgSrc: "assets/images/filter.svg",press: (){
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FilterScreen()),
            );
    }
        )),*/
          ],
          leading: IconButton(icon:Icon(Icons.arrow_back_ios_outlined,color: theredColor,),onPressed: (){
            Navigator.pop(context);
          }),
          backgroundColor: Colors.white,
          elevation: 0.5,
        ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: fetchTutos(),
        builder: (context,snapshot){
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  child: Text("Annonces filtrées",
                    style:TextStyle(fontFamily:"Montserrat",fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black),),
                ),
                SizedBox(height: 0,),
                (annoncess.isEmpty)?Text("not found"):GridView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: annoncess.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (BuildContext context, int position) {
                    return AnnonceCard(annonce: annoncess[position],press: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailScreen(annonce: annoncess[position])),
                      );
                    },
                      add: (){

                      },);

                  },
                ),
              ],
            ),
          );
        },
      )
    );
  }
}
