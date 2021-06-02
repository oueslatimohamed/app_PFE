import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talebcom_app/constant.dart';

class ImageCard extends StatelessWidget {
  Function press;

  ImageCard({this.press});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
        onTap: press,
        child: Container(
          height: 75,
          width: 75,
          child: Container(
            padding: EdgeInsets.all(20),
                decoration:BoxDecoration(
                  color: Color(0xFFEAEAED),
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Container(
                  width: 20,
                  height: 20,
                  decoration:BoxDecoration(
                      color: Color(0xFFF4F5F6),
                      borderRadius: BorderRadius.circular(70)
                  ),
                  padding: EdgeInsets.all(5),
                  child: SvgPicture.asset("assets/images/camera.svg",width: 1,height: 1,),
                )
            ),

        )
      );
  }
}
