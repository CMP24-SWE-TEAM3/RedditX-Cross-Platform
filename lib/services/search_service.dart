import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../config/constants.dart';

fetchSearchPosts(String searchPhrase, String sort, String tab, int page) async {
  String searchRequest = "/api/search/r?type=post&q=text";
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
