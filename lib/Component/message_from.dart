import 'package:flutter/material.dart';
import 'package:talebcom_app/models/message.dart';

class MessageFrom extends StatelessWidget {
  Message message;

  MessageFrom({this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 15, top: 5),
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * .6
          ),
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Color(0xFFEAEAED),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: Text(
            message.message,
            style: Theme.of(context).textTheme.body1.apply(
              color: Colors.black87,
            ),
          ),
        ),
        SizedBox(height: 5,),
        Container(
          margin: EdgeInsets.only(left: 15),
          child: Text(message.date,style: TextStyle(fontSize: 10),),
        )
      ],
    );
  }
}
