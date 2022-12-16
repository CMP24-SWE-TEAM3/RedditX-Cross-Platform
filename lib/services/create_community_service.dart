import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../config/constants.dart';
import '../models/authentication.dart';

///create community service class
class CreateCommunityService {
  ///service for creating a new community
  createCommunityService(
      String? communityName, String? type, bool? plus18) async {
    const apiRoute = "/api/r/create-subreddit";
    final res = await http.post(Uri.parse(urlApi + apiRoute),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: ('Bearer ${userauthentication.uid}')
        },
        body: jsonEncode(<String, dynamic>{
          "name": "t5_$communityName!",
          "type": type!,
          "over18": plus18!
        }));

    log(res.body);
    log(res.statusCode.toString());
    log("t5_$communityName");
    log(type);
    log(plus18.toString());
    return res;
  }
}

CreateCommunityService createCommunityService = CreateCommunityService();
