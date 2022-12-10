import 'package:search_project/models/settings_model.dart';

import '../services/settings_service.dart';
import '../models/user_model.dart';

class SettingsServiceModelController {
  getIsPasswordSet() async {
    currentUser.isPasswordSet = await settingsService.getIsPasswordSetService();
  }

  sendRedditPasswordToEmailService() async {
    await settingsService.sendRedditPasswordToEmailService(
        email: currentUser.email, userName: currentUser.username);
  }

  updateEmailModelController(String? newEmail) async {
    final res = await settingsService.updateEmailService(newEmail);
    // currentUser.email = await settingsService.getEmailService();
    if (res.statusCode == 200) {
      // update email
      currentUser.email = newEmail;
      return 0;
    } else {
      settingsModel.updateEmailErrorMessage =
          "Server failed , please try again later.";
      return -1;
    }
  }

  changePasswordModelController(String? currentPassword, String? newPassword,
      String? confirmNewPassword) async {
    final res = await settingsService.changePasswordService(
        currentPassword, newPassword, confirmNewPassword);
    if (res.statusCode == 200) {
      // change Ppassword
      currentUser.passwordChangedAt = DateTime.now();
      return 0;
    } else {
      settingsModel.newPasswordErrorMessage =
          "Server failed , please try again later.";
      return -1;
    }
  }
}

SettingsServiceModelController settingsServiceModelController =
    SettingsServiceModelController();
