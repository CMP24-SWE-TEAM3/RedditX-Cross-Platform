import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config/constants.dart';
import '../models/authentication.dart';

class DrawersService {
  /// the base URL for cross platform API url
  final baseUrl = urlApi;
  getCommunitiesService() async {
    const apiRoute = "/api/user/me/prefs";
    final res =
        await http.get(Uri.parse(baseUrl + apiRoute), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: 'Bearer ${userauthentication.uid}'
    });
    if (res.statusCode == 200) {
      var obj = json.decode(res.body);
      return obj['prefs']['user'];
    } else {
      return null;
    }
  }
}
