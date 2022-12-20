import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:search_project/models/user_model.dart';

import '../config/constants.dart';

/// Get profile posts using API
getAPIProfilePosts(String userName) async {
  String apiRoute = "/api/user/$userName/submitted";
  Uri url = Uri.parse(urlApi + apiRoute);
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
      profilePostsAPI = responseData['posts'];
      for (int i = 0; i < profilePostsAPI.length; i++) {
        votersProfileAPI.add(profilePostsAPI[i]['voters']);
      }
    } else {
      profilePostsAPI = [];
      votersProfileAPI = [];
    }
  });
}

/// Get user info from API
getAPIProfileAbout(String userName) async {
  String apiRoute = "/api/user/$userName/about";
  Uri url = Uri.parse(urlApi + apiRoute);
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
      userProfileAboutAPI = responseData['about']['user'];
    } else {
      userProfileAboutAPI = {};
    }
  });
}

/// Get user comments using API
getAPIProfileComments(String userName) async {
  String apiRoute = "/api/user/$userName/comments";
  Uri url = Uri.parse(urlApi + apiRoute);
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
      userProfileCommentsAPI = responseData['comments'];
    } else {
      userProfileCommentsAPI = [];
    }
  });
}

/// get comments post titles using API
getCommentPostTitles(String ids) async {
  String apiRoute = "/api/r/info?id=$ids";
  Uri url = Uri.parse(urlApi + apiRoute);
  await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader:
          ('Bearer ${"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbFR5cGUiOiJiYXJlIGVtYWlsIiwidXNlcm5hbWUiOiJ0Ml9sb3RmeTIiLCJpYXQiOjE2NzEyMTUzNjksImV4cCI6MTY3MTY0NzM2OX0.Ju__2iM52qX-pdVxr-czdiusZSnAxrruGuCtKV5UBzw"}')
    },
  ).then((value) {
    if (value.statusCode == 200) {
      var responseData = json.decode(value.body) as Map<String, dynamic>;
      for (int i = 0; i < responseData['things'].length; i++) {
        commentsPostTitlesAPI.add(responseData['things'][i]['title']);
      }
    } else {
      commentsPostTitlesAPI = [];
    }
  });
}

/// Get communities Avatar to show in profile posts
getProfilePostsCommunityAvatarsAPI(String communityName) async {
  String apiRoute = "/api/r/info?id=$communityName";
  Uri url = Uri.parse(urlApi + apiRoute);
  await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader:
          ('Bearer ${"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbFR5cGUiOiJiYXJlIGVtYWlsIiwidXNlcm5hbWUiOiJ0Ml9sb3RmeTIiLCJpYXQiOjE2NzEyMTUzNjksImV4cCI6MTY3MTY0NzM2OX0.Ju__2iM52qX-pdVxr-czdiusZSnAxrruGuCtKV5UBzw"}')
    },
  ).then((value) {
    if (value.statusCode == 200) {
      var responseData = json.decode(value.body) as Map<String, dynamic>;
      for (int i = 0; i < responseData['things'].length; i++) {
        profilePostsCommunityAvatarsAPI.add(responseData['things'][i]['icon']);
      }
    } else {
      profilePostsCommunityAvatarsAPI = [];
    }
  });
}

/// Vote service to upvote, downvote or cancel any of them
voteAPI(String id, int dir) async {
  const apiRoute = "/api/listing/vote";
  await http.post(Uri.parse(urlApi + apiRoute),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader:
            ('Bearer ${"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbFR5cGUiOiJiYXJlIGVtYWlsIiwidXNlcm5hbWUiOiJ0Ml9sb3RmeTIiLCJpYXQiOjE2NzEyMTUzNjksImV4cCI6MTY3MTY0NzM2OX0.Ju__2iM52qX-pdVxr-czdiusZSnAxrruGuCtKV5UBzw"}')
      },
      body: jsonEncode(<String, dynamic>{"id": id, 'dir': dir}));
}

/// Get user saved posts from API
getAPISavedPosts() async {
  String apiRoute = "/api/user/me/saved-posts";
  Uri url = Uri.parse(urlApi + apiRoute);
  await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader:
          ('Bearer ${"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbFR5cGUiOiJiYXJlIGVtYWlsIiwidXNlcm5hbWUiOiJ0Ml9sb3RmeTIiLCJpYXQiOjE2NzEyMTUzNjksImV4cCI6MTY3MTY0NzM2OX0.Ju__2iM52qX-pdVxr-czdiusZSnAxrruGuCtKV5UBzw"}')
    },
  ).then((value) {
    if (value.statusCode == 200) {
      var responseData = json.decode(value.body) as Map<String, dynamic>;
      savedPostsAPI = responseData['posts'];
    } else {
      savedPostsAPI = [];
    }
  });
}
