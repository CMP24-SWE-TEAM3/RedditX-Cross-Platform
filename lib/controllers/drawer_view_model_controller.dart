import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'drawer_service_model_controller.dart';
///Drawers View Model Controller that communicates with service and model 
class DrawersViewModelController with ChangeNotifier {
  ///booleans for left drawer that toggles exxpansion panel opening or closing
  List<bool> expandIsOpen = List<bool>.filled(3, false);
///list of user's communities that he is subscribed to , retrieved from database
  List<String> yourCommunities = List<String>.filled(3, "Community");
///boolean to indicate whether the user is shown as online to other users or not
  bool? onlineStatusControl = false;
///function to toggle online status of the user and save them in shared prefs
  toggleOnlineStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    onlineStatusControl = !onlineStatusControl!;
    prefs.setBool("OnlineStatus", !onlineStatusControl!);
    notifyListeners();
  }
///toggles opening of certain expansion panel in left drawer, calls service that updates list of user's commuities
  expandingIsOpen(int index, bool dummy) {
    expandIsOpen[index] = !expandIsOpen[index];
    getCommunitiesNames();
    notifyListeners();
  }
///invokes service model that retrieves user's subscribed communitites
  getCommunitiesNames() async {
    await drawersServiceModelController.getCommunitiesServiceController();
    notifyListeners();
  }
///invokes service model that retrieves user's moderating communitites
  getModCommunitiesNames() async {
    await drawersServiceModelController
        .getModeratedCommunitiesServiceController();
    notifyListeners();
  }
}
