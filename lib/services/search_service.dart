import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config/constants.dart';

/// fetch Search Posts Function
/// connect with the back end and sent the search word and recieve the posts
fetchSearchPosts(String searchPhrase, String sort, String tab, int page) async {
  String searchRequest = "/api/search/r?type=post&q=text";
  Uri url = Uri.parse(urlApi + searchRequest);
  var res = await http.get(
    url,
  );
  return json.decode(res.body) as Map<String, dynamic>;
}

/// fetch Search Comments Function
/// connect with the back end and sent the search word and recieve the Comments
fetchSearchComments(
    String searchPhrase, String sort, String tab, int page) async {
  String searchRequest = "/api/search/r?type=comment&q=xttexttex";
  Uri url = Uri.parse(urlApi + searchRequest);
  var res = await http.get(
    url,
  );
  return json.decode(res.body) as Map<String, dynamic>;
}

/// fetch Search users Function
/// connect with the back end and sent the search word and recieve the users
fetchSearchusers(String searchPhrase, String sort, String tab, int page) async {
  String searchRequest = "/api/search/r?type=user&q=moaz";
  Uri url = Uri.parse(urlApi + searchRequest);
  var res = await http.get(
    url,
  );
  return json.decode(res.body) as Map<String, dynamic>;
}

/// fetch Search communites Function
/// connect with the back end and sent the search word and recieve the communites
fetchSearchSR(String searchPhrase, String sort, String tab, int page) async {
  String searchRequest = "/api/search/r?type=sr&q=image";
  Uri url = Uri.parse(urlApi + searchRequest);
  var res = await http.get(
    url,
  );
  return json.decode(res.body) as Map<String, dynamic>;
}
