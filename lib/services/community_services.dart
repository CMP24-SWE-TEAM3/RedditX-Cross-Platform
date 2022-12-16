// ignore_for_file: depend_on_referenced_packages
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../config/constants.dart';
import '../models/community_model.dart';
import '../models/post_model.dart';


/// Get posts of a specific community with a sort type
getAPICommunityPosts(String communityName, String sortType, List<dynamic> posts,
    int page, int limit) async {
  var queryParameters = {'page': page, 'limit': limit};
  Uri url = Uri.https(
    "api.redditswe22.tech",
    "/api/listing/posts/r/$communityName/$sortType",
    {
      'mapData': jsonEncode(queryParameters),
    },
  );
  await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  ).then((value) {
    if (value.statusCode == 200) {
      var responseData = json.decode(value.body) as Map<String, dynamic>;
      communityPostsListAPI = responseData['posts'];
      print("_______________________________________");
       print(communityPostsListAPI[7]);
    
    } else {
      //print("posts ${value.statusCode}");
      communityPostsListAPI = [];
    }
  });
}

getAPICommunityAbout(String communityName) async {
  String searchRequest = "/api/r/$communityName";
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
      //print(responseData);
      moderatorsAPI = responseData['moderators'];
      communityRulesAPI = responseData['communityRules'];
    } else {
      moderatorsAPI = [];
      communityRules = [];
      //print(value.statusCode);
    }
  });
}

/// Get community name, date of creation, description and members count
getAPICommunityInfo(String communityName) async {
  String searchRequest = "/api/r/info?id=$communityName";
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
      //print(responseData['things'][0]);
      communityInfoAPI = responseData['things'][0];
    } else {
      communityInfoAPI = {};

      //print(value.statusCode);
    }
  });
}



getAPICommunityFlairs(String communityName) async {
  String searchRequest = "/api/r/$communityName/api/flair-list";
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
      communityFlairsAPI=responseData['flairs'];

    } else {
    }
  });
}




voteAPI(String id, int dir) async {
  const String voteRequest = "/api/listing/vote";
  Uri url = Uri.parse(urlApi + voteRequest);

  final response = await http.post(url,
      body: jsonEncode(<String, dynamic>{
        "id": id,
        "dir": dir,
      }));
  // print(response.body);
  // print(response.statusCode);

  return response;
}
