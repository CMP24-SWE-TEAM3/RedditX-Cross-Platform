import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/community_model.dart';

import '../config/constants.dart';
import '../models/post_model.dart';
import '../services/community_services.dart';

class CommunityModelProvider with ChangeNotifier {
  bool mockData = iSMOCK;



  Future getCommunityPosts(String communityName, String sortType,
      List<dynamic> posts, int page, int limit) async {
    if (mockData) {
      communityPostsList = communityPostsListMock;
      votersCommunity=votersCommunityMock;
      notifyListeners();
    } else {
      await getAPICommunityPosts(communityName, sortType);
      communityPostsList = communityPostsListAPI;
      votersCommunity=votersCommunityAPI;
      notifyListeners();
    }
    // print(communityPostsList);
  }

  Future getCommunityAbout(String communityName) async {
    if (mockData) {
      moderators = moderatorsMock1;
      communityRules = communityRulesMock1;
    } else {
      await getAPICommunityAbout(communityName);
      moderators = moderatorsAPI;
      communityRules = communityRulesAPI;
    }
    notifyListeners();
  }

  Future getCommunityInfo(String communityName) async {
    if (mockData) {
      communityInfo = communityInfoMock;
    } else {
      await getAPICommunityInfo(communityName);
      communityInfo = communityInfoAPI;
      notifyListeners();
    }
    // print("////////////////////////////////////////");
    // print(communityInfo);
  }

  Future getCommunityFlairs(String communityName) async {
    if (mockData) {
      communityFlairs = communityFlairsMock;
    } else {
      await getAPICommunityFlairs(communityName);
      communityFlairs = communityFlairsAPI;
    }
    notifyListeners();
  }


}
