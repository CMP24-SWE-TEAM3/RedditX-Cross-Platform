import 'dart:convert';
import 'dart:io';

import '../config/constants.dart';
import 'package:http/http.dart' as http;

import '../models/authentication.dart';

/// addCommentApi Function
/// connect with the back end and send the [postId] and the [text] to make the comment on the post
addCommentApi(postId, text) async {
  const String addCommentRequest = "/api/listing/addcomment";
  Uri url = Uri.parse(urlApi + addCommentRequest);

  final response = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: ('Bearer ${userauthentication.uid}'),
      },
      body: json.encode({
        "postID": postId,
        "textHTML": text,
        "textJSON": text,
      }));

  // print(response.body);

  return response;
}
