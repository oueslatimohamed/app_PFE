import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talebcom_app/constant.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    this.svgSrc,
    this.press,
  });

  final String svgSrc;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: press,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            padding: EdgeInsets.all(6),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: fourColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: SvgPicture.asset(svgSrc,color: primaryColor,),
          ),
        ],
      ),
    );
  }
}