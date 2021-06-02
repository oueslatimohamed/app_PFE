
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talebcom_app/Services/authService.dart';
import 'package:talebcom_app/models/user.dart';

class ProfilePic extends StatelessWidget {
  Function press;
  AuthService authService = AuthService();

  ProfilePic({this.press});

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<User>(
        future: authService.getCurrentUser(),
        builder:(BuildContext context, AsyncSnapshot snapshot){
    if(snapshot.connectionState == ConnectionState.done)
        {
          User user = snapshot.data;
          return SizedBox(
            height: 150,
            width: 150,
            child: Stack(
              fit: StackFit.expand,
              overflow: Overflow.visible,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user.image),
                ),
                Positioned(
                  right: -16,
                  bottom: 0,
                  child: Container(
                    height: 46,
                    width: 46,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.white),
                      ),
                      color: Color(0xFFEAEAED),
                      onPressed: press,
                      child: SvgPicture.asset("assets/images/camera.svg",),
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
      return Container();
    }
    }
    );
  }
}