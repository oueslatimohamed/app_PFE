import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talebcom_app/Component/annonce_card.dart';
import 'package:talebcom_app/Component/bottom_bar_navigation.dart';
import 'package:talebcom_app/Component/default_button.dart';
import 'package:talebcom_app/Component/second_button.dart';
import 'package:talebcom_app/Screen/details/detail_screen.dart';
import 'package:talebcom_app/Screen/filter/filter_screen.dart';
import 'package:talebcom_app/Screen/guid/guid_screen.dart';
import 'package:talebcom_app/Screen/home/component/app_bar.dart';
import 'package:talebcom_app/Screen/home/component/categories.dart';
import 'package:talebcom_app/Screen/home/component/icon_counter.dart';
import 'package:talebcom_app/Screen/home/component/search_field.dart';
import 'package:talebcom_app/Screen/home/component/special_offre.dart';
import 'package:talebcom_app/Screen/home/component/tab_chips.dart';
import 'package:talebcom_app/Services/sendData.dart';
import 'package:talebcom_app/constant.dart';
import 'package:talebcom_app/models/annonce.dart';
import 'package:talebcom_app/Services/getData.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GetData getData = GetData();
  SendData sendData = SendData();
  List<Annonce> annoncess = [];
  int select = 0;

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }
  String _token;
  setToken() async {
    _token = await getToken();
  }

  Future<void> fetchTutos() async {
    annoncess = await getData.fetchData();

  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setToken();
    setState(() {
      fetchTutos();
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: fetchTutos(),
        builder: (context,snapshot){
          return Scrollbar(
            thickness: 3,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 320,
                              child:SearchField(),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 15),
                                child: IconBtnWithCounter(svgSrc: "assets/images/filter.svg",press: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => FilterScreen()),
                              );
                            }
                            )),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Row(
                          children: List.generate(categories.length, (index) {
                            return Padding(
                              padding: EdgeInsets.all(5),
                              child:ChoiceChip(
                                selected: select == index,
                                backgroundColor: fourColor,
                                onSelected: (selected) {
                                  if (selected) {
                                    setState(() {
                                      select = index;
                                      print(select);
                                     //annoncess;
                                    });
                                  }
                                },
                                label: Text(categories[index]["text"],style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.w400,color: (select== index) ? Colors.white : primaryColor),),
                                selectedColor: primaryColor,
                              ),
                            );
                          },
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("Sélectionné pour vous",
                        style:TextStyle(fontFamily:"Montserrat",fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black),),
                      SizedBox(height: 15,),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SpecialOffre(),
                              SizedBox(width: 20,),
                              SpecialOffre(),
                            ],
                          )
                      ),
                      SizedBox(height: 20,),
                      Text("Les annonces publiées",
                        style:TextStyle(fontFamily:"Montserrat",fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black),),
                      SizedBox(height: 15,),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: (select == 0) ? annoncess.length: annoncess.where((element) => element.category.id==select.toInt()).length,

                        //scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 20,
                            childAspectRatio: 0.65,
                        ),
                        itemBuilder: (BuildContext context, int position) {
                              return AnnonceCard(annonce: annoncess[position],press: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DetailScreen(annonce: annoncess[position])),
                                );
                              },
                                add: (){
                                  (_token=="")?Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => GuidScreen()),
                                  ):sendData.addTowish(annoncess[position].id,context);
                                },);

                        },
                      ),

                    ],
                  )
              ),
            ),
          );
        },
      ),
  bottomNavigationBar:(_token == "") ? Container(
    height: 80,
    color: fourColor,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(left: 15),
          width: 180,
          height: 40,
          child: DefaultButton(text:"Se Connecter",press: (){},),
        ),
        Container(
          margin: EdgeInsets.only(right: 15),
          width: 180,
          height: 40,
          child: SecondButton(text:"S'inscrire",press: (){},),
        )
      ],
    ),
  ) :null
    );
  }

}
