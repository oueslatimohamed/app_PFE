import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:talebcom_app/Component/bottom_bar_navigation.dart';
import 'package:talebcom_app/Screen/home/home_screen.dart';
import 'package:talebcom_app/models/annonce.dart';
import 'package:talebcom_app/models/data.dart';
import 'package:talebcom_app/models/message.dart';
import 'package:talebcom_app/models/user.dart';
import 'package:talebcom_app/models/wishlist.dart';

class SendData {
  SendData();
  Dio dio = Dio();


  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }
  Future<String> getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("userId");
  }

  addAnnonce(String title , String description,String category,String region,String adresse,String price,BuildContext context,File file,File file1,File file2,File file3) async {
    String token = await getToken();
    String id = await getId();
   String filename = file.path.split('/').last;
    String filename1 = file1.path.split('/').last;
    String filename2 = file2.path.split('/').last;
    String filename3 = file3.path.split('/').last;
    //var a = [MultipartFile.fromFileSync(file1.path, filename: filename1),MultipartFile.fromFileSync(file.path,filename: filename)];

    var formData = FormData();
    formData.files.addAll([
      MapEntry('images',
        MultipartFile.fromFileSync(file.path,filename: filename),
      ),
      MapEntry('images',
        MultipartFile.fromFileSync(file1.path,filename: filename1),
      ),
      MapEntry('images',
        MultipartFile.fromFileSync(file2.path,filename: filename2),
      ),
      MapEntry('images',
        MultipartFile.fromFileSync(file3.path,filename: filename3),
      ),
    ]);
    formData.fields.add(
      MapEntry('title', title),
    );
    formData.fields.add(
      MapEntry('description', description),
    );
    formData.fields.add(
      MapEntry('categoryId', category),
    );
    formData.fields.add(
      MapEntry('regionId', region),
    );
    formData.fields.add(
      MapEntry('adresse', adresse),
    );
    formData.fields.add(
      MapEntry('userId', id),
    );
    formData.fields.add(
      MapEntry('price', price),
    );
    var jsonResponse;
    //dio.options.headers["authorization"] = "Bearer "+token;
    //dio.options.contentType = ContentType("application","application/json");
    //dio.options.headers[HttpHeaders.authorizationHeader] = "Bearer "+token;

    Response response = await dio.post('http://10.0.2.2:8080/api/talebcom/addannonce',
        data: formData
        );
    if(response.statusCode == 200) {
      jsonResponse = response.data;
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.data}');
      if(jsonResponse != null) {
        //sharedPreferences.setString("token", jsonResponse['data']);
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>BottomBarNavigation()));
      }
    }
    else {
      print(response.data);
    }
  }

  addTowish(int id,BuildContext context) async {
    String url = "http://10.0.2.2:8080/api/talebcom/addtowish/$id";
    String token = await getToken();
    http.Response response = await http.post(url,headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if(response.statusCode == 200){
      print("Wish = ${response.statusCode}");
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Annonce est ajoutée à votre liste des favoris")));
    } else {
      print("WishERR = ${response.statusCode}");
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Annonce est dans votre liste des favoris")));
    }
  }
   deletefromwish(String id) async {
    String token = await getToken();
    final http.Response response = await http.delete(
      Uri.parse('http://10.0.2.2:8080/api/talebcom/deletefromwish/$id'),
      headers:{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return Wishlist.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete album.');
    }
  }
  deletemyannonce(String id) async {
    String token = await getToken();
    final http.Response response = await http.delete(
      Uri.parse('http://10.0.2.2:8080/api/talebcom/deletemyannonce/$id'),
      headers:{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return Wishlist.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete album.');
    }
  }

  sendMessage(String message,int id) async {
    String token = await getToken();
    Map data =  {
      "message": message,
    };
    var jsonResponse;

    var response = await http.post('http://10.0.2.2:8080/api/talebcom/sendmessage/${id}',headers: {

      'Authorization': 'Bearer $token',
    }, body: data);
    if(response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print('Response status: ${response.statusCode}');

      if(jsonResponse != null) {

        //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>DetailPage(tuto: tuto)));
      }
    }
    else {
      print(response.body);
    }
  }
 Future<List<Message>>fetchMsg(int id) async {
    String url = "http://10.0.2.2:8080/api/talebcom/showmessage/$id";
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

        Data tutos = Data.fromJson(jsonData);
        List<Message> tutosList =
        tutos.datas.map((e) => Message.fromJson(e)).toList();
        return tutosList;
      } else {
        print('status codes = ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
  }

  Future<User> updateProfile(String name,String lastName,String tel) async {
    String token = await getToken();
    final http.Response response = await http.put(
      Uri.parse('http://10.0.2.2:8080/api/talebcom/updateprofile'),
      headers:{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'lastname': lastName,
        'tel': tel,
      }),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update profile.');
    }
  }
  Future<Annonce> updateAnnonce(int id,String title,String description,String price) async {
    String token = await getToken();
    final http.Response response = await http.put(
      Uri.parse('http://10.0.2.2:8080/api/talebcom//updatemyannonce/$id'),
      headers:{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        'title': title,
        'description': description,
        'price': price.toString()
      }),
    );

    if (response.statusCode == 200) {
      return Annonce.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update profile.');
    }
  }
}