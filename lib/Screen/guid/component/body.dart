import 'package:flutter/material.dart';
import 'package:talebcom_app/Component/bottom_bar_navigation.dart';
import 'package:talebcom_app/Component/default_button.dart';
import 'package:talebcom_app/Component/second_button.dart';
import 'package:talebcom_app/Screen/guid/component/guid_content.dart';
import 'package:talebcom_app/Screen/home/home_screen.dart';
import 'package:talebcom_app/Screen/login/login_screen.dart';
import 'package:talebcom_app/Screen/signup/signup_screen.dart';
import 'package:talebcom_app/Screen/start/startscreen.dart';
import 'package:talebcom_app/constant.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> guidData = [
    {
      "title":"Chercher des annonces",
      "text": "Vous pouvez naviguez notre application et trouvez l'annonce que vous cherchez depuis longtemps.",
      "image": "assets/images/g1.png"
    },
    {
    "title":"Trouvez l'annonce que vous souhaitez",
      "text":
      "Vous pouvez naviguez notre application et trouvez l'annonce que vous cherchez depuis longtemps.",
      "image": "assets/images/g3.png"
    },
    {
      "title":"Contacter l'annonceur",
      "text": "Vous pouvez bien contacter l'annonceur de l'annonce que vous avez fixé",
      "image": "assets/images/g2.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
          Container(
            color: fourColor,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10,right: 15),
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Text("Passe",style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: primaryColor
                    ),),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 450,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: guidData.length,
                    itemBuilder: (context,index) => GuidContent(
                      title: guidData[index]["title"],
                      text: guidData[index]["text"],
                      image: guidData[index]["image"],
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          guidData.length,
                              (index) => buildDot(index: index),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(left: 15,right: 15),
              child: DefaultButton(text: "Se connecter",press: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              }),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(left: 15,right: 15),
              child: SecondButton(text: "S'inscrire",press: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? primaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
