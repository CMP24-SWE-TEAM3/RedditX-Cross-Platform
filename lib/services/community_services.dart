// ignore_for_file: depend_on_referenced_packages
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reddit/config/constants.dart';
import 'package:reddit/models/post_model.dart';

/// Get posts of a specific community with a sort type
getAPICommunityPosts(String communityName, String sortType, List<dynamic> posts,
    int page, int limit) async {
  var queryParameters = {'page': page, 'limit': limit};
  Uri url = Uri.https(
    "api.redditswe22.tech",
    "/api/listing/posts/r/t5_imagePro235/$sortType",
    {
      'mapData': jsonEncode(queryParameters),
    },
  );
  await http.get(url).then((value) {
    if (value.statusCode == 200) {
      var responseData = json.decode(value.body) as Map<String, dynamic>;
      postsListAPI = responseData['posts'];
    }
  });
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
