import 'package:flutter/material.dart';
import 'package:talebcom_app/constant.dart';

class EditButton extends StatelessWidget {
  final String text;
  final Function press;
  const EditButton({this.text,this.press});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 50,
      child: FlatButton(
        shape: RoundedRectangleBorder(side:BorderSide(
            color: primaryColor,
            width: 1,
            style: BorderStyle.solid
        ),borderRadius: BorderRadius.circular(16)),
        color: Colors.white,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: primaryColor
          ),
        ),
      ),
    );
  }
}
