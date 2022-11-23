// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reddit/config/constants.dart';

getAPICommunityPosts(String communityName, String sortType, List<dynamic> posts,
    int page, int limit) async {
  var queryParameters = {'page': page, 'limit': limit};
  Uri url = Uri.https(
    "api.redditswe22.tech",
    "/api/listing/posts/r/{$communityName}/$sortType",
    {
      'mapData': jsonEncode(queryParameters),
    },
  );
  final response = await http.get(url);
  var responseData = json.decode(response.body);
  if (responseData['posts'] != null) {
    posts = responseData['posts'];
  } else {
    posts = [];
  }

  return response;
}

voteAPI(String id, int dir) async {
  const String voteRequest = "/api/listing/vote";
  Uri url = Uri.parse(urlApi + voteRequest);

  final response = await http.post(url,
      body: jsonEncode(<String, dynamic>{
        "id": id,
        "dir": dir,
      }));
  print(response.body);
  print(response.statusCode);

  return response;
}
