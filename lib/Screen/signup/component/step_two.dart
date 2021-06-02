import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talebcom_app/Component/default_button.dart';
import 'package:talebcom_app/Screen/add_annonce/component/image_card.dart';
import 'package:talebcom_app/Screen/signup/component/step_three.dart';
import 'package:talebcom_app/constant.dart';
import 'package:talebcom_app/models/user.dart';
import 'package:http/http.dart' as http;

class StepTwo extends StatefulWidget {
   User user;

  StepTwo({this.user});
  @override
  _StepTwoState createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateCtrl = TextEditingController();
  TextEditingController _adresseCtrl = TextEditingController();
  TextEditingController _telCtrl = TextEditingController();
  //TextEditingController _universityCtrl = TextEditingController();
  String _selectedCategorie;
  bool _autoValidator = false;
  List data = [];
  File file;

  Future<String> getSWData() async {
    var res = await http
        .get("http://10.0.2.2:8080/api/talebcom/alluniversitys");
    var resBody = json.decode(res.body)['data'];

    setState(() {
      data = resBody;
    });

    print(resBody);

    return "Sucess";
  }
  @override
  void initState() {
    super.initState();
    this.getSWData();
    //_selectedCategorie = "";

  }
  void _choose() async {
    //file = await ImagePicker.pickImage(source: ImageSource.camera);
    file = await ImagePicker.pickImage(source: ImageSource.gallery);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              autovalidate: _autoValidator,
              child: Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Image.asset("assets/images/logo.png",width: 200,height: 100),
                    SizedBox(height: 30,),
                    Text("Bienvenue sur ET'Expo",
                      style:TextStyle(fontFamily:"Montserrat",fontWeight: FontWeight.bold,fontSize: 22,color: Colors.black),),
                    SizedBox(height: 18,),
                   ImageCard(press: (){_choose();},),
                    SizedBox(height: 10,),
                    Text("Ajouter une photo",
                        style:TextStyle(fontFamily:"Montserrat",fontWeight: FontWeight.normal,fontSize: 14)),
                    SizedBox(height: 18,),
                    DateTimeField(
                      validator: (value) {
                        if(value==""){
                          return 'Remplir ce champs';
                        } else {return null;}
                      },
                      controller: _dateCtrl,
                      format:DateFormat('yyyy-MM-dd'),
                      onShowPicker: (context, currentValue) {
                        return showDatePicker(
                            firstDate: DateTime(1900),
                            initialDate: DateTime.now(),
                            lastDate: DateTime(DateTime.now().year + 1),
                            context: context
                        );
                      },
                      decoration: InputDecoration(
                        hintText: "Date de naissance",
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
                    SizedBox(height: 18,),
                    TextFormField(
                      validator: (value) {
                        if(value.isEmpty){
                          return 'Remplir ce champs';
                        } else {return null;}
                      },
                      controller: _adresseCtrl,
                      decoration: InputDecoration(
                        hintText: "Adresse",
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
                    SizedBox(height: 18,),
                    TextFormField(
                      validator: (value) {
                        if(value.isEmpty || value.length != 8){
                          return 'Remplir ce champs';
                        } else {return null;}
                      },
                      controller: _telCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Numéro de télèphone",
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
                    SizedBox(height: 18,),
                    InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(
                            color: primaryColor,
                            width: 1,
                            style: BorderStyle.solid
                        ),borderRadius: BorderRadius.circular(16)),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          isDense: true, // Reduces the dropdowns height by +/- 50%
                          hint: Text("University",style: TextStyle(fontFamily: "Montserrat",fontSize: 18,color: secondColor),),
                          icon: Icon(Icons.keyboard_arrow_down),
                          value: _selectedCategorie,
                          items: data.map((item) {
                            return new DropdownMenuItem(
                              value: item['id'].toString(),
                              child: Text(item['name']),
                            );
                          }).toList(),
                          onChanged: (newVal) {
                            setState(() {
                              _selectedCategorie = newVal;

                            });
                          },
                          ),
                        ),
                      ),


                    SizedBox(height: 18,),
                    Container(

                      height: 60,
                      alignment: Alignment.bottomRight,
                      child: DefaultButton(press: (){
                        if(_formKey.currentState.validate()){
                          widget.user.date = _dateCtrl.text;
                          widget.user.adresse = _adresseCtrl.text;
                          widget.user.telephone = _telCtrl.text;
                          widget.user.universitys = _selectedCategorie;
                          //print("_selectedCategorie");

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => StepThree(user: widget.user,file: file,)),
                          );} else{
                          setState(() {
                            _autoValidator = true;
                          });
                        }
                      },text: "Je m'inscris",)
                    ),

                  ],
                ),
              )
          ),
        )
    );

  }
}


