import 'dart:convert';

import 'package:talebcom_app/models/user.dart';

class Message {
  int id;
  String message;
  int toUserId;
  User user;
  String date;

  Message({this.id,this.message,this.toUserId,this.user,this.date});

  factory Message.fromJson(Map<String , dynamic> json) {
    return Message(
        id: json['id'],
        message: json['message'],
        toUserId: json['toUserId'],
      user: User.fromJson(json['user']),
      date:json['createdAt'],
    );
  }
}