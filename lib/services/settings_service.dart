// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

class SettingsService {
  // updatePassword(){
  final baseUrl = "https://api.redditswe22.tech";

  ///sends to user model isPasswordSet field, indicates whether the user has a reddit password or not
  getIsPasswordSetService() async {
    const apiRoute = "/api/user/{username}/about";
    final res = await http.get(Uri.parse(baseUrl + apiRoute));
    if (res.statusCode == 200) {
      var obj = json.decode(res.body);
      return obj[0]['passwordSet'];
    } else {
      throw Exception("Error getting passwordSet ");
    }
  }

  createRedditPasswordSendEmailService() async {
    const apiRoute = "/api/user/{username}/about";
    final res = await http.get(Uri.parse(baseUrl + apiRoute));
    if (res.statusCode == 200) {
      var obj = json.decode(res.body);
      return obj[0]['passwordSet'];
    } else {
      throw Exception("Error getting passwordSet ");
    }
  }

  updateEmailService(String? newEmail) async {
    const apiRoute = "/api/user/update-email";
    final res = await http.post(Uri.parse(baseUrl + apiRoute),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String?>{"newEmail": newEmail}));

    return res;
  }

  sendRedditPasswordToEmailService(
      {required String? email, required String? userName}) async {
    const apiRoute = "/api/auth/forget";
    final res = await http.post(Uri.parse(baseUrl + apiRoute),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          //"email": email,
          'username': "t2_${userName!}",
          'operation': false
        }));
    inspect(res);
    return res;
  }

  getEmailService() async {
    const apiRoute = "/api/user/{username}/about";
    final res = await http.get(Uri.parse(baseUrl + apiRoute));
    if (res.statusCode == 200) {
      var obj = json.decode(res.body);
      return obj[0]['email'];
    } else {
      throw Exception("Error getting passwordSet ");
    }
  }
}

SettingsService settingsService = SettingsService();