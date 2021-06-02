import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talebcom_app/Component/default_button.dart';
import 'package:talebcom_app/Screen/login/login_screen.dart';
import 'package:talebcom_app/Services/authService.dart';
import 'package:talebcom_app/constant.dart';
import 'package:talebcom_app/models/categories.dart';
import 'package:talebcom_app/models/user.dart';

class StepThree extends StatefulWidget {
   User user;
  File file;

  StepThree({this.user,this.file});

  @override
  _StepThreeState createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> {
  int selectedIndex;
  AuthService authService = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment(-1,0),
                child: IconButton(icon: Icon(Icons.arrow_back_ios_outlined), onPressed: (){}),
              ),
              SizedBox(height: 20,),
              Image.asset("assets/images/logo.png",width: 200,height: 100),
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.all(15),
                child: Text("Quel service vous intéresse le plus?",
                  style:TextStyle(fontFamily:"Montserrat",fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),
              ),
              //SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left:15 , right: 15),
                height: 410,
                child: GridView.builder(
                  itemCount: categorysMenu.length,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2
                  ),
                  itemBuilder: (BuildContext context, int position) {
                    return InkWell(
                      onTap: () => setState(() => selectedIndex = position),
                      child: Container(
                        width: 150,
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          elevation: 5,
                          color: (selectedIndex == position) ? selectColor : null,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Image.asset(categorysMenu[position].image),
                              Text(categorysMenu[position].name,style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15
                              ),)
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: DefaultButton(text: "J'ai terminé",
                    press:(){
                      //print(selectedIndex+1);
                      int _select = selectedIndex+1;
                      //print(widget.user.university);
                      authService.signUp(widget.user.name,
                          widget.user.lastname,widget.user.email,
                          widget.user.password,
                          widget.file,
                          widget.user.telephone,
                          widget.user.date,
                          _select.toString(),
                          widget.user.universitys, context);
                    }),
              )
            ],
          ),
        )
    );
  }
}


  List<Category> categorysMenu = [
    Category(image: "assets/images/g5.png",name: "Location"),
    Category(image: "assets/images/g6.png",name: "Colocation"),
    Category(image: "assets/images/g4.png",name: "Covoiturage"),
    Category(image: "assets/images/g7.png",name: "Recup"),
  ];

