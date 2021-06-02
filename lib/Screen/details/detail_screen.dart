import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talebcom_app/Component/default_button.dart';
import 'package:talebcom_app/Screen/chat/component/discussion_screen.dart';
import 'package:talebcom_app/Screen/details/component/body.dart';
import 'package:talebcom_app/Screen/details/component/custome_app_bar.dart';
import 'package:talebcom_app/models/annonce.dart';

class DetailScreen extends StatefulWidget {
  final Annonce annonce;

  DetailScreen({this.annonce});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.white,
      body: Body(annonce: widget.annonce),
      bottomNavigationBar: Container(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 250,
              height: 40,
              child: DefaultButton(text: "Chat",press: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DiscussionScreen(user: widget.annonce.user,)),
                );
              },),
            ),
            Container(
              margin: EdgeInsets.only(right: 15),
              child: SvgPicture.asset("assets/images/heart.svg"),
            )
          ],
        ),
      )
    );
  }
}
