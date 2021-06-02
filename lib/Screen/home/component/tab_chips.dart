import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talebcom_app/constant.dart';

class TabChips extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabChipsState();
}

class _TabChipsState extends State<TabChips> {
  int _selectedIndex ;



  List<Map<String, dynamic>> categories = [
    {"text": "Tous"},
    {"text": "Location"},
    {"text": "Colocation"},
    {"text": "Covoiturage"},
    {"text": "Récup"},
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(categories.length, (index) {
        return Padding(
            padding: EdgeInsets.all(5),
        child:ChoiceChip(
          selected: _selectedIndex == index,
          backgroundColor: fourColor,
          onSelected: (selected) {
            if (selected) {
              setState(() {
                _selectedIndex = index;
                print("Selected ${_selectedIndex}");
                setSelect(_selectedIndex);
              });
            }
          },
          label: Text(categories[index]["text"],style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.w400,color: (_selectedIndex == index) ? Colors.white : primaryColor),),
          selectedColor: primaryColor,
        ),
        );
      },
      ),
    );
  }
  void setSelect(int selectedIndex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("select",selectedIndex);
  }
}