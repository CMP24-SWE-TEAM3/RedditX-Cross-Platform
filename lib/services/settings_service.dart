// ignore: depend_on_referenced_packages
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config/constants.dart';
import '../models/authentication.dart';

class SettingsService {
  /// the base URL for cross platform API url
  final baseUrl = urlApi;

  ///sends to user model isPasswordSet field, indicates whether the user has a reddit password or not
  getIsPasswordSetService() async {
    const apiRoute = "/api/user/{username}/about";
    final res =
        await http.get(Uri.parse(baseUrl + apiRoute), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: ('Bearer ${userauthentication.uid}')
    });
    if (res.statusCode == 200) {
      var obj = json.decode(res.body);
      return obj[0]['passwordSet'];
    } else {
      return null;
    }
  }

  getEmailService() async {
    const apiRoute = "/api/user/{username}/about";
    final res =
        await http.get(Uri.parse(baseUrl + apiRoute), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: ('Bearer ${userauthentication.uid}')
    });
    log(res.body);
    if (res.statusCode == 200) {
      var obj = json.decode(res.body);
      return obj[0]['email'];
    } else {
      // throw Exception("Error getting passwordSet ");
      return res.body;
    }
  }

  ///service for updating user's email takes [newEmail] entered by user after validaton
  updateEmailService(String? newEmail) async {
    const apiRoute = "/api/user/update-email";
    final res = await http.post(Uri.parse(baseUrl + apiRoute),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: ('Bearer ${userauthentication.uid}')
        },
        body: jsonEncode(<String, String?>{"email": newEmail}));
    return res;
  }

  ///service for changing password of a user
  changePasswordService(String? currentPassword, String? newPassword,
      String? confirmNewPassword) async {
    const apiRoute = "/api/auth/reset-password";
    final res = await http.patch(Uri.parse(baseUrl + apiRoute),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: ('Bearer ${userauthentication.uid}')
        },
        body: jsonEncode(<String, String?>{
          "currentPassword": currentPassword,
          "newPassword": newPassword,
          "confirmNewPassword": confirmNewPassword
        }));
    log(res.body);
    return res;
  }

  /// post request to send password set to user's inbox
  sendRedditPasswordToEmailService(
      {required String? email, required String? userName}) async {
    const apiRoute = "/api/auth/forget";
    final res = await http.post(Uri.parse(baseUrl + apiRoute),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: ('Bearer ${userauthentication.uid}')
        },
        body: jsonEncode(<String, dynamic>{
          "email": email,
          'username': "t2_${userName!}",
          'operation': false
        }));
    log(res.body);
    return res;
  }

  /// post request to send user updated pref(s) can take one or more values
  updatePrefsService({required Map<String, bool>? prefs}) async {
    const apiRoute = "/api/user/me/prefs:";
    final res = await http.post(Uri.parse(baseUrl + apiRoute),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: 'Bearer ${userauthentication.uid}'
        },
        body: jsonEncode(prefs));
    return res;
  }

  /// get request to retrieve user prefs upon signing in
  getUserPrefsService() async {
    const apiRoute = "/api/user/me/prefs";
    final res =
        await http.get(Uri.parse(baseUrl + apiRoute), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: 'Bearer ${userauthentication.uid}'
    });
    if (res.statusCode == 200) {
      var obj = json.decode(res.body);
      return obj;
    } else {
      return null;
    }
  }
}

SettingsService settingsService = SettingsService();
