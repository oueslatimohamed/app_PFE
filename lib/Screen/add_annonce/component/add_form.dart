import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talebcom_app/Component/default_button.dart';
import 'package:talebcom_app/Screen/add_annonce/component/image_card.dart';
import 'package:talebcom_app/Services/sendData.dart';
import 'package:talebcom_app/constant.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

class AddForm extends StatefulWidget {
  @override
  _AddFormState createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  String _selectedCategorie;
  String _selectedRegion;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _titleCtrl = TextEditingController();
  TextEditingController _descriptionCtrl = TextEditingController();
  TextEditingController _prixCtrl = TextEditingController();
  TextEditingController _adresseCtrl = TextEditingController();
  SendData sendData = SendData();
  List data = []; //edited line
  List datas = []; //edited line

  File file,file1,file2,file3;



  void _choose() async {
    //file = await ImagePicker.pickImage(source: ImageSource.camera);
    file = await ImagePicker.pickImage(source: ImageSource.gallery);
  }
  void _choose1() async {
    //file = await ImagePicker.pickImage(source: ImageSource.camera);
    file1 = await ImagePicker.pickImage(source: ImageSource.gallery);
  }
  void _choose2() async {
    //file = await ImagePicker.pickImage(source: ImageSource.camera);
    file2 = await ImagePicker.pickImage(source: ImageSource.gallery);
  }
  void _choose3() async {
    //file = await ImagePicker.pickImage(source: ImageSource.camera);
    file3 = await ImagePicker.pickImage(source: ImageSource.gallery);
  }


  Future<String> getSWData() async {
    var res = await http
        .get("http://10.0.2.2:8080/api/talebcom/allcategories");
    var resBody = json.decode(res.body)['data'];

    setState(() {
      data = resBody;
    });

    print(resBody);

    return "Sucess";
  }
  Future<String> getSWDatas() async {
    var res = await http
        .get("http://10.0.2.2:8080/api/talebcom/allregion");
    var resBody = json.decode(res.body)['data'];

    setState(() {
      datas = resBody;
    });

    print(resBody);

    return "Sucess";
  }
  @override
  void initState() {
    super.initState();
    this.getSWData();
    this.getSWDatas();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              child:Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageCard(press:(){_choose();},),
                  SizedBox(width: 8,),
                  ImageCard(press:(){_choose1();}),
                  SizedBox(width: 8,),
                  ImageCard(press:(){_choose2();}),
                  SizedBox(width: 8,),
                  ImageCard(press:(){_choose3();}),
                ],
              ),),
            SizedBox(height: 18,),
            TextFormField(
              controller: _titleCtrl,
              decoration: InputDecoration(
                hintText: "Nom de l'annonce",
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
              controller: _descriptionCtrl,
              decoration: InputDecoration(
                hintText: "Description",
                contentPadding: new EdgeInsets.symmetric(vertical: 58.0, horizontal: 10.0),
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
            InputDecorator(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(
                    color: theredColor,
                    width: 1,
                    style: BorderStyle.solid
                ),borderRadius: BorderRadius.circular(16)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  //isExpanded: true,
                  isDense: true, // Reduces the dropdowns height by +/- 50%
                  hint: Text("Categories",style: TextStyle(fontFamily: "Montserrat",fontSize: 18,color: secondColor),),
                  icon: Icon(Icons.keyboard_arrow_down),
                  value: _selectedCategorie,
                  items: data.map((item) {
                    return new DropdownMenuItem(
                      value: item['id'].toString(),
                      child: new Text(item['name']),
                    );
                  }).toList(),
                  onChanged: (selectedItem) => setState(() => _selectedCategorie = selectedItem,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            InputDecorator(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(
                    color: theredColor,
                    width: 1,
                    style: BorderStyle.solid
                ),borderRadius: BorderRadius.circular(16)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  //isExpanded: true,
                  isDense: true, // Reduces the dropdowns height by +/- 50%
                  hint: Text("Selectionner la région",style: TextStyle(fontFamily: "Montserrat",fontSize: 18,color: secondColor),),
                  icon: Icon(Icons.keyboard_arrow_down),
                  value: _selectedRegion,
                  items: datas.map((item) {
                    return new DropdownMenuItem(
                      value: item['id'].toString(),
                      child: new Text(item['name']),
                    );
                  }).toList(),
                  onChanged: (selectedItem) => setState(() => _selectedRegion = selectedItem,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _prixCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Prix",
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
              keyboardType: TextInputType.number,
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
              SizedBox(height: 20,),
              DefaultButton(text: "Publier",press: (){
                sendData.addAnnonce(_titleCtrl.text,
                    _descriptionCtrl.text,
                    _selectedCategorie,
                    _selectedRegion,
                    _adresseCtrl.text,
                    _prixCtrl.text,
                    context, file, file1, file2, file3);
              },)

          ],
        )
    );
  }

}


