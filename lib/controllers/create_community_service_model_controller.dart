import '../services/create_community_service.dart';

///create community service model controller
class CreateCommunityServiceModelController {
  ///invokes create community service
  createCommunityServiceController(
      String? communityName, String? type, bool? plus18) async {
    var res = await createCommunityService.createCommunityService(
        communityName, type, plus18);
    if (res.statusCode == 200) {
      return 0;
    }
    //community name is already taken
    if (res.statusCode == 500) {
      return 1;
    }
    //server error
    return -1;
  }
}

CreateCommunityServiceModelController createCommunityServiceModelController =
    CreateCommunityServiceModelController();
