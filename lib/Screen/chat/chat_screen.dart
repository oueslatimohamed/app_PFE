import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talebcom_app/Screen/chat/component/body.dart';
import 'package:talebcom_app/constant.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
  }

