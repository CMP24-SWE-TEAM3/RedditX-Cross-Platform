import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../config/constants.dart';

/// fetch Search Posts Function
/// connect with the back end and sent the search word and recieve the posts
fetchSearchPosts(String searchPhrase, String sort, String tab, int page) async {
  String searchRequest = "/api/search/r?type=post&q=$searchPhrase";
  Uri url = Uri.parse(urlApi + searchRequest);
  await http
      .get(
    url,
  )
      .then(
    (value) {
      if (value.statusCode == 200) {
        var responseData = json.decode(value.body) as Map<String, dynamic>;
        return responseData['results'];
      } else {
        return [];
      }
    },
  );
}

/// fetch Search Comments Function
/// connect with the back end and sent the search word and recieve the Comments
fetchSearchComments(
    String searchPhrase, String sort, String tab, int page) async {
  String searchRequest = "/api/search/r?type=comment&q=$searchPhrase";
  Uri url = Uri.parse(urlApi + searchRequest);
  await http
      .get(
    url,
  )
      .then(
    (value) {
      if (value.statusCode == 200) {
        var responseData = json.decode(value.body) as Map<String, dynamic>;
        return responseData['results'];
      } else {
        return [];
      }
    },
  );
}

/// fetch Search users Function
/// connect with the back end and sent the search word and recieve the users
fetchSearchusers(String searchPhrase, String sort, String tab, int page) async {
  String searchRequest = "/api/search/r?type=user&q=$searchPhrase";
  Uri url = Uri.parse(urlApi + searchRequest);
  await http
      .get(
    url,
  )
      .then(
    (value) {
      if (value.statusCode == 200) {
        var responseData = json.decode(value.body) as Map<String, dynamic>;
        return responseData['results'];
      } else {
        return [];
      }
    },
  );
}

/// fetch Search communites Function
/// connect with the back end and sent the search word and recieve the communites
fetchSearchSR(String searchPhrase, String sort, String tab, int page) async {
  String searchRequest = "/api/search/r?type=sr&q=$searchPhrase&sort=$sort";
  Uri url = Uri.parse(urlApi + searchRequest);
  await http
      .get(
    url,
  )
      .then(
    (value) {
      if (value.statusCode == 200) {
        var responseData = json.decode(value.body) as Map<String, dynamic>;
        return responseData['results'];
      } else {
        return [];
      }
    },
  );
}
