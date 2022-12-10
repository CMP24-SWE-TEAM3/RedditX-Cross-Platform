import 'package:flutter/material.dart';
import 'package:search_project/controllers/settings_validations.dart';
import '../methods/community/show_snack_bar.dart';
import 'validations.dart';
import '../models/settings_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'settings_service_model_controller.dart';

///settings provider, contains user settings' controller methods
class SettingsViewModelMobileController with ChangeNotifier {
  //Account settings screen
  //make profPic

  ///Connected to google or disconnected
  bool connectedToGoogle = false;

  updateIsPasswordCheck() {
    settingsServiceModelController.getIsPasswordSet();
    //notifyListeners();
  }

  changePassword(
      TextEditingController currentPassword,
      TextEditingController newPassword,
      TextEditingController confirmNewPassword,
      var context) async {
    if (changePasswordInner(currentPassword, newPassword, confirmNewPassword) ==
        0) {
      showSnackBar(context, "Password changed successfully!");
      Navigator.pop(context);
      settingsModel.newPasswordErrorMessage = null;
    } else {
      settingsModel.newPasswordErrorMessage = "Failed,Check Your connection";
    }
  }

  changePasswordInner(
      TextEditingController currentPassword,
      TextEditingController newPassword,
      TextEditingController confirmNewPassword) async {
    if (validateChangePassword(
            currentPassword, newPassword, confirmNewPassword) ==
        0) {
      var passwordValidating = passwordValidation(newPassword.text);
      if (passwordValidating == null) {
        settingsModel.newPasswordErrorMessage = null;
        //change password service call
        var serverResponse =
            await settingsServiceModelController.changePasswordModelController(
                currentPassword.text,
                newPassword.text,
                confirmNewPassword.text);
        return serverResponse;
      } else {
        settingsModel.newPasswordErrorMessage = passwordValidating;
        return 1;
      }
    }
  }

  ///updates email, takes [newEmail] ,validates it then invokes updateEmailService
  updateEmail(String newEmail) async {
    String? validation = emailValidation(newEmail);
    if (validation == null) {
      var serverResponse = await settingsServiceModelController
          .updateEmailModelController(newEmail);
      notifyListeners();
      return serverResponse;
    } else {
      //not valid
      settingsModel.updateEmailErrorMessage = validation;
      notifyListeners();
      return 1;
    }
  }

  updateEmailOuter(String newEmail,
      TextEditingController updatedEmailController, var context) async {
    if (updateEmail(updatedEmailController.text) == 0) {
      Navigator.pop(context);
      showSnackBar(context, "Email Updated Successfully!");
      settingsModel.updateEmailErrorMessage = null;
    } else {
      settingsModel.updateEmailErrorMessage = "Failed,Check Your connection";
    }
  }

  sendRedditPasswordToEmail() {
    settingsServiceModelController.sendRedditPasswordToEmailService();
  }

  ///return switchValue from shared prefs
  Future<bool?> getSwitchValue(String? key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? switchValue = prefs.getBool(key!) ?? false;
    notifyListeners();
    return switchValue;
  }

  ///toggles switch value according a key
  toggleSwitch(String? key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? switchValue = prefs.getBool(key!) ?? false;
    prefs.setBool(key, !switchValue);
    notifyListeners();
  }

  ///Toggles UnsubscribeFromAllEmails switch and disable manage email switches in manage emails screen
  toggleUnsubscribeFromAllEmails() async {
    toggleSwitch("unsubscribeFromAllEmails");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? sw = await getSwitchValue("unsubscribeFromAllEmails");
    prefs.setBool("unsubscribeFromAllEmailsEnabling", !sw!);
    notifyListeners();
  }

  ///Appears in AccountSettingsScreen indicating if connected to google or not
  updateConnectedToGoogle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    settingsModel.connectedToGoogle =
        (prefs.getBool("connectedToGoogle"))! ? "Disconnect" : "Connect";
    notifyListeners();
  }

  ///Toggles ConnectedToGoogle if connected it disconnects and vice versa
  toggleConnectedToGoogle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? switchValue = prefs.getBool("connectedToGoogle") ?? false;
    prefs.setBool("connectedToGoogle", !switchValue);
    //TODO call mock service of diconnection and connection
    updateConnectedToGoogle();

    // notifyListeners();
  }
}
