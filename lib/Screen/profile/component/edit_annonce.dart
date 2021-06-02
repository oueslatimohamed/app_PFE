import 'package:flutter/material.dart';
import 'package:talebcom_app/Component/default_button.dart';
import 'package:talebcom_app/Screen/profile/component/my_annonce.dart';
import 'package:talebcom_app/Services/sendData.dart';
import 'package:talebcom_app/constant.dart';
import 'package:talebcom_app/models/annonce.dart';


class EditAnnonce extends StatefulWidget {
  Annonce annonce;

  EditAnnonce({this.annonce});

  @override
  _EditAnnonceState createState() => _EditAnnonceState();
}

class _EditAnnonceState extends State<EditAnnonce> {
  SendData sendData = SendData();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController _titleCtrl = TextEditingController(text: widget.annonce.title);
    TextEditingController _descriptionCtrl = TextEditingController(text: widget.annonce.description);
    TextEditingController _priceCtrl = TextEditingController(text: widget.annonce.price.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text("Modifier l'annonce",style:  TextStyle(fontFamily: "Montserrat",color: theredColor)),
        backgroundColor: Color(0xFFEAEAED),
        leading: IconButton(icon:Icon(Icons.arrow_back_ios_outlined),color: theredColor,onPressed: (){
          Navigator.pop(context);
        },),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 18,),
                  TextFormField(
                    controller: _titleCtrl,
                    decoration: InputDecoration(
                      hintText: widget.annonce.title,
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
                  TextFormField(
                    controller: _priceCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Price",
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
                  DefaultButton(text: "Modifier",press: (){
                    sendData.updateAnnonce(widget.annonce.id, _titleCtrl.text,
                        _descriptionCtrl.text, _priceCtrl.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyAnnonceScreen()),
                    );
                  },)

                ],
              )
          ),
        )
      ),
    );
  }
}
