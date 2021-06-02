import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talebcom_app/Component/default_button.dart';
import 'package:talebcom_app/Screen/filter/component/slider.dart';
import 'package:talebcom_app/Screen/filter/component/text_title_f.dart';
import 'package:talebcom_app/Screen/home/component/tab_chips.dart';
import 'package:talebcom_app/Screen/search/search_screen.dart';
import 'package:talebcom_app/constant.dart';
import 'package:talebcom_app/models/object.dart';
import 'package:http/http.dart' as http;
class Body extends StatefulWidget {

  @override
  _BodyState createState() => _BodyState();


}

class _BodyState extends State<Body> {
  int selectindex;
  String _selectedCategorie;
  List data = [];
  Future<String> getSWData() async {
    var res = await http
        .get("http://10.0.2.2:8080/api/talebcom/allregion");
    var resBody = json.decode(res.body)['data'];

    setState(() {
      data = resBody;
    });

    print(resBody);

    return "Sucess";
  }
  static double _lowerValue = 0;
  static double _upperValue = 100;

  String value1,value2;


  RangeValues values = RangeValues(_lowerValue, _upperValue);
  @override
  void initState() {
    super.initState();
    this.getSWData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filtre",style:  TextStyle(fontFamily: "Montserrat",color: theredColor)),
        leading: IconButton(icon:Icon(Icons.arrow_back_ios_outlined,color: theredColor,),onPressed: (){
          Navigator.pop(context);
        }),
        backgroundColor: Color(0xFFEAEAED),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 15,right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50,),
              TextTitleF(text: "Prix"),
              SizedBox(height: 20,),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 10,
                  overlayColor: fourColor,
                  minThumbSeparation: 100,
                  rangeThumbShape: RoundRangeSliderThumbShape(
                    enabledThumbRadius: 10,
                    disabledThumbRadius: 10,
                  ),
                ),
                child: RangeSlider(
                  activeColor: primaryColor,
                  inactiveColor: fourColor,
                  labels: RangeLabels(values.start.toString(),values.end.toString()),
                  min: 0,
                  max: 1000,
                  divisions: 100,
                  values: values,
                  onChanged: (val) {
                    setState(() {
                      values = val;
                      value1 = values.start.toString();
                      value2 = values.end.toString();
                    });
                  },
                ),
              ),
              SizedBox(height: 20,),
              TextTitleF(text: "Catégories"),
              SizedBox(height: 20,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(categoriess.length, (index) {
                    return Padding(
                      padding: EdgeInsets.all(5),
                      child:ChoiceChip(
                        selected: selectindex == index,
                        backgroundColor: fourColor,
                        onSelected: (selected) {
                          if (selected) {
                            setState(() {
                              selectindex = index;
                              print("Selected ${selectindex + 1}");
                            });
                          }
                        },
                        label: Text(categoriess[index]["text"],style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.w400,color: (selectindex == index) ? Colors.white : primaryColor),),
                        selectedColor: primaryColor,
                      ),
                    );
                  },
                  ),
                ),
              ),
              SizedBox(height: 20,),
              TextTitleF(text: "Région"),
              SizedBox(height: 20,),
              InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(
                      color: theredColor,
                      width: 1,
                      style: BorderStyle.solid
                  ),borderRadius: BorderRadius.circular(16)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    isDense: true, // Reduces the dropdowns height by +/- 50%
                    hint: Text("Sélectionner la région",style: TextStyle(fontFamily: "Montserrat",fontSize: 18,color: secondColor),),
                    icon: Icon(Icons.keyboard_arrow_down),
                    value: _selectedCategorie,
                    items: data.map((item) {
                      return new DropdownMenuItem(
                        value: item['id'].toString(),
                        child: new Text(item['name']),
                      );
                    }).toList(),
                    onChanged: (selectedItem) => setState(() => _selectedCategorie = selectedItem,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              DefaultButton(text: "Appliquer",press: () async{
                SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                print(value1);
                sharedPreferences.setString("val1", value1);
                sharedPreferences.setString("val2", value2);
                sharedPreferences.setString("val3", (selectindex+1).toString());
                sharedPreferences.setString("val4", _selectedCategorie);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SeachScreen()),
                );
              },)
            ],
          ),
        )
      ),
    );
  }
}
