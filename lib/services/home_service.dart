import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'dart:io';

import '../config/constants.dart';

// import '../models/authentication.dart';
import '../models/home_model.dart';

/// getAPIHomePosts Function
/// Get posts for home page with pagination by sending [page] and [limit] which represents the number of posts to be returned to the back end
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
