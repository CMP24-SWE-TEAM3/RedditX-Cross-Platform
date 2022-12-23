import 'dart:developer';

import 'package:flutter/material.dart';
import '../controllers/settings_validations.dart';
import '../models/user_model.dart';

import '../methods/community/show_snack_bar.dart';

import 'validations.dart';
import '../models/settings_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'settings_service_model_controller.dart';

///settings provider, contains user settings' controller methods
class SettingsViewModelMobileController with ChangeNotifier {
  ///Connected to google or disconnected
  bool connectedToGoogle = false;

  ///requests email to setup reddit password upon user's preference
  updateIsPasswordCheck() {
    settingsServiceModelController.getIsPasswordSet();
  }

  ///get user's email into user's model
  getEmailIntoModel() {
    settingsServiceModelController.getEmailServiceController();
  }

  ///controller for validations of change password textfields
  ///and calling change password request
  changePassword(
      TextEditingController currentPassword,
      TextEditingController newPassword,
      TextEditingController confirmNewPassword,
      var context) async {
    if (await changePasswordInner(
            currentPassword, newPassword, confirmNewPassword) ==
        0) {
      Navigator.pop(context);
      showSnackBar(context, "Password changed successfully!");
      settingsModel.newPasswordErrorMessage = null;
    } else {
      settingsModel.newPasswordErrorMessage = "Failed,Check Your connection";
    }
  }

  ///utility function for change password controller that invokes servicecontroller
  changePasswordInner(
      TextEditingController currentPassword,
      TextEditingController newPassword,
      TextEditingController confirmNewPassword) async {
    var val = validateChangePassword(
        currentPassword, newPassword, confirmNewPassword);
    log(val.toString());
    if (val == 0) {
      var passwordValidating = passwordValidation(newPassword.text);
      log(passwordValidating.toString());
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

  ///utility function for update email for invoking service contoller
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

  ///updates email, takes [newEmail] ,validates it then invokes updateEmailService
  updateEmailOuter(String newEmail,
      TextEditingController updatedEmailController, var context) async {
    if (await updateEmail(updatedEmailController.text) == 0) {
      Navigator.pop(context);
      showSnackBar(context, "Email Updated Successfully!");
      settingsModel.updateEmailErrorMessage = null;
      notifyListeners();
    } else {
      settingsModel.updateEmailErrorMessage = "Failed,Check Your connection";
    }
  }

  ///controller that communicates with send password mail service
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

  ///switching logic and shared preferences effect
  toggleSwitchLogic(String? key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? switchValue = prefs.getBool(key!) ?? false;
    prefs.setBool(key, !switchValue);
    return switchValue;
  }

  ///toggles switch value according a key
  toggleSwitch(String? key, context) async {
    bool? switchValue = await toggleSwitchLogic(key!);
    int res = await settingsServiceModelController.changePrefsServiceController(
        key, !switchValue!);
    if (res == 0) {
      showSnackBar(context, "Updated Successfully!");
    } else {
      showSnackBar(context, "failed! check connection");
    }
    notifyListeners();
  }

  ///Toggles UnsubscribeFromAllEmails switch and disable manage email switches in manage emails screen
  toggleUnsubscribeFromAllEmails(ctx) async {
    toggleSwitch("unsubscribeFromAllEmails", ctx);
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
    updateConnectedToGoogle();
  }

  ///invokes prefs model filling function and updates local shared prefs
  updateSharedPrefsFromService(String? username, ctx) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("UserName", username!);
    prefs.setString("current_email", currentUser!.email!);
    final res =
        await settingsServiceModelController.getUserPrefsModelController();
    if (res != null) {
      res.forEach((key, value) {
        value is bool ? prefs.setBool(key, value) : "";
      });
      showSnackBar(ctx, "prefs loaded successfully!");
    } else {
      showSnackBar(ctx, "get prefs failed");
    }
    notifyListeners();
  }
}
