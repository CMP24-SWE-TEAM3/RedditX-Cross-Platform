import 'package:flutter/material.dart';
import 'package:search_project/models/user_model.dart';
import 'package:search_project/services/profile_services.dart';

import '../config/constants.dart';


/// Provider that controls the data of the user profile => connects between [user_model] and [profile_services].
class ProfileModelProvider with ChangeNotifier {
  bool mockData = iSMOCK;

  /// Get profile posts whether from API or mock data
  Future getProfilePosts(String userName) async {
    if (mockData) {
      profilePosts = profilePostsMock;
      votersProfile = votersProfileMock;
      notifyListeners();
    } else {
      await getAPIProfilePosts(userName);
      profilePosts = profilePostsAPI;
      votersProfile = votersProfileAPI;
      notifyListeners();
    }
  }

  /// Get user profile info whether from API or mock data
  Future getProfileAbout(String userName) async {
    if (mockData) {
      userProfileAbout = userProfileAboutMock;
      notifyListeners();
    } else {
      await getAPIProfileAbout(userName);
      userProfileAbout = userProfileAboutAPI;
      notifyListeners();
    }
  }

  /// Get user comments whether from API or mock data
  Future getProfileComments(String userName) async {
    if (mockData) {
      userProfileComments = userProfileCommentsMock;
      commentsPostTitles = commentsPostTitlesMock;
      notifyListeners();
    } else {
      await getAPIProfileComments(userName);
      userProfileComments = userProfileCommentsAPI;
      String ids = "";
      for (int i = 0; i < userProfileComments.length; i++) {
        // ignore: prefer_interpolation_to_compose_strings
        ids += "t3_" + userProfileComments[i]["replyingTo"];
        if (i != userProfileComments.length - 1) {
          ids += ',';
        }
      }
      await getCommentPostTitles(ids);
      commentsPostTitles = commentsPostTitlesAPI;
      notifyListeners();
    }
  }

  /// Get avatars of communities whether from API or mock data
  Future getProfilePostsCommunityAvatars(String communityName) async {
    if (mockData) {
      profilePostsCommunityAvatars = profilePostsCommunityMock;
      notifyListeners();
    } else {
      await getProfilePostsCommunityAvatarsAPI(communityName);
      profilePostsCommunityAvatars = profilePostsCommunityAvatarsAPI;
      notifyListeners();
    }
  }

  ///Get user saved posts whether from API or mock data
   Future getUserSavedPosts() async {
    if (mockData) {
        savedPosts=savedPostsMock;
      notifyListeners();
    } else {
      await getAPISavedPosts();
      savedPosts=savedPostsAPI;
      notifyListeners();
    }
  }
  

  /// Upvote, downvote or cancel vote
  Future vote(String id, int dir) async {
    if (!mockData) {
      voteAPI(id, dir);

      notifyListeners();
    }
  }

  /// Get vote type: Upvote, downvote or cancel vote
  // Future getAPIVoteTypes(String postPlace) async {
  //   if (postPlace == 'home') {
  //     for (int i = 0; i <= votersHome.length; i++) {
  //       if (votersHome[i][0]['userID'] == 't2_lotfy2') {
  //         profilePostsVotesType[i] = votersHome[i]['voteType'];
  //         notifyListeners();
  //       }
  //     }
  //   } else if (postPlace == 'community') {
  //     for (int i = 0; i <= votersCommunity.length; i++) {
  //       if (votersCommunity[i][0]['userID'] == 't2_lotfy2') {
  //         profilePostsVotesType[i] = votersCommunity[i]['voteType'];
  //         notifyListeners();
  //       }
  //     }
  //   } else {
  //     for (int i = 0; i <= votersProfile.length; i++) {
  //       if (votersProfile[i][0]['userID'] == 't2_lotfy2') {
  //         profilePostsVotesType[i] = votersProfile[i]['voteType'];
  //         notifyListeners();
  //       }
  //     }
  //   }
  // }
}
