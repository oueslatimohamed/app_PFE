import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talebcom_app/Component/message_from.dart';
import 'package:talebcom_app/Component/message_me.dart';
import 'package:talebcom_app/Screen/chat/component/head_discussion.dart';
import 'package:talebcom_app/Screen/profile/component/edit_form.dart';
import 'package:talebcom_app/Services/sendData.dart';
import 'package:talebcom_app/constant.dart';
import 'package:talebcom_app/models/message.dart';
import 'package:talebcom_app/models/user.dart';

class DiscussionScreen extends StatefulWidget {
  User user;

  DiscussionScreen({this.user});

  @override
  _DiscussionScreenState createState() => _DiscussionScreenState();
}

class _DiscussionScreenState extends State<DiscussionScreen> {
  List<Message> msgs = [];
  SendData sendData = SendData();
  TextEditingController _message = TextEditingController();
  ScrollController _scrollController = ScrollController();
  Timer everyseconde;
  bool _disposed = false;
  final _formKey = GlobalKey<FormState>();
  FocusNode _focusNode = FocusNode();
  Future<void> fetchMsgs() async {
    msgs = await sendData.fetchMsg(widget.user.id);
  }

  @override
  void initState(){
    super.initState();
    msgs;
    everyseconde = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if(!_disposed){
        setState(() {
          msgs;
          _scrollController.animateTo(
              _scrollController
                  .position.maxScrollExtent,
              duration:
              Duration(milliseconds: 300),
              curve: Curves.easeOut);
        });
      }

    });
  }


  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text(widget.user.name +" "+widget.user.lastname,style:  TextStyle(fontFamily: "Montserrat",color: theredColor)),
        centerTitle: true,
        backgroundColor: Color(0xFFEAEAED),
        leading: Icon(Icons.arrow_back_ios_outlined,color: theredColor,),
        elevation: 2,
      ),
      body: FutureBuilder(
        future: fetchMsgs(),
        builder: (context,snapshot){
          return SingleChildScrollView(
           controller: _scrollController,
            child: Column(
              children: [
                HeadDiscussion(user: widget.user,),
                ListView.builder(
                    shrinkWrap: true,
                    //controller: _scrollController,
                    physics: BouncingScrollPhysics(),
                    itemCount: msgs.length,
                    itemBuilder: (context, index){
                      if(msgs[index].toUserId == widget.user.id) {
                        return Container(
                          alignment: Alignment.topRight,
                          child: MessageMe(message: msgs[index]),
                        );
                      } else {
                        return Container(
                          alignment: Alignment.topLeft,
                          child: MessageFrom(message: msgs[index]),
                        );
                      }

                    }),
              ],
            )

          );


        },
      ),
      bottomNavigationBar: Form(
        key: _formKey,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 15,bottom: 15),
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: fourColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextFormField(
                focusNode: _focusNode,
                keyboardType: TextInputType.multiline,
                controller: _message,
                decoration: InputDecoration(
                  hintText: "Ecrire ...",
                  hintStyle: TextStyle(fontFamily: "Montserrat",fontSize: 14,color: secondColor),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: primaryColor)
                  ),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                      color: primaryColor,
                      width: 1,
                      style: BorderStyle.solid
                  ),borderRadius: BorderRadius.circular(16),

                  ),
                ),
              ),
            ),
            Container(
              width: 50,
              margin: EdgeInsets.only(bottom: 15,left: 15),
              child: IconButton(icon: SvgPicture.asset("assets/images/send.svg",),color: primaryColor,iconSize: 30,
                onPressed: (){
                  sendData.sendMessage(_message.text, widget.user.id);
                  _message.clear();
                },),
            )
          ],
        ),
      )
    );
  }
}
