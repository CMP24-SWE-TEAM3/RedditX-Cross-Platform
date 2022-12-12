import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;

import '../config/constants.dart';
import '../models/authentication.dart';

/// facebookapi Function
/// handles the facebook request by http request the facebook link
facebookapi(result) async {
  final graphResponse = await http.get(Uri.parse(
      'https:///graph.facebook.com/v2.12/me?fields=name,picture.width(800).height(800),first_name,last_name,email&access_token=${result.accessToken!.token}'));

  return graphResponse;
}

/// loginBareEmailAPI Function
/// connect with the back end and sent the username and password and recieve the token in the response
loginBareEmailAPI(String username, String password) async {
  const String loginRequest = "/api/auth/login";
  Uri url = Uri.parse(urlApi + loginRequest);

  final response = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({
        "type": "bare email",
        "password": password,
        "username": username,
      }));

  // print(response.body + username + password);
  return response;
}

/// loginGoogleEmailAPI Function
/// connect with the back end and sent the username and password and recieve the token in the response
loginGoogleEmailAPI(String token) async {
  const String loginRequest = "/api/auth/login";
  Uri url = Uri.parse(urlApi + loginRequest);

  final response = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({
        "type": "gmail",
        "googleOrFacebookToken": token,
      }));

  // print(response.body + username + password);
  return response;
}

/// loginFacebookEmailAPI Function
/// connect with the back end and sent the username and password and recieve the token in the response
loginFacebookEmailAPI(String token) async {
  const String loginRequest = "/api/auth/login";
  Uri url = Uri.parse(urlApi + loginRequest);

  final response = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({
        "type": "facebook",
        "googleOrFacebookToken": token,
      }));

  // print(response.body + username + password);
  return response;
}

/// signUpBareEmailAPI Function
/// connect with the back end and sent the email, username and password and recieve the token in the response
signUpBareEmailAPI(email, username, password) async {
  const String signupRequest = "/api/auth/signup";
  Uri url = Uri.parse(urlApi + signupRequest);

  final response = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({
        "type": "bare email",
        "email": email,
        "password": password,
        "username": username,
      }));

  // print(response.body);

  return response;
}

uploadUserPhoto(photo) async {
  const String photoRequest = "/api/user/me/upload-user-photo";
  String url = urlApi + photoRequest;

  // ignore: unnecessary_new, prefer_collection_literals
  var map = new Map<String, dynamic>();
  map['action'] = 'upload';
  map['attachment'] = photo;
  var dio = Dio();
  dio.options.headers["authorization"] = "Bearer ${userauthentication.uid}";
  try {
    // ignore: unnecessary_new
    FormData formData = new FormData.fromMap(map);
    var response = await dio.post(url, data: formData);
    return response;
  } catch (e) {
    print(e);
  }
}

// uploadUserPhoto(photo) async {
//   const String photoRequest = "/api/user/me/upload-user-photo";
//   String url = urlApi + photoRequest;

//   // ignore: unnecessary_new, prefer_collection_literals
//   var map = new Map<String, dynamic>();
//   map['action'] = 'upload';
//   map['file'] = {'filename': photo};
//   var dio = Dio();
//   dio.options.headers["authorization"] = "Bearer ${userauthentication.uid}";
//   // dio.options.headers["authorization"] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbFR5cGUiOiJiYXJlIGVtYWlsIiwidXNlcm5hbWUiOiJ0Ml9uYWJpbDEyMyIsImlhdCI6MTY3MDg2NTE1MSwiZXhwIjoxNjcxMjk3MTUxfQ.9Mg2IvUzbPU7zuR7dh1PJeLBZLSX_OK2fVa5NZmwT7c";
//   try {
//     // ignore: unnecessary_new
//     FormData formData = new FormData.fromMap(map);
//     var response = await dio.post(url, data: formData);
//     return response;
//   } catch (e) {
//     print(e);
//   }
// }

forgetuseranameApi(email) async {
  const String forgetuseranameRequest = "/api/auth/forget";
  Uri url = Uri.parse(urlApi + forgetuseranameRequest);

  final response = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({
        "email": email,
        "operation": true,
      }));

  // print(response.body);

  return response;
}

forgetpassApi(email, username) async {
  const String forgetpassRequest = "/api/auth/forget";
  Uri url = Uri.parse(urlApi + forgetpassRequest);

  final response = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({
        "email": email,
        "operation": false,
        "username": username,
      }));

  // print(response.body);

  return response;
}

/// checkUserAvailabilityAPI Function
/// connect with the back end and sent the usernaem recieve whether its used or not
checkUserAvailabilityAPI(username) async {
  const String checkUserAvailabilityRequest =
      "/api/auth/username-available?username=";
  Uri url = Uri.parse(urlApi + checkUserAvailabilityRequest + username);

  final response = await http.get(url);

  return response;
}

/// loginBareEmailMock Function
/// return mock data for login whick is the token
loginBareEmailMock() {
  return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbFR5cGUiOiJiYXJlIGVtYWlsIiwidXNlcm5hbWUiOiJ0Ml9BaG1lZExvdGZ5MDIyMiIsImlhdCI6MTY2OTE1ODMxMywiZXhwIjoxNjY5NTkwMzEzfQ._HP3h2ChmLPiivdKN29b1mn9cuc-6pw_Q5rBGNwDiLY';
}

/// signUpBareEmailMock Function
/// return mock data for signup whick is the token
signUpBareEmailMock() {
  return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbFR5cGUiOiJiYXJlIGVtYWlsIiwidXNlcm5hbWUiOiJ0Ml9BaG1lZExvdGZ5MDIyMiIsImlhdCI6MTY2OTE1ODMxMywiZXhwIjoxNjY5NTkwMzEzfQ._HP3h2ChmLPiivdKN29b1mn9cuc-6pw_Q5rBGNwDiLY';
}

/// checkUserAvailabilityMock Function
/// return mock data for usernameavailability whick is the ture
checkUserAvailabilityMock() {
  return true;
}

/// sendGenderMock Function
/// return mock data for gender whick is man
sendGenderMock() {
  return 'man';
}

/// sendPhotoMock Function
/// return mock data for userphoto whick is a constand link
sendPhotoMock() {
  return 'https://www.shutterstock.com/image-photo/head-shot-portrait-close-smiling-600w-1714666150.jpg';
}

/// sendUserNameMock Function
/// return mock data for username whick is Ahmed300
sendUserNameMock() {
  return 'Ahmed300';
}

/// forgetPassMock Function
/// return mock data for forgetpassword whick is true
forgetPassMock() {
  return true;
}

/// forgetUsernameMock Function
/// return mock data for forgetusernaem whick is true
forgetUsernameMock() {
  return true;
}

/// interestMock Function
/// return mock data for inteset whick is a constant list
interestMock() {
  return ['Career', 'Lifehacks', 'Funny', 'Interesting', 'Jokes'];
}
