import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talebcom_app/constant.dart';
import 'package:talebcom_app/models/annonce.dart';

class AnnonceCard extends StatelessWidget {
  final Annonce annonce;
  Function press;
  Function add;
  AnnonceCard({this.annonce,this.press,this.add});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 150,
      child: InkWell(
          onTap: press,
          child: Container(
            height: 220,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 170,
                    padding: EdgeInsets.all(5),
                    decoration:ShapeDecoration(
                        image: DecorationImage(
                            image: NetworkImage(annonce.images[0]),
                            fit: BoxFit.fill),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.only(
                              topEnd: Radius.circular(8),
                              topStart: Radius.circular(8),
                            ))),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 5,left: 15),
                    alignment: Alignment.topLeft,
                    width: 200,
                    child: Text(annonce.title,maxLines: 2,textAlign: TextAlign.left,
                      style:TextStyle(fontFamily: "Montserrat",fontSize: 14,fontWeight: FontWeight.w600,color: theredColor) ,),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${annonce.price.toDouble()} DT",
                            style:TextStyle(fontFamily: "Montserrat",fontSize: 15,fontWeight: FontWeight.bold,color: theredColor)),
                        IconButton(icon: SvgPicture.asset("assets/images/heart.svg",color: theredColor), onPressed: add)
                      ],
                    ),
                  )

                ],
              ),
            ),
          )
      ),
    );

  }
}
