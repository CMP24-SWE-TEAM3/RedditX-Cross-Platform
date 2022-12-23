import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../config/constants.dart';

/// fetch Search Posts Function
/// connect with the back end and sent the search word and recieve the posts
fetchSearchPosts(String searchPhrase, String sort, String tab, int page) async {
  String searchRequest = "/api/search/r?type=post&q=$searchPhrase";
  Uri url = Uri.parse(urlApi + searchRequest);
  ///call the API url
  var res= await http
      .get(
    url,
  );
  if (res.statusCode == 200) {
    ///if the response ended without errors==> return list of results
    return json.decode(res.body) as Map<String, dynamic>;
  } else {
    ///if the response ends with error==> retyrn empty list
    return null;
  }
}

/// fetch Search Comments Function
/// connect with the back end and sent the search word and recieve the Comments
fetchSearchComments(
    String searchPhrase, String sort, String tab, int page) async {
  ///prepare the API url
  String searchRequest = "/api/search/r?type=comment&q=$searchPhrase";
  Uri url = Uri.parse(urlApi + searchRequest);
  ///call the API url
  var res=await http
      .get(
    url,
  );
  if (res.statusCode == 200) {
    ///if the response ended without errors==> return list of results
    var responseData = json.decode(res.body) as Map<String, dynamic>;
    return responseData['results'];
    
  } else {
    ///if the response ends with error==> retyrn empty list
    return [];
  }
}

/// fetch Search users Function
/// connect with the back end and sent the search word and recieve the users
fetchSearchusers(String searchPhrase, String sort, String tab, int page) async {
  ///prepare the API url
  String searchRequest = "/api/search/r?type=user&q=$searchPhrase";
  Uri url = Uri.parse(urlApi + searchRequest);
  ///call the API url
  var res=await http
      .get(
    url,
  );
  if (res.statusCode == 200) {
    ///if the response ended without errors==> return list of results
    var responseData = json.decode(res.body) as Map<String, dynamic>;
    return responseData['results'];
  } else {
    ///if the response ends with error==> retyrn empty list
    return [];
  }
}

/// fetch Search communites Function
/// connect with the back end and sent the search word and recieve the communites
fetchSearchSR(String searchPhrase, String sort, String tab, int page) async {
  ///prepare the API url
  String searchRequest = "/api/search/r?type=sr&q=$searchPhrase&sort=$sort";
  Uri url = Uri.parse(urlApi + searchRequest);
  ///call the API url
  var res=await http
      .get(
    url,
  );
  if (res.statusCode == 200) {
    ///if the response ended without errors==> return list of results
    var responseData = json.decode(res.body) as Map<String, dynamic>;
    return responseData['results'];
  } else {
    ///if the response ends with error==> retyrn empty list
    return [];
  }
}
