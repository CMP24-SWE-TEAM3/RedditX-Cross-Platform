import 'package:flutter/material.dart';
import 'package:search_project/models/user_model.dart';
import 'package:search_project/services/profile_services.dart';

import '../config/constants.dart';
import '../models/post_model.dart';
import '../services/community_services.dart';

class ProfileModelProvider with ChangeNotifier {
  bool mockData = iSMOCK;

  Future getPosts(String communityName, String sortType, List<dynamic> posts,
      int page, int limit) async {
    if (mockData) {
      postsList = postsListMock1;
      notifyListeners();
    } else {
      await getAPICommunityPosts(communityName, sortType, posts, page, limit);
      postsList = postsListAPI;
      //print(",,,,,,,,,,,,,, $postsList");
      notifyListeners();
    }
  }

  Future getProfileAbout(String userName) async {
    if (mockData) {
      userProfileAbout=userProfileAboutMock;
      notifyListeners();
    } else {
      await getAPIProfileAbout(userName);
      userProfileAbout=userProfileAboutAPI;
      notifyListeners();
    }
  }

  Future getProfileComments(String userName) async {
    if (mockData) {
      userProfileComments=userProfileCommentsMock;
      notifyListeners();
    } else {
      await getAPIProfileComments(userName);
      userProfileComments=userProfileCommentsAPI;
      notifyListeners();
    }
  }
}