import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import '../config/constants.dart';

import '../models/authentication.dart';
import '../models/home_model.dart';

/// Get posts of a specific community with a sort type
getAPIHomePosts(page, limit) async {
  String apiRoute = "/api/listing/posts/best?page=$page&limit=$limit";
  Uri url = Uri.parse(urlApi + apiRoute);
  await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      // HttpHeaders.authorizationHeader: ('Bearer ${userauthentication.uid}')
    },
  ).then((value) {
    if (value.statusCode == 200) {
      var responseData = json.decode(value.body) as Map<String, dynamic>;
      homePostsListAPI = responseData['posts'];
    } else {
      // print(value.statusCode);
      homePostsListAPI = [];
    }
  });
}
