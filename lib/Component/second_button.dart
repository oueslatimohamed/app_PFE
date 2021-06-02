import 'package:flutter/material.dart';
import 'package:talebcom_app/constant.dart';


class SecondButton extends StatelessWidget {
  final String text;
  final Function press;
  const SecondButton({this.text,this.press});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: FlatButton(
        shape: RoundedRectangleBorder(side:BorderSide(
            color: primaryColor,
            width: 1,
            style: BorderStyle.solid
        ),borderRadius: BorderRadius.circular(16)),
        color: Colors.transparent,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.normal,
            fontSize: 20,
            color: primaryColor
          ),
        ),
      ),
    );
  }
}
