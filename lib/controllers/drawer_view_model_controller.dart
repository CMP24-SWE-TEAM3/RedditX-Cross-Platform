import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'drawer_service_model_controller.dart';

class DrawersViewModelController with ChangeNotifier {
  List<bool> expandIsOpen = List<bool>.filled(3, false);
  List<String> yourCommunities = List<String>.filled(3, "Community");
  bool? onlineStatusControl = false;
  toggleOnlineStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    onlineStatusControl = !onlineStatusControl!;
    prefs.setBool("OnlineStatus", !onlineStatusControl!);
    notifyListeners();
  }

  expandingIsOpen(int index, bool dummy) {
    expandIsOpen[index] = !expandIsOpen[index];
    getCommunitiesNames();
    notifyListeners();
  }

  getCommunitiesNames() async {
    await drawersServiceModelController.getCommunitiesServiceController();
    notifyListeners();
  }

  getModCommunitiesNames() async {
    await drawersServiceModelController
        .getModeratedCommunitiesServiceController();
    notifyListeners();
  }
}
