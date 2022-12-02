import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../config/constants.dart';

fetchSearchPosts(String searchPhrase, String sort, String tab, int page) async {
  String searchRequest = "/api/search/r?type=post&q=text";
  Uri url = Uri.parse(urlApi + searchRequest);
  var res = await http.get(
    url,
  );
  return json.decode(res.body) as Map<String, dynamic>;
}

fetchSearchComments(
    String searchPhrase, String sort, String tab, int page) async {
  String searchRequest = "/api/search/r?type=comment&q=xttexttex";
  Uri url = Uri.parse(urlApi + searchRequest);
  var res = await http.get(
    url,
  );
  return json.decode(res.body) as Map<String, dynamic>;
}

fetchSearchusers(String searchPhrase, String sort, String tab, int page) async {
  String searchRequest = "/api/search/r?type=user&q=moaz";
  Uri url = Uri.parse(urlApi + searchRequest);
  var res = await http.get(
    url,
  );
  return json.decode(res.body) as Map<String, dynamic>;
}

fetchSearchSR(String searchPhrase, String sort, String tab, int page) async {
  String searchRequest = "/api/search/r?type=sr&q=image";
  Uri url = Uri.parse(urlApi + searchRequest);
  var res = await http.get(
    url,
  );
  return json.decode(res.body) as Map<String, dynamic>;
}
