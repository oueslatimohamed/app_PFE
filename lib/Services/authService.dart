import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talebcom_app/Component/bottom_bar_navigation.dart';
import 'package:talebcom_app/Screen/guid/guid_screen.dart';
import 'package:talebcom_app/Screen/home/home_screen.dart';
import 'package:talebcom_app/Screen/login/login_screen.dart';
import 'package:talebcom_app/models/user.dart';

class AuthService {

  AuthService();
  Dio dio = Dio();

  void signIn(String email , String password ,BuildContext context) async {
   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data =  {
      "email": email,
      "password": password
    };
    var jsonResponse;

    var response = await http.post('http://10.0.2.2:8080/api/talebcom/login', body: data);
    if(response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if(jsonResponse != null) {
        sharedPreferences.setString("token", jsonResponse['data']);
        sharedPreferences.setString("userId", jsonResponse['id'].toString());
        sharedPreferences.setInt("Id", jsonResponse['id']);
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>BottomBarNavigation()));
      }
    }
    else {
      print(response.body);
    }
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }
  Future<String> getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("userId");
  }


  logOut(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", "");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GuidScreen()),
    );
  }

  Future<User> getCurrentUser() async {
    String token = await getToken();
    var response =
    await http.get("http://10.0.2.2:8080/api/talebcom/profile", headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      //print("profile : ${response.statusCode} ${response.body}");
      dynamic data = json.decode(response.body)["data"];
      print("profile : ${response.statusCode} ${data}");
      return User.fromJson(data);
    } else {
      throw Exception('Failed to load post');
    }
  }

  signUp(String name,String lastname,String email,String password,File file,String tel,String date,String category,String university,BuildContext context) async {
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String filename = file.path.split('/').last;
    FormData data = FormData.fromMap({
      "image" : await MultipartFile.fromFile(file.path,filename: filename),
      "name": name,
      "lastname": lastname,
      "email": email,
      "password": password,
      "tel": tel,
      "date":date,
      "uniId": university,
      "categoryId": category
    });
    var jsonResponse;

    Response response = await dio.post('http://10.0.2.2:8080/api/talebcom/signup', data: data);
    if(response.statusCode == 200) {
      jsonResponse = response.data;
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.data}');
      if(jsonResponse != null) {
        //sharedPreferences.setString("token", jsonResponse['data']);
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
      }
    }
    else {
      print(response.data);
    }
  }
  Future<User> updateProfile(File file,BuildContext context) async {
   String token = await getToken();
    String filename = file.path.split('/').last;
   dio.options.headers["Authorization"] = "Bearer $token";
    FormData data = FormData.fromMap({
        "image" : await MultipartFile.fromFile(file.path,filename: filename),
      });
    Response response = await dio.put('http://10.0.2.2:8080/api/talebcom/changePhoto',data: data);


    if (response.statusCode == 200) {
      Navigator.pop(context);
      return User.fromJson(jsonDecode(response.data));

    } else {
      throw Exception('Failed to update profile.');
    }
  }

}