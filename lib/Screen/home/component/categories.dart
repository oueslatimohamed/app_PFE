import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talebcom_app/constant.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"text": "Covoiturage"},
      {"text": "Colocation"},
      {"text": "Location"},
      {"text": "Récup"},
    ];
    return Padding(
      padding: EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
              (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {
              print("test");
            },
          ),
        ),
      ),
    );
  }
}
class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 85,
        height: 100,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                color: theredColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: SvgPicture.asset(icon ,color: Colors.white,),
            ),
            SizedBox(height: 10),
            Container(
              width: 85,
              padding: EdgeInsets.all(0),
              child: Text(text, style:TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.bold,fontSize: 12),textAlign: TextAlign.center),
            )
          ],
        ),
      ),
    );
  }
}


