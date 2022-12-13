import '../models/user_model.dart';

///settings model with most important settings shared variables
class SettingsModel {
  ///to indicate if true that the user has a reddit password
  bool? hasPassword = currentUser?.isPasswordSet;

  ///user's reddit UserName
  String? userName = currentUser?.username;

  ///User's account Email
  String? accountMail = currentUser?.email;

  ///error message for updaeEmail textField
  String? updateEmailErrorMessage;

  ///error message for current Password textField
  String? currentPasswordErrorMessage;

  ///error message for new password textField
  String? newPasswordErrorMessage;

  ///error message for confirm new password textField
  String? confirmNewPasswordErrorMessage;

  ///error message for username textField in forgot password
  String? forgotPasswordUsernameErrorMessage;

  ///error message for email textField in forgot password
  String? forgotPasswordEmailErrorMessage;

  ///error message for username textField in forgot username
  String? forgotUsernameEmailErrorMessage;

  ///Connected to google status ["Connect"] or ["Disconnect"]
  String? connectedToGoogle = "Disconnect";
}

///instance of settings model
SettingsModel settingsModel = SettingsModel();
