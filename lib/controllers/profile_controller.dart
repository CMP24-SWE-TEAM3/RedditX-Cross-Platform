import 'package:flutter/material.dart';
import 'package:search_project/config/constants.dart';
import 'package:search_project/models/post_model.dart';

import '../services/community_services.dart';

class ProfileProvider with ChangeNotifier {
  /// Index of tabs Posts,Comments and about in both [UserProfileMobileScreen] and [UserProfileWebScreen].
  int tabIndex = 0;
   bool mockData=iSMOCK;

  /// Toggle tab views: Posts& Comments & About
  void changeTab(int val) {
    tabIndex = val;
    print(postsList);
    notifyListeners();
  }

  //   Future getPosts(String communityName, String sortType, List<dynamic> posts,
  //     int page, int limit) async {
   
  //   if (mockData) {
  //     postsList = postsListMock1;
  //     notifyListeners();
  //   } else {
  //     await getAPICommunityPosts(communityName, sortType, posts, page, limit);
  //     postsList = postsListAPI;
  //     //print(",,,,,,,,,,,,,, $postsList");
  //     notifyListeners();
  //   }
  // }
}
