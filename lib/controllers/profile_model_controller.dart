import 'package:flutter/material.dart';

import '../config/constants.dart';
import '../models/user_model.dart';
import '../services/profile_services.dart';


/// Provider that controls the data of the user profile => connects between [user_model] and [profile_services].
class ProfileModelProvider with ChangeNotifier {
  bool mockData = iSMOCK;

    List<dynamic> upvotedPostsIDs = [];

  List<dynamic> downvotedPostsIDs = [];

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

  /// Save posts
   Future save(String id) async {
    if (!mockData) {
      saveAPI('t3_$id');
      notifyListeners();
    }
    
  }

  /// UnSave posts
  Future unSave(String id) async {
    if (!mockData) {
      unSaveAPI('t3_$id');
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

   ///Get user upvoted posts whether from API or mock data
  Future getUserUpVotedPosts(String userName) async {
    if (mockData) {
      upvotedPosts = upvotedPostsMock;
      notifyListeners();
    } else {
      await getAPIUpVotedPosts(userName);
      upvotedPosts = upvotedPostsAPI;
      
      notifyListeners();
    }


  }

     ///Get user upvoted posts whether from API or mock data
  Future getUserDownVotedPosts(String userName) async {
    if (mockData) {
      downvotedPosts = downvotedPostsMock;
      notifyListeners();
    } else {
      await getAPIDownVotedPosts(userName);
      downvotedPosts = downvotedPostsAPI;
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




}
