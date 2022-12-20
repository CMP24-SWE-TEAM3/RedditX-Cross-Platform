import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../config/constants.dart';

fetchMySubscribed() async {
  String searchRequest = "/api/r/mine/subscriber";
  final res = await http.get(
    Uri.parse(urlApi + searchRequest),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader:
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbFR5cGUiOiJiYXJlIGVtYWlsIiwidXNlcm5hbWUiOiJ0Ml9sb3RmeTIiLCJpYXQiOjE2NzEyMTUzNjksImV4cCI6MTY3MTY0NzM2OX0.Ju__2iM52qX-pdVxr-czdiusZSnAxrruGuCtKV5UBzw'
    },
  );
  if (res.statusCode == 200) {
    return json.decode(res.body) as Map<String, dynamic>;
  } else {
    return null;
  }
}

submitPost(
  bool nsfw,
  bool spoiler,
  String title,
  String text,
  String flairText,
  String flairTextColor,
  String flairBackGround,
  String flairTextID,
  String communityID,
) async {}

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
  ).then(
    (value) {
      if (value.statusCode == 200) {
        var responseData = json.decode(value.body) as Map<String, dynamic>;
        return responseData['flairs'];
      } else {
        return [];
      }
    },
  );
}

getAPICommunityRules(String communityName) async {
  String searchRequest = "/api/r/$communityName";
  Uri url = Uri.parse(urlApi + searchRequest);
  await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader:
          ('Bearer ${"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbFR5cGUiOiJiYXJlIGVtYWlsIiwidXNlcm5hbWUiOiJBaG1lZGxvdGZ5MjAyIiwiaWF0IjoxNjcwODc3OTY2LCJleHAiOjE2NzEzMDk5NjZ9.ia64aUBqYVmaOQrkB42PblXj2kPFb3gsrXamCYuG9IA"}')
    },
  ).then(
    (value) {
      if (value.statusCode == 200) {
        var responseData = json.decode(value.body) as Map<String, dynamic>;
        //print(responseData);
        return responseData['communityRules'];
      } else {
        return [];
      }
    },
  );
}
