import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';
import '../../config/constants.dart';
import '../models/authentication.dart';

fetchMySubscribed() async {
  String searchRequest = "/api/r/mine/subscriber";
  final res = await http.get(
    Uri.parse(urlApi + searchRequest),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: 'Bearer ${userauthentication.uid}'
    },
  );
  if (res.statusCode == 200) {
    var response = json.decode(res.body) as Map<String, dynamic>;
    return response['communities'];
  } else {
    return [];
  }
}

submitPost(
  bool nsfw,
  bool spoiler,
  String title,
  String text,
  String flairText,
  String flairTextColor,
  String flairBackGround,
  String flairTextID,
  String communityID,
  List attachments,
  List attachementTypes,
) async {
  String url = '';
  var dio = Dio();
  try {
    FormData formData = FormData.fromMap({
      'spoiler': spoiler,
      'nsfw': nsfw,
      'title': title,
      'text': text,
      'communityID': communityID,
      'type': 'link',
      'flairID': flairTextID,
      'flairText': flairText,
      'flairTextColor': flairTextColor,
      'flairBackGround': flairBackGround,
      'createdAt': DateTime.now(),
    });
    for (int i = 0; i < attachments.length; i++) {
      String fileName = attachments[i].path.split('/').last;
      String ext = attachments[i].path.split('/').last.split('.').last;
      formData.files.add(
        MapEntry(
          'attachments',
          await MultipartFile.fromFile(
            attachments[i].path,
            filename: fileName,
            contentType: MediaType(attachementTypes[i], ext),
          ),
        ),
      );
    }

    var response = await dio.post(
      url,
      data: formData,
      options: Options(
        headers: {
          'accept': '*/*',
          'authorization': "Bearer ${userauthentication.uid}",
          'Content-Type': 'multipart/form-data',
        },
      ),
    );
    return response;
  } catch (e) {
    return e;
  }
}

getAPICommunityFlairs(String communityName) async {
  String searchRequest = "/api/r/$communityName/api/flair-list";
  Uri url = Uri.parse(urlApi + searchRequest);
  await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: ('Bearer ${userauthentication.uid}')
    },
  ).then(
    (value) {
      if (value.statusCode == 200) {
        var responseData = json.decode(value.body) as Map<String, dynamic>;
        return responseData['flairs'];
      } else {
        return [];
      }
    },
  );
}

getAPICommunityRules(String communityName) async {
  String searchRequest = "/api/r/$communityName";
  Uri url = Uri.parse(urlApi + searchRequest);
  await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: ('Bearer ${userauthentication.uid}')
    },
  ).then(
    (value) {
      if (value.statusCode == 200) {
        var responseData = json.decode(value.body) as Map<String, dynamic>;
        //print(responseData);
        return responseData['communityRules'];
      } else {
        return [];
      }
    },
  );
}
