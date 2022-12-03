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
    // ignore: unused_local_variable
    final res = await settingsService.updateEmailService(newEmail);
    currentUser.email = await settingsService.getEmailService();
    //if (res.statusCode == 200) {
    // } else {
    //   currentUser.email = "ErrorMail@err.com";
    // }
  }
}

SettingsServiceModelController settingsServiceModelController =
    SettingsServiceModelController();
