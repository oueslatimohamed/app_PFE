import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talebcom_app/Screen/add_annonce/add_screen.dart';
import 'package:talebcom_app/Screen/chat/chat_screen.dart';
import 'package:talebcom_app/Screen/favorite/favorite_screen.dart';
import 'package:talebcom_app/Screen/home/home_screen.dart';
import 'package:talebcom_app/Screen/profile/profile_screen.dart';
import 'package:talebcom_app/constant.dart';

class BottomBarNavigation extends StatefulWidget {
  @override
  _BottomBarNavigationState createState() => _BottomBarNavigationState();
}

class _BottomBarNavigationState extends State<BottomBarNavigation> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ChatScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];
  final PageStorageBucket bucket = PageStorageBucket();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: _widgetOptions.elementAt(_selectedIndex),
        bucket: bucket,
      ),


      bottomNavigationBar: BottomAppBar(
        child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Container(
              margin: EdgeInsets.only(left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/images/home.svg",
                            color: _selectedIndex == 0 ? primaryColor : theredColor,
                          ),
                          SizedBox(height: 5,),
                          Container(
                            height: 6,
                            width: 6,
                            decoration: BoxDecoration(
                              color:   (_selectedIndex == 0)? primaryColor : Colors.white,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          )
                        ],
                      )
                  ),
                  MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/images/chat.svg",
                            color: _selectedIndex == 1 ? primaryColor : theredColor,
                          ),
                          SizedBox(height: 5,),
                          Container(
                            height: 6,
                            width: 6,
                            decoration: BoxDecoration(
                              color:   (_selectedIndex == 1)? primaryColor : Colors.white,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          )
                        ],
                      )
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24)
                      ),
                    ),
                    child:  MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddScreen()),
                          );
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        )
                    ),
                  ),
                  MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/images/heart.svg",
                            color: _selectedIndex == 2 ? primaryColor : theredColor,
                          ),
                          SizedBox(height: 5,),
                          Container(
                            height: 6,
                            width: 6,
                            decoration: BoxDecoration(
                              color:   (_selectedIndex == 2)? primaryColor : Colors.white,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          )
                        ],
                      )
                  ),
                  MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/images/profile.svg",
                            color: _selectedIndex == 3 ? primaryColor : theredColor,
                          ),
                          SizedBox(height: 5,),
                          Container(
                            height: 6,
                            width: 6,
                            decoration: BoxDecoration(
                              color:   (_selectedIndex == 3)? primaryColor : Colors.white,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          )
                        ],
                      )
                  ),
                ],
              ),
            )
        ),
      )
    );
  }
}
