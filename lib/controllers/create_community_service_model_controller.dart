import 'dart:convert';

import '../services/create_community_service.dart';

///createCommunity service model controller that communicates with model and service
class CreateCommunityServiceModelController {
  ///invokes create community service
  createCommunityServiceController(
      String? communityName, String? type, bool? plus18) async {
    var res = await createCommunityService.createCommunityService(
        communityName, type, plus18);
    //community name is already taken
    //log(res.body["status"]);
    if (jsonDecode(res.body)["status"] == "subreddit is already made") {
      return 1;
    }
    if (res.statusCode == 200) {
      return 0;
    }
    //server error
    return -1;
  }
}
///an instance of Create Community Service Model Controller 
CreateCommunityServiceModelController createCommunityServiceModelController =
    CreateCommunityServiceModelController();
