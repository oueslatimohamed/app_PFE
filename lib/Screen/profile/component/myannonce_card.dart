import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talebcom_app/constant.dart';
import 'package:talebcom_app/models/annonce.dart';

class MyAnnonceCard extends StatelessWidget {
  Annonce annonce;
  Function press;
  Function delete;
  Function edit;

  MyAnnonceCard({this.annonce, this.press, this.delete, this.edit});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(15),
        height: 102,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              //offset: Offset(-1, -1), // changes position of shadow
            ),
          ],
        ),
        child: InkWell(
          onTap: press,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 80,
                child: AspectRatio(
                  aspectRatio: 0.88,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                    ),
                    child: Image.network(annonce.images[0],fit: BoxFit.cover,),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      child: Text(
                        annonce.title,
                        maxLines: 2,
                        style: TextStyle(
                            color: theredColor,
                            fontSize: 10,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            "${annonce.price} DT",
                            style: TextStyle(
                                color: theredColor,
                                fontSize: 15,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(width: 60),
                        IconButton(icon: SvgPicture.asset("assets/images/delete.svg"), onPressed:delete),
                        IconButton(icon: SvgPicture.asset("assets/images/edit.svg"), onPressed:edit)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
