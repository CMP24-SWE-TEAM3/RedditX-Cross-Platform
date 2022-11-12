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
  toggleConnectedToGoogle() {
    connectedToGoogle = !connectedToGoogle;
    notifyListeners();
  }

  toggleAllowChatRequests() {
    allowChatRequests = !allowChatRequests;
    notifyListeners();
  }

  toggleAllowDirectMessages() {
    allowDirectMessages = !allowDirectMessages;
    notifyListeners();
  }

  bool allowToFollow = false;
  bool allowChatRequests = false;
  bool allowDirectMessages = false;
  bool inboxMessagesEmails = false;

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
  bool unsubscribeFromAllEmailsEnabling = true;
  //manage emails
  toggleChatRequestsEmails() {
    chatRequestsEmails = !chatRequestsEmails;
    notifyListeners();
  }

  toggleInboxMessagesEmails() {
    inboxMessagesEmails = !inboxMessagesEmails;
    notifyListeners();
  }

  toggleAllowToFollow() {
    allowToFollow = !allowToFollow;
    notifyListeners();
  }

  toggleNewUserWelcomeEmails() {
    newUserWelcomeEmails = !newUserWelcomeEmails;
    notifyListeners();
  }

  toggleCommentsOnYourPostsEmails() {
    commentsOnYourPostsEmails = !commentsOnYourPostsEmails;
    notifyListeners();
  }

  toggleRepliesToYourCommentsEmails() {
    repliesToYourCommentsEmails = !repliesToYourCommentsEmails;
    notifyListeners();
  }

  toggleUpvotesOnYourPostsEmails() {
    upvotesOnYourPostsEmails = !upvotesOnYourPostsEmails;
    notifyListeners();
  }

  toggleUpvotesOnYourCommentsEmails() {
    upvotesOnYourCommentsEmails = !upvotesOnYourCommentsEmails;
    notifyListeners();
  }

  toggleUserNameMentionsEmails() {
    userNameMentionsEmails = !userNameMentionsEmails;
    notifyListeners();
  }

  toggleNewFollowersEmails() {
    newFollowersEmails = !newFollowersEmails;
    notifyListeners();
  }

  toggleDailyDigestEmails() {
    dailyDigestEmails = !dailyDigestEmails;
    notifyListeners();
  }

  toggleWeeklyRecapEmails() {
    weeklyRecapEmails = !weeklyRecapEmails;
    notifyListeners();
  }

  toggleCommunityDiscoveryEmails() {
    communityDiscoveryEmails = !communityDiscoveryEmails;
    notifyListeners();
  }

  toggleUnsubscribeFromAllEmails() {
    unsubscribeFromAllEmails = !unsubscribeFromAllEmails;
    if (unsubscribeFromAllEmails) {
      unsubscribeFromAllEmailsEnabling = false;
    } else {
      unsubscribeFromAllEmailsEnabling = true;
    }
    notifyListeners();
  }

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
