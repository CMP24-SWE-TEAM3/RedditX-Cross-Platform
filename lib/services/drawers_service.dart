import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config/constants.dart';
import '../models/authentication.dart';
///drawers service class that provide service needed to drawers 
class DrawersService {
  /// the base URL for cross platform API url
  final baseUrl = urlApi;
///retrieve list of user's community that he is subscribed to
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
///retrieve list of user's community that he moderates
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
