import 'package:flutter/material.dart';
import 'package:talebcom_app/constant.dart';


class DefaultButton extends StatelessWidget {
  final String text;
  final Function press;
  const DefaultButton({this.text,this.press});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: primaryColor,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.normal,
            fontSize: 20,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
