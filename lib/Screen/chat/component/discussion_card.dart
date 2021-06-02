import 'package:flutter/material.dart';
import 'package:talebcom_app/constant.dart';
import 'package:talebcom_app/models/message.dart';

class DiscussionCard extends StatelessWidget {
  Message message;
  Function press;


  DiscussionCard({this.message, this.press});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(15),
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
           SizedBox(width: 10,),
           Container(
             height: 70,
             width: 70,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(50),
               color: Colors.black,
               image: DecorationImage(
                 image: NetworkImage(message.user.image),
                 fit: BoxFit.fill
               )
             ),
           ),
           SizedBox(width: 20,),
           Container(
             width: 250,
             margin: EdgeInsets.only(top: 15),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(message.user.name+" "+message.user.lastname,
                   style:TextStyle(fontFamily: "Montserrat",fontSize: 15,fontWeight: FontWeight.bold,color: theredColor) ,),
                 SizedBox(height: 10,),
                 Text(message.message,maxLines: 2,textAlign: TextAlign.left,
                   style:TextStyle(fontFamily: "Montserrat",fontSize: 12,fontWeight: FontWeight.normal,color: secondColor) ,),
               ],
             ),
           )
         ],
       ),
     ),
    );
  }
}
