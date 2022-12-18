import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../config/constants.dart';
import '../models/comment_model.dart';


voteAPI(String id, int dir) async {
  const String voteRequest = "/api/listing/vote";
  Uri url = Uri.parse(urlApi + voteRequest);

  final response = await http.post(url,
      body: jsonEncode(<String, dynamic>{
        "id": id,
        "dir": dir,
      }));
  return response;
}

commentInfoAPI(
  String authorId,
  String? text,
  DateTime? createdAt,
  bool? isDeleted,
  bool? isLocked,
  DateTime? editedAt,
  String? isCollapsed,
  bool? isRoot,
  String? replyingTo,
  List<String>? replies,
  int? votesCount,
  List<voteModel>? voters,
  List<spamModel>? spams,
  int? spamCount,
) async {
  const apiRoute = "/api/user/{username}/comments";
  // final response =     await http.get(Uri.parse(urlApi + apiRoute), headers: <String, dynamic>{
  //   'Content-Type': 'application/json; charset=UTF-8',
  //   HttpHeaders.authorizationHeader: ('Bearer ${userauthentication.uid}')
  // });
}
