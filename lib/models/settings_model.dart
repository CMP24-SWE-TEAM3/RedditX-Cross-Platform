import '../models/user_model.dart';

class SettingsModel {
  bool? hasPassword = currentUser.isPasswordSet;
  //main settings menu variables
  ///user's reddit UserName
  String? userName = currentUser.username;

  ///Account Email
  String? accountMail = currentUser.email;

  ///
  String? updateEmailErrorMessage;
  String? currentPasswordErrorMessage;
  String? newPasswordErrorMessage;
  String? confirmNewPasswordErrorMessage;
  String? forgotPasswordUsernameErrorMessage;
  String? forgotPasswordEmailErrorMessage;
  String? forgotUsernameEmailErrorMessage;
  String? connectedToGoogle = "Disconnect";
}

SettingsModel settingsModel = SettingsModel();
