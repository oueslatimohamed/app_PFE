import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talebcom_app/constant.dart';

class CardDetail extends StatelessWidget {
  const CardDetail({
    this.text,
    this.icon,
  });

  final String text, icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          //color: Color(0xFF000000),
        ),

        child: Row(
          children: [
           Container(
             height: 40,
             width: 40,
             padding: EdgeInsets.all(5),
             decoration: BoxDecoration(
               color: fourColor,
               borderRadius: BorderRadius.circular(8)
             ),
             child:  SvgPicture.asset(
               icon,
               color: primaryColor,
               width: 22,
             ),
           ),
            SizedBox(width: 20),
            Expanded(child: Text(text,style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.w600,fontSize: 15,color: theredColor),)),
          ],
        ),
      ),
    );
  }
}
