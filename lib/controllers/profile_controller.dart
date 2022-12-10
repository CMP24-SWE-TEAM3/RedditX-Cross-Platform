import 'package:flutter/material.dart';
import 'package:search_project/models/post_model.dart';

class ProfileProvider with ChangeNotifier {
  /// Index of tabs Posts,Comments and about in both [UserProfileMobileScreen] and [UserProfileWebScreen].
  int tabIndex = 0;

  /// Toggle tab views: Posts& Comments & About
  void changeTab(int val) {
    tabIndex = val;
    print(postsList);
    notifyListeners();
  }
}
