import 'package:flutter/material.dart';

class CommunityProvider with ChangeNotifier {
  bool isExpanded = false;
  double expandedHeight = 320;
  bool joined = false;

  void changeExpandedHight(bool isExpandedd) {
    isExpanded = !isExpandedd;
    if (isExpanded) {
      expandedHeight = 400;
    } else {
      expandedHeight = 320;
    }
    notifyListeners();
  }

  void joinCommunity() {
    joined = true;
    notifyListeners();
  }

  void unJoinCommunity() {
    joined = false;
    notifyListeners();
  }
}
