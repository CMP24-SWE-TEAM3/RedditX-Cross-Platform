import 'package:flutter/material.dart';
import 'package:reddit/models/post_model.dart';
import '../styles/custom_icons.dart';

class CommunityProvider with ChangeNotifier {

  //used in Join/Leave button on hover
  String joinLeaveButtonText = "Joined";
  bool isPostSaved = false;
  int tabIndex = 0;
  bool isExpanded = false;
  double expandedHeight = 320;
  bool joined = false;
  IconData notificationIcon = Icons.notifications_outlined;
  String postView = "card";
  bool isControversial = false;

  List<bool> isPostLiked = List.filled(postsList.length, false, growable: true);
  List<bool> isPostDisliked = List.filled(postsList.length, false, growable: true);
 

  List<IconData> bottomSheetNotificationsIconsFilled = [
    Icons.notifications_off,
    Icons.notifications,
    Icons.notifications_active
  ];
  List<IconData> bottomSheetNotificationsIconsOutlined = [
    Icons.notifications_off_outlined,
    Icons.notifications_outlined,
    Icons.notifications_active_outlined
  ];

  List<IconData> bottomSheetNotificationsIcons = [
    Icons.notifications_off_outlined,
    Icons.notifications,
    Icons.notifications_active_outlined
  ];

  IconData postSortByIcon = CustomIcons.hotjar;

  List<IconData> bottomSheetPostSortIcons = [
    CustomIcons.hotjar,
    CustomIcons.certificate_outline,
    CustomIcons.award,
  ];

  String postSortByType = "HOT POSTS";

  List<String> postSortByTypes = [
    "HOT POSTS",
    "NEW POSTS",
    "TOP POSTS",
  ];
  IconData postViewIcon = Icons.view_stream_outlined;
  List<IconData> bottomSheetPostViewIcons = [
    Icons.view_stream_outlined,
    CustomIcons.menu
  ];

  List<bool> checkIconNotification = [false, true, false];
  List<bool> checkIconPostView = [true, false];
  List<bool> checkIconPostSortBy = [true, false, false, false, false];

    void joinLeaveButtonOnHover() {
    joinLeaveButtonText = "Leave";
    notifyListeners();
  }

  void joinLeaveButtonOnExit() {
    joinLeaveButtonText = "Joined";
    notifyListeners();
  }

  void likePost(int index) {
    if (isPostLiked[index]) {
      postsList[index].votesCount--;
    } else {
      postsList[index].votesCount++;
    }
    isPostLiked[index] = !isPostLiked[index];
    if (isPostDisliked[index]) {
      isPostDisliked[index] = !isPostDisliked[index];
    }

    notifyListeners();
  }

  void disLikePost(int index) {
    if (isPostDisliked[index]) {
      postsList[index].votesCount++;
    } else {
      postsList[index].votesCount--;
    }
    isPostDisliked[index] = !isPostDisliked[index];
    if (isPostLiked[index]) {
      isPostLiked[index] = !isPostLiked[index];
    }
    notifyListeners();
  }

  void saveUnsavePost() {
    isPostSaved = !isPostSaved;
    notifyListeners();
  }

  void changeTab(int val) {
    tabIndex = val;
    notifyListeners();
  }

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

  void changeNotificationsType(String type, int index) {
    if (type == "Off") {
      notificationIcon = Icons.notifications_off_outlined;
    } else if (type == "Low") {
      notificationIcon = Icons.notifications_outlined;
    } else {
      notificationIcon = Icons.notifications_active_outlined;
    }
    for (int i = 0; i < 3; i++) {
      if (i == index) {
        bottomSheetNotificationsIcons[i] =
            bottomSheetNotificationsIconsFilled[i];
        checkIconNotification[i] = true;
      } else {
        bottomSheetNotificationsIcons[i] =
            bottomSheetNotificationsIconsOutlined[i];
        checkIconNotification[i] = false;
      }
    }
    notifyListeners();
  }

  void changePostView(String type, int index) {
    for (int i = 0; i < 2; i++) {
      if (i == index) {
        checkIconPostView[i] = true;
        postViewIcon = bottomSheetPostViewIcons[i];
      } else {
        checkIconPostView[i] = false;
      }
      if (index == 0) {
        postView = "card";
      } else {
        postView = "classic";
      }
    }
    notifyListeners();
  }

  void changePostSortBy(String type, int index, BuildContext context) {
    for (int i = 0; i < 5; i++) {
      if (i == index) {
        checkIconPostSortBy[i] = true;
        postSortByIcon = bottomSheetPostSortIcons[i];
        postSortByType = postSortByTypes[i];
      } else {
        checkIconPostSortBy[i] = false;
      }
    }

    notifyListeners();
  }
}
