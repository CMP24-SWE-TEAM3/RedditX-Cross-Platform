import 'package:search_project/models/settings_model.dart';

import '../services/settings_service.dart';
import '../models/user_model.dart';

///class that communicates with service model
class SettingsServiceModelController {
  ///invokes service for getting is password reset
  getIsPasswordSet() async {
    currentUser?.isPasswordSet =
        await settingsService.getIsPasswordSetService();
  }

  ///invokes service for getting user's email
  getEmailServiceController() async {
    currentUser?.email =
        await settingsService.getEmailService() ?? "mockmail@mock.com";
  }

  ///invokes service for sending email to set up reddit password
  sendRedditPasswordToEmailService() async {
    await settingsService.sendRedditPasswordToEmailService(
        email: currentUser?.email, userName: currentUser?.username);
  }

  ///invokes update email service and passes [newEmail]
  updateEmailModelController(String? newEmail) async {
    final res = await settingsService.updateEmailService(newEmail);
    if (res.statusCode == 200) {
      // update email
      currentUser?.email = newEmail;
      return 0;
    } else {
      settingsModel.updateEmailErrorMessage =
          "Server failed , please try again later.";
      return -1;
    }
  }

  ///invokes change password service
  ///and passes [currentPassword],[newPassword].[confirmNewPassword]

  changePasswordModelController(String? currentPassword, String? newPassword,
      String? confirmNewPassword) async {
    final res = await settingsService.changePasswordService(
        currentPassword, newPassword, confirmNewPassword);
    if (res.statusCode == 200) {
      // change password
      currentUser?.passwordChangedAt = DateTime.now();
      return 0;
    } else {
      settingsModel.newPasswordErrorMessage =
          "Server failed , please try again later.";
      return -1;
    }
  }

  ///invokes service for updating user pref(s)
  changePrefsServiceController(Map<String, bool>? prefs) async {
    final res = await settingsService.updatePrefsService(prefs: prefs);
    if (res.statusCode == 200) {
      return 0;
    } else {
      return 1;
    }
  }

  ///calls service to fill user prefs model from Database
  Future<Map<String, bool>?> getUserPrefsModelController() async {
    final res = await settingsService.getUserPrefsService();
    if (res != null) {
      currentUser?.userPrefs?.threadedMessages = res["threadedMessages"];
      currentUser?.userPrefs?.threadedMessages = res["threadedMessages"];
      currentUser?.userPrefs?.showLinkFlair = res["showLinkFlair"];
      currentUser?.userPrefs?.countryCode = res["countryCode"];
      currentUser?.userPrefs?.emailCommentReply = res["emailCommentReply"];
      currentUser?.userPrefs?.emailUpVoteComment = res["emailUpvoteComment"];
      currentUser?.userPrefs?.emailMessages = res["emailMessages"];
      currentUser?.userPrefs?.emailPostReply = res["emailPostReply"];
      currentUser?.userPrefs?.emailPrivateMessage = res["emailPrivateMessage"];
      currentUser?.userPrefs?.over18 = res["over18"];
      currentUser?.userPrefs?.labelNSFW = res["labelNsfw"];
      currentUser?.userPrefs?.markMessagesRead = res["markMessageRead"];
      currentUser?.userPrefs?.enableFollowers = res["enableFollwers"];
      currentUser?.userPrefs?.publicVotes = res["publicVotes"];
      currentUser?.userPrefs?.showLocationBasedRecommendation =
          res["showLocationBasedRecommendations"];
      currentUser?.userPrefs?.searchIncludeOver18 = res["searchIncludeOver18"];
      currentUser?.userPrefs?.defaultCommentSort = res["defaultCommentSort"];
      currentUser?.userPrefs?.language = res["langauge"];
    } else {}
    return res;
  }
}

///instance of the service controller
SettingsServiceModelController settingsServiceModelController =
    SettingsServiceModelController();
