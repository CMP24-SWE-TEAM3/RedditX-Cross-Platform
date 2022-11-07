import 'package:flutter/material.dart';

class SettingsMobileController with ChangeNotifier {
  bool textBool = false;

  //main settings menu variables
  String userName = "USER NAME";
  //Account settings
  String switchAccountSettingsCoosen = "tmperor";
  //make profPic
  final accountList = ['User1', 'User2'];
  int indexswitchAccountSettingsCoosen = 0;
  String accountGoogleMail = "email@gmail.com";
  bool connectedToGoogle = false;
  bool allowToFollow = false;
  bool allowChatRequests = false;
  bool allowDirectMessages = false;
  //manage emails
  bool chatRequestsEmails = false;
  bool newUserWelcomeEmails = false;
  bool commentsOnYourPostsEmails = false;
  bool repliesToYourCommentsEmails = false;
  bool upvotesOnYourPostsEmails = false;
  bool upvotesOnYourCommentsEmails = false;
  bool userNameMentionsEmails = false;
  bool newFollowersEmails = false;
  bool dailyDigestEmails = false;
  bool weeklyRecapEmails = false;
  bool communityDiscoveryEmails = false;
  bool unsubscribeFromAllEmails = false;

  static List<String> genderTypes = [
    "Male",
    "Female",
    "Prefere not to say",
  ];
  static List<IconData> bottomSheetNotificationsIcons = [
    Icons.notifications_off_outlined,
    Icons.notifications,
    Icons.notifications_active_outlined
  ];
  bool googleAccountConnected = false;
  IconData notificationIcon = Icons.notifications_outlined;
  List<bool> checkIconNotification = [false, true, false];

  changer() {
    textBool = !textBool;
    notifyListeners();
  }
}
