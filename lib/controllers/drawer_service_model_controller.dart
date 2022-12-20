import 'dart:convert';
import '../models/drawers_model.dart';
import '../services/drawers_service.dart';

///create community service model controller
class DrawersServiceModelController {
  ///invokes create community service
  getCommunitiesServiceController() async {
    var res = await drawersService.getCommunitiesService();
    //community name is already taken
    //log(res.body["status"]);
    if (res != null) {
      for (var e in res) {
        communitiesListLeftDrawer!.add(e['_id']);
      }
      return res;
    }
    //server error
    communitiesListLeftDrawer = ["no communities yet"];
    return null;
  }

  getModeratedCommunitiesServiceController() async {
    var res = await drawersService.getModeratedCommunitiesService();
    //community name is already taken
    //log(res.body["status"]);
    if (res != null) {
      for (var e in res) {
        moderatedCommunitiesListLeftDrawer!.add(e['_id']);
      }
      return res;
    }
    //server error
    moderatedCommunitiesListLeftDrawer = ["no mod communities yet"];
    return null;
  }
}

DrawersServiceModelController drawersServiceModelController =
    DrawersServiceModelController();
