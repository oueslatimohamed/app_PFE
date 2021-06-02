import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talebcom_app/constant.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
   this.text,
   this.icon,
    this.press,
  });

  final String text, icon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFFFFF6F4),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: primaryColor,
              width: 22,
            ),
            SizedBox(width: 20),
            Expanded(child: Text(text,style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.w600,fontSize: 15),)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
