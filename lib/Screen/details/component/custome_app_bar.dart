import 'package:flutter/material.dart';
import 'package:talebcom_app/constant.dart';

class CustomAppBar extends PreferredSize {
  final double rating;

  CustomAppBar({@required this.rating});

  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
        EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 1),
              height: 40,
              width: 40,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: primaryColor,
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
