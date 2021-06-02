import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talebcom_app/constant.dart';

class SpecialOffre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: (){},
        child: SizedBox(
          width: 300,
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/car.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset("assets/images/star.svg",color: fourColor,),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        primaryColor.withOpacity(0.8),
                        fourColor.withOpacity(0),
                      ],
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Covoiturage du \n Sousse a Tunis",style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white
                      ),),
                      Text("10 DT",style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white
                      ),)
                    ],
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
