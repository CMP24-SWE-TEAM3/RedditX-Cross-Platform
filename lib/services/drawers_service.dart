import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config/constants.dart';
import '../models/authentication.dart';

class DrawersService {
  /// the base URL for cross platform API url
  final baseUrl = urlApi;
  getCommunitiesService() async {
    const apiRoute = "/api/r/mine/subscriber";
    final res =
        await http.get(Uri.parse(baseUrl + apiRoute), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: 'Bearer ${userauthentication.uid}'
    });
        log(res.body);

    if (res.statusCode == 200) {
      var obj = json.decode(res.body);
      return obj['communities']; //access id
    } else {
      return null;
    }
  }

  getModeratedCommunitiesService() async {
    const apiRoute = "/api/r/mine/moderator";
    final res =
        await http.get(Uri.parse(baseUrl + apiRoute), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: 'Bearer ${userauthentication.uid}'
    });
    log(res.body);
    if (res.statusCode == 200) {
      var obj = json.decode(res.body);
      return obj['communities']; //access id
    } else {
      return null;
    }
  }
}

DrawersService drawersService = DrawersService();
