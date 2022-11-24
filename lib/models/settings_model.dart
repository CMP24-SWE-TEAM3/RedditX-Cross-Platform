import 'package:reddit/models/user_model.dart';

class SettingsModel {
  bool? hasPassword = currentUser.isPasswordSet;
  //main settings menu variables
  ///user's reddit UserName
  String? userName = currentUser.username;

  ///Account Email
  String? accountMail = currentUser.email;

  String? updateEmailErrorMessage = "";
/*
 * update email
 * change password
      *validate till integrated
      *
 */

}

SettingsModel settingsModel = SettingsModel();
