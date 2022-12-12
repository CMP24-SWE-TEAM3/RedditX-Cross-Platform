import 'package:flutter/material.dart';


class ProfileProvider with ChangeNotifier {
  /// Index of tabs Posts,Comments and about in both [UserProfileMobileScreen] and [UserProfileWebScreen].
  int tabIndex = 0;

  /// Toggle tab views: Posts& Comments & About
  void changeTab(int val) {
    tabIndex = val;
    notifyListeners();
  }
}
