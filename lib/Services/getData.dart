import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:talebcom_app/models/annonce.dart';
import 'package:talebcom_app/models/data.dart';
import 'package:http/http.dart' as http;
import 'package:talebcom_app/models/message.dart';
import 'package:talebcom_app/models/wishlist.dart';

class GetData {
  GetData();


  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  Future<List<Annonce>>fetchData() async {
    String token = await getToken();

    String url = "http://10.0.2.2:8080/api/talebcom/allannonce";
    try {
      http.Response response = await http.get(url,headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        print('status code = ${response.statusCode}');
        String data = response.body;
        var jsonData = jsonDecode(data);
        print(jsonData);
        Data tutos = Data.fromJson(jsonData);
        List<Annonce> tutosList =
        tutos.datas.map((e) => Annonce.fromJson(e)).toList();
        return tutosList;
      } else {
        print('status code = ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
  }

  Future<List<Wishlist>>getWishList() async {
    String token = await getToken();
    String url = "http://10.0.2.2:8080/api/talebcom/getmywishlsit";
    try {
      http.Response response = await http.get(url,headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        print('status codess = ${response.statusCode}');
        String data = response.body;
        var jsonData = jsonDecode(data);
        print(jsonData["data"]);
        List<Wishlist> tutosList =  (jsonData["data"] as List).map((e) => Wishlist.fromJson(e)).toList();
        return tutosList;
      } else {
        print('status code = ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
  }

  Future<List<Message>>fetchMsgss() async {
    String url = "http://10.0.2.2:8080/api/talebcom/messages";
    String token = await getToken();
    try {
      http.Response response = await http.get(url,headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {

        String data = response.body;
        var jsonData = jsonDecode(data);

        Data messages = Data.fromJson(jsonData);
        List<Message> tutosList =
        messages.datas.map((e) => Message.fromJson(e)).toList();
        return tutosList;
      } else {
        print('status codes = ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
  }

  Future<List<Annonce>>fetchMyAnnonces() async {
    String token = await getToken();

    String url = "http://10.0.2.2:8080/api/talebcom/allmyannonces";
    try {
      http.Response response = await http.get(url,headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        print('status code = ${response.statusCode}');
        String data = response.body;
        var jsonData = jsonDecode(data);
        print(jsonData);
        Data tutos = Data.fromJson(jsonData);
        List<Annonce> tutosList =
        tutos.datas.map((e) => Annonce.fromJson(e)).toList();
        return tutosList;
      } else {
        print('status code = ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
  }

  Future<List<Annonce>>searchAnnonces(String price1,String price2,String catId,String regionId ) async {

    String url = "http://10.0.2.2:8080/api/talebcom/search";
    try {
      http.Response response = await http.post(url,headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },body: jsonEncode(<String, String>{
        'price1': price1,
        'price2': price2,
        'categoryId': catId,
        'regionId': regionId,
      }));
      if (response.statusCode == 200) {
       // print('status code = ${response.statusCode}');
        String data = response.body;
        var jsonData = jsonDecode(data);
        //print(jsonData);
        Data tutos = Data.fromJson(jsonData);
        List<Annonce> tutosList =
        tutos.datas.map((e) => Annonce.fromJson(e)).toList();
        return tutosList;
      } else {
        print('status code = ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
  }


}