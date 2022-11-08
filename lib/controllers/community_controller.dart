import 'package:flutter/material.dart';
import 'package:reddit/models/post_model.dart';
import '../styles/custom_icons.dart';

class CommunityProvider with ChangeNotifier {
  //used in Join/Leave button on hover
  String joinLeaveButtonText = "Joined";

  int tabIndex = 0;
  bool isExpanded = false;
  double expandedHeight = 320;
  bool joined = false;
  IconData notificationIcon = Icons.notifications_outlined;
  String postView = "card";
  bool isControversial = false;

  List<bool> isPostLiked = List.filled(postsList.length, false, growable: true);
  List<bool> isPostDisliked =
      List.filled(postsList.length, false, growable: true);
  List<bool> isPostSaved = List.filled(postsList.length, false, growable: true);

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

  IconData postSortByIcon = Icons.local_fire_department_rounded;

  List<IconData> bottomSheetPostSortIcons = [
    Icons.local_fire_department_rounded,
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
  List<bool> checkIconPostSortBy = [true, false, false];
  List<bool> sortPostsButtonsHover = [false, false, false];



  void sortPostsButtonsOnHover(bool value,int index) {
    sortPostsButtonsHover[index] = value;
    notifyListeners();
  }

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

  void saveUnsavePost(int index) {
    isPostSaved[index] = !isPostSaved[index];
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
    for (int i = 0; i < 3; i++) {
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

  calculateAge(DateTime createdAt) {
    String shownDate = '';
    //calculate the number of days,months and years the person has been in Reddit
    int years = DateTime.now().year - createdAt.year;
    int months = DateTime.now().month - createdAt.month;
    int days = DateTime.now().day - createdAt.day;
    int hours = DateTime.now().hour - createdAt.hour;
    int minutes = DateTime.now().minute - createdAt.minute;
    int seconds = DateTime.now().second - createdAt.second;
    //negative value means the current second/minute/day/month is less than the DateTime of the post
    //so it means we are in a minute/day/month/year after that one but not a full minute/day/month/year have passed
    //so we subtract it
    //Ex:3/11/2022-5/12/2022
    if (months < 0) {
      months = (12 - createdAt.month) + DateTime.now().month;
      years -= 1;
    }
    if (days < 0) {
      int daysCount = createdAt.month == 2
          ? 28
          : (createdAt.month == 1 ||
                  createdAt.month == 3 ||
                  createdAt.month == 5 ||
                  createdAt.month == 7 ||
                  createdAt.month == 8 ||
                  createdAt.month == 10 ||
                  createdAt.month == 12)
              ? 31
              : 30;
      days = (daysCount - createdAt.day) + DateTime.now().day;
      months -= 1;
    }
    if (hours < 0) {
      hours = (24 - createdAt.hour) + DateTime.now().hour;
      days -= 1;
    }
    if (minutes < 0) {
      minutes = (60 - createdAt.minute) + DateTime.now().minute;
      hours -= 1;
    }
    if (seconds < 0) {
      hours = (60 - createdAt.second) + DateTime.now().second;
      minutes -= 1;
    }
    //format the shown period according to the values of days,months and years
    if (years != 0) {
      shownDate = '${years}y';
    } else if (months != 0) {
      shownDate = '${months}mo';
    } else if (days != 0) {
      shownDate = '${days}d';
    } else if (hours != 0) {
      shownDate = '${hours}h';
    } else if (minutes != 0) {
      shownDate = '${minutes}m';
    } else if (seconds != 0) {
      shownDate = '${seconds}s';
    } else {
      shownDate = 'now';
    }

    return shownDate;
  }
}
