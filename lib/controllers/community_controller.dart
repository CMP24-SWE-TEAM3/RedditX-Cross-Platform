import 'package:flutter/material.dart';
import '../models/post_model.dart';
import '../styles/custom_icons.dart';

/// Provider used for [CommunityMobileScreen] and [CommunityWebScreen].

class CommunityProvider with ChangeNotifier {
  final CommunityService communityService;

  CommunityProvider({required this.communityService});

  /// used in Join/Leave button in [CommunityWebScreen] on hover.
  String joinLeaveButtonText = "Joined";

  /// Index of tabs Posts and about in both [CommunityMobileScreen] and [CommunityWebScreen].
  int tabIndex = 0;

  /// Determine whether the Sliver app bar in [CommunityMobileScreen] expanded or not
  bool isExpanded = false;

  /// Determine the height of the expanded part in the Sliver app bar of [CommunityMobileScreen]
  double expandedHeight = 320;

  /// Determine whether the user joined the community or not.
  bool joined = false;

  /// Icon of the notification state: Low, Off or frequent => Low is the default
  IconData notificationIcon = Icons.notifications_outlined;

  /// Determine the post view: Card or Classic
  String postView = "card";

  /// List of the posts liked/not liked by the user
  List<bool> isPostLiked =
      List.filled(communityPostsList.length, false, growable: true);

  /// List of the posts disliked/not disliked by the user
  List<bool> isPostDisliked =
      List.filled(communityPostsList.length, false, growable: true);

  /// List of the posts saved/not saved by the user
  List<bool> isPostSaved =
      List.filled(communityPostsList.length, false, growable: true);

  /// List of the Notifications bottom sheet: Off, Low and Frequent if choosen
  List<IconData> bottomSheetNotificationsIconsFilled = [
    Icons.notifications_off,
    Icons.notifications,
    Icons.notifications_active
  ];

  /// List of the Notifications bottom sheet: Off, Low and Frequent if not choosen
  List<IconData> bottomSheetNotificationsIconsOutlined = [
    Icons.notifications_off_outlined,
    Icons.notifications_outlined,
    Icons.notifications_active_outlined
  ];

  /// List of the Notifications bottom sheet: (Off, Low and Frequent) that will be passed to [showDefaultBottomSheet] method
  List<IconData> bottomSheetNotificationsIcons = [
    Icons.notifications_off_outlined,
    Icons.notifications,
    Icons.notifications_active_outlined
  ];

  /// Icon of posts sort type => Hot sort is the default with fire icon
  IconData postSortByIcon = Icons.local_fire_department_rounded;

  /// List of the posts sort types icons bottom sheet: (Hot, New and Top) that will be passed to [showDefaultBottomSheet] method
  List<IconData> bottomSheetPostSortIcons = [
    Icons.local_fire_department_rounded,
    CustomIcons.certificateOutline,
    CustomIcons.award,
  ];

  /// posts sort type => Hot sort is the default with fire icon
  String postSortByType = "HOT POSTS";

  /// List of the posts sort types bottom sheet: (Hot, New and Top) that will be passed to [showDefaultBottomSheet] method
  List<String> postSortByTypes = [
    "HOT POSTS",
    "NEW POSTS",
    "TOP POSTS",
  ];

  /// Icon of posts sort type => Hot sort is the default with fire icon
  IconData postViewIcon = Icons.view_stream_outlined;

  /// List of post view icons (card or classic) that will be passed to [showDefaultBottomSheet] method
  List<IconData> bottomSheetPostViewIcons = [
    Icons.view_stream_outlined,
    CustomIcons.menu
  ];

  /// List to determine which notification setting is chosen.
  ///
  /// will be passed to [showDefaultBottomSheet] method
  List<bool> checkIconNotification = [false, true, false];

  /// List to determine which post view is chosen.
  ///
  /// will be passed to [showDefaultBottomSheet] method
  List<bool> checkIconPostView = [true, false];

  /// List to determine which post sort type is chosen.
  ///
  /// will be passed to [showDefaultBottomSheet] method
  List<bool> checkIconPostSortBy = [true, false, false];

  /// List to determine which notification setting is chosen.
  ///
  /// will be used in [CommunityWebScreen]
  List<bool> sortPostsButtonsHover = [false, false, false];

  /// Set a [value] to a posts sort type Button of an [index]
  void sortPostsButtonsOnHover(bool value, int index) {
    sortPostsButtonsHover[index] = value;
    notifyListeners();
  }

  /// Set the text of the Join/Leave button to "Leave" on Hover
  void joinLeaveButtonOnHover() {
    joinLeaveButtonText = "Leave";
    notifyListeners();
  }

  /// Set the text of the Join/Leave button to "Joined" on Exit
  void joinLeaveButtonOnExit() {
    joinLeaveButtonText = "Joined";
    notifyListeners();
  }

  /// Like a post of an [index]
  void likePost(int index,List<dynamic>posts) {
    int? votes = posts[index]['votesCount'];
    // Solves a problem of null safety
    if (votes != null) {
      if (isPostLiked[index]) {
        votes--;
      } else if (isPostDisliked[index]) {
        votes += 2;
      } else {
        votes++;
      }
      isPostLiked[index] = !isPostLiked[index];
      if (isPostDisliked[index]) {
        isPostDisliked[index] = !isPostDisliked[index];
      }
    }
    posts[index]['votesCount'] = votes;
    notifyListeners();
  }

  /// Dislike a post of an [index]
  void disLikePost(int index, List<dynamic> posts) {
    int? votes = posts[index]['votesCount'];
    if (votes != null) {
      if (isPostDisliked[index]) {
        votes++;
      } else if (isPostLiked[index]) {
        votes -= 2;
      } else {
        votes--;
      }
      isPostDisliked[index] = !isPostDisliked[index];
      if (isPostLiked[index]) {
        isPostLiked[index] = !isPostLiked[index];
      }
    }
    posts[index]['votesCount'] = votes;

    notifyListeners();
  }

  /// Save or unsave post of an [index]
  void saveUnsavePost(int index) {
    isPostSaved[index] = !isPostSaved[index];
    notifyListeners();
  }

  /// Toggle tab views: Posts & About
  void changeTab(int val) {
    tabIndex = val;
    notifyListeners();
  }

  /// Set expanded height of sliver app bar of [CommunityMobileScreen]
  void changeExpandedHight(bool isExpandedd) {
    isExpanded = !isExpandedd;
    if (isExpanded) {
      expandedHeight = 450;
    } else {
      expandedHeight = 350;
    }
    notifyListeners();
  }

  /// Set the [joined] variable to true to join community
  void joinCommunity() {
    joined = true;
    notifyListeners();
  }

  /// Set the [joined] variable to false to unjoin community
  void unJoinCommunity() {
    joined = false;
    notifyListeners();
  }

  /// Set the notification type to [type] which has an [index] in the [bottomSheetNotificationsIcons]
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

  /// Set the post view to [type] which has an [index] in the [bottomSheetPostViewIcons]
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

  /// Set the posts sort type to [type] which has an [index] in the [bottomSheetPostSortIcons]
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

  /// calculating the age of posts from the DateTime they created at [createdAt]
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
