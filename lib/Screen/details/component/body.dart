import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:talebcom_app/Component/default_button.dart';
import 'package:talebcom_app/Screen/details/component/annonce_annonceur.dart';
import 'package:talebcom_app/Screen/details/component/annonce_description.dart';
import 'package:talebcom_app/Screen/details/component/annonce_images.dart';
import 'package:talebcom_app/Screen/details/component/annonce_price.dart';
import 'package:talebcom_app/Screen/details/component/annonce_title.dart';
import 'package:talebcom_app/Screen/details/component/number_call.dart';
import 'package:talebcom_app/Screen/details/component/text_title.dart';
import 'package:talebcom_app/Screen/details/component/top_rounded_container.dart';
import 'package:talebcom_app/Screen/home/component/categories.dart';
import 'package:talebcom_app/constant.dart';
import 'package:talebcom_app/models/annonce.dart';

class Body extends StatefulWidget {
  final Annonce annonce;

  Body({this.annonce});
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GoogleMapController mapController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  setState(() {

  });
  }
  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> _controller = Completer();

    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(36.79739197336492, 10.16313728128717),
      zoom: 7,
    );


    return ListView(
      children: [
        AnnonceImages(annonce: widget.annonce,),

        TopRoundedContainer(
          //color: Colors.black12,
            child: Container(
              margin: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: AnnoncePrice(annonce: widget.annonce),
                  ),
                  SizedBox(height: 10,),
                  AnnonceTitle(annonce: widget.annonce,),
                  SizedBox(height: 10,),
                  TextTitle(text: "Informations Générales",),
                  SizedBox(height: 10,),
                  AnnonceDescription(annonce: widget.annonce,),
                  SizedBox(height: 10,),
                  TextTitle(text: "Catégorie",),
                  SizedBox(height: 5,),

                  Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: fourColor,
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child: Text(widget.annonce.category.name,style:TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.bold,color: primaryColor),)
                      )
                  ),
                  TextTitle(text: "Annonceur",),
                  SizedBox(height: 10,),
                  AnnonceAnnonceur(annonce: widget.annonce),
                  SizedBox(height: 10,),
                  TextTitle(text: "Numéro de télèphone",),
                  SizedBox(height: 10,),
                  NumberCall(annonce: widget.annonce),
                  SizedBox(height: 10,),
                  TextTitle(text: "Date de publication",),
                  SizedBox(height: 10,),
                  Text(widget.annonce.createdAt,style:TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.w600,color: Colors.black)),
                  SizedBox(height: 10,),
                  TextTitle(text: "Date de modification",),
                  SizedBox(height: 10,),
                  Text(widget.annonce.updatedAt,style:TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.w600,color: Colors.black)),
                  SizedBox(height: 10,),
                  TextTitle(text: "Adresse"),
                  SizedBox(height: 10,),
                  Text(widget.annonce.adresse,style:TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.bold,color: Colors.black)),
                  SizedBox(height: 10,),
                  Container(
                    height: 300,
                    child: GoogleMap(
                      //onMapCreated: _onMapCreated,
                      mapType: MapType.normal,
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: onMapCreated,
                    ),
                  )

                ],
              ),
            )
        ),

      ],
    );
  }


  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }
}


