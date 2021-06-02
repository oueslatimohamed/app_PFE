import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talebcom_app/Screen/chat/component/discussion_card.dart';
import 'package:talebcom_app/Screen/chat/component/discussion_screen.dart';
import 'package:talebcom_app/Services/getData.dart';
import 'package:talebcom_app/constant.dart';
import 'package:talebcom_app/models/message.dart';
import 'package:talebcom_app/models/user.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GetData getData = GetData();
  List<Message> msgs = [];
  SharedPreferences pref;
  Future<void> getpref() async {
    pref = await SharedPreferences.getInstance();
  }
  Future<void> fetchMsg() async {
    msgs = await getData.fetchMsgss();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getpref();
    msgs;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Messages",style:  TextStyle(fontFamily: "Montserrat",color: theredColor)),
        centerTitle: true,
        backgroundColor: Color(0xFFEAEAED),
        leading: Container(),
        elevation: 2,
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchMsg(),
          builder: (context,snapshot){
            return ListView.builder(
                itemCount: msgs.length,
                itemBuilder: (context, index){
                  if(msgs[index].user.id == pref.getInt("Id")){
                    return Container();
                  }else{
                    return DiscussionCard(message: msgs[index],press: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DiscussionScreen(user: msgs[index].user,)),
                      );
                    },);
                  }

                }
            );
          },
        ),
      )
    );
  }
}
