// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:reddit/controllers/validations.dart';
import 'package:reddit/models/settings_model.dart';

import 'settings_service_model_controller.dart';

///settings provider, contains user settings' controller methods
class SettingsViewModelMobileController with ChangeNotifier {
  //Account settings screen
  ///choosen account name

  String switchAccountSettingsCoosen = "tmperor";
  // ignore: todo
  //TODO : add statemanagement in buttomsheet
  //make profPic
  final accountList = ['User1', 'User2'];
  int indexswitchAccountSettingsCoosen = 0;

  ///Connected to google or disconnected
  bool connectedToGoogle = false;

  ///Toggles ConnectedToGoogle if connected it disconnects
  toggleConnectedToGoogle() {
    connectedToGoogle = !connectedToGoogle;
    // ignore: todo
    //TODO call service of diconnection and connection
    notifyListeners();
  }

  updateIsPasswordCheck() {
    settingsServiceModelController.getIsPasswordSet();
    //notifyListeners();
  }

  updateEmail(String newEmail) {
    String? validation = emailValidation(newEmail);
    //if (validation == null) {
    settingsServiceModelController.updateEmailModelController(newEmail);
    settingsModel.updateEmailErrorMessage = null;
    notifyListeners();
    return 0;
    // } else {
    //   //not valid
    //   settingsModel.updateEmailErrorMessage = validation;
    //   notifyListeners();
    //   return 1;
    // }
  }

  sendRedditPasswordToEmail() {
    settingsServiceModelController.sendRedditPasswordToEmailService();
  }

  ///Toggles AllowChatRequests switch
  toggleAllowChatRequests() {
    allowChatRequests = !allowChatRequests;
    notifyListeners();
  }

  ///Toggles AllowDirectMessages switch
  toggleAllowDirectMessages() {
    allowDirectMessages = !allowDirectMessages;
    notifyListeners();
  }

  ///allowToFollow switch in account settings page
  bool allowToFollow = false;

  ///allowChatRequests switch in account settings page
  bool allowChatRequests = false;

  ///allowDirectMessages switch in account settings page
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
  ///Toggles ChatRequestsEmails switch in manage emails screen
  toggleChatRequestsEmails() {
    chatRequestsEmails = !chatRequestsEmails;
    notifyListeners();
  }

  ///Toggles InboxMessagesEmails switch in manage emails screen
  toggleInboxMessagesEmails() {
    inboxMessagesEmails = !inboxMessagesEmails;
    notifyListeners();
  }

  ///Toggles AllowToFollow switch in manage emails screen
  toggleAllowToFollow() {
    allowToFollow = !allowToFollow;
    notifyListeners();
  }

  ///Toggles NewUserWelcomeEmails switch  in manage emails screen
  toggleNewUserWelcomeEmails() {
    newUserWelcomeEmails = !newUserWelcomeEmails;
    notifyListeners();
  }

  ///Toggles CommentsOnYourPostsEmails switch in manage emails screen
  toggleCommentsOnYourPostsEmails() {
    commentsOnYourPostsEmails = !commentsOnYourPostsEmails;
    notifyListeners();
  }

  ///Toggles RepliesToYourCommentsEmails switch in manage emails screen
  toggleRepliesToYourCommentsEmails() {
    repliesToYourCommentsEmails = !repliesToYourCommentsEmails;
    notifyListeners();
  }

  ///Toggles UpvotesOnYourPostsEmails switch in manage emails screen
  toggleUpvotesOnYourPostsEmails() {
    upvotesOnYourPostsEmails = !upvotesOnYourPostsEmails;
    notifyListeners();
  }

  ///Toggles UpvotesOnYourCommentsEmails switch in manage emails screen
  toggleUpvotesOnYourCommentsEmails() {
    upvotesOnYourCommentsEmails = !upvotesOnYourCommentsEmails;
    notifyListeners();
  }

  ///Toggles UserNameMentionsEmails switch in manage emails screen
  toggleUserNameMentionsEmails() {
    userNameMentionsEmails = !userNameMentionsEmails;
    notifyListeners();
  }

  ///Toggles NewFollowersEmails switch in manage emails screen
  toggleNewFollowersEmails() {
    newFollowersEmails = !newFollowersEmails;
    notifyListeners();
  }

  ///Toggles DailyDigestEmails switch in manage emails screen
  toggleDailyDigestEmails() {
    dailyDigestEmails = !dailyDigestEmails;
    notifyListeners();
  }

  ///Toggles WeeklyRecapEmails switch in manage emails screen
  toggleWeeklyRecapEmails() {
    weeklyRecapEmails = !weeklyRecapEmails;
    notifyListeners();
  }

  ///Toggles CommunityDiscoveryEmails switch in manage emails screen
  toggleCommunityDiscoveryEmails() {
    communityDiscoveryEmails = !communityDiscoveryEmails;
    notifyListeners();
  }

  ///Toggles UnsubscribeFromAllEmails switch and disable manage email switches in manage emails screen
  toggleUnsubscribeFromAllEmails() {
    unsubscribeFromAllEmails = !unsubscribeFromAllEmails;
    unsubscribeFromAllEmailsEnabling = !(unsubscribeFromAllEmails);
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
  IconData notificationIcon = Icons.notifications_outlined;
  List<bool> checkIconNotification = [false, true, false];
}
