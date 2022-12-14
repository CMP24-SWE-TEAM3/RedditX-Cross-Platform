
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../config/constants.dart';

getAPIProfileAbout(String userName) async {
  String searchRequest = "/api/user/${userName}/about";
  Uri url = Uri.parse(urlApi + searchRequest);
  await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader:
          ('Bearer ${"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbFR5cGUiOiJiYXJlIGVtYWlsIiwidXNlcm5hbWUiOiJBaG1lZGxvdGZ5MjAyIiwiaWF0IjoxNjcwODc3OTY2LCJleHAiOjE2NzEzMDk5NjZ9.ia64aUBqYVmaOQrkB42PblXj2kPFb3gsrXamCYuG9IA"}')
    },
  ).then((value) {
    if (value.statusCode == 200) {
      var responseData = json.decode(value.body) as Map<String, dynamic>;
      print(responseData);
    } else {

      print(value.statusCode);
    }
  });
}
///
//https://api.redditswe22.tech/api/user/comment/t2_hamada

getAPIProfileComments(String userName) async {
  String searchRequest = "/api/user/comment/${userName}";
  Uri url = Uri.parse(urlApi + searchRequest);
  await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader:
          ('Bearer ${"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbFR5cGUiOiJiYXJlIGVtYWlsIiwidXNlcm5hbWUiOiJBaG1lZGxvdGZ5MjAyIiwiaWF0IjoxNjcwODc3OTY2LCJleHAiOjE2NzEzMDk5NjZ9.ia64aUBqYVmaOQrkB42PblXj2kPFb3gsrXamCYuG9IA"}')
    },
  ).then((value) {
    if (value.statusCode == 200) {
      var responseData = json.decode(value.body) as Map<String, dynamic>;
      //print(responseData['comments']);
    } else {
      //print(value.statusCode);
    }
  });
}

