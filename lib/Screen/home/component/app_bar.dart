import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talebcom_app/Screen/filter/filter_screen.dart';
import 'package:talebcom_app/Screen/home/component/icon_counter.dart';

class HomeAppBar extends PreferredSize {

  Size get preferredSize => Size.fromHeight(80);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Container(margin: EdgeInsets.only(top: 15),child: Image.asset("assets/images/logo.png",width: 80,height: 50),),
      centerTitle: true,
      actions :<Widget>[
        /*Container(margin: EdgeInsets.only(top: 15 , left: 15,right: 15),child: IconBtnWithCounter(svgSrc: "assets/images/filter.svg",press: (){
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FilterScreen()),
            );
    }
        )),*/
      ],
      backgroundColor: Colors.white,
      elevation: 0.5,
    );
  }
}
