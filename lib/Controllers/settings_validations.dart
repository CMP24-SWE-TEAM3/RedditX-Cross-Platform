import 'package:flutter/material.dart';
import 'package:search_project/models/settings_model.dart';
import 'authentication_submitions.dart';
import 'validations.dart';

///validates change password's screen for entered new password
validateChangePassword(
    TextEditingController currentPassword,
    TextEditingController newPassword,
    TextEditingController confirmNewPassword) {
  bool check1 = false;
  bool check2 = false;
  if (newPassword.text.isEmpty) {
    settingsModel.newPasswordErrorMessage = "This field must be filled";
  } else {
    settingsModel.newPasswordErrorMessage = null;
  }
  if (confirmNewPassword.text.isEmpty) {
    settingsModel.confirmNewPasswordErrorMessage = "This field must be filled";
  } else {
    settingsModel.confirmNewPasswordErrorMessage = null;
  }
  if (currentPassword.text.isEmpty) {
    settingsModel.currentPasswordErrorMessage = "This field must be filled";
  } else {
    settingsModel.currentPasswordErrorMessage = null;
  }
  if (newPassword.text.isNotEmpty &&
      confirmNewPassword.text.isNotEmpty &&
      currentPassword.text.isNotEmpty) {
    if (newPassword.text == confirmNewPassword.text) {
      check1 = true;
    } else {
      settingsModel.confirmNewPasswordErrorMessage =
          "Doesn't match with new password";
    }
    if (newPassword.text != currentPassword.text) {
      check2 = true;
    } else {
      settingsModel.newPasswordErrorMessage =
          "it's the same as current password";
    }
    if (check1 && check2) {
      settingsModel.newPasswordErrorMessage = null;
      settingsModel.confirmNewPasswordErrorMessage = null;
      settingsModel.currentPasswordErrorMessage = null;
      return 0;
    }
  }
  return -1;
}

///validates forgot passsword dialigue
forgotPasswordValidation(userNameController, emailController, ctx) async {
  settingsModel.forgotPasswordEmailErrorMessage =
      emailValidation(emailController.text);
  settingsModel.forgotPasswordUsernameErrorMessage =
      await usernameValidation(userNameController.text, ctx);
  if ((settingsModel.forgotPasswordEmailErrorMessage == null) &&
      (settingsModel.forgotPasswordUsernameErrorMessage == null)) {
    resetPass(emailController, userNameController, ctx);
    Navigator.of(ctx).pop();
  }
}

///validates forgot username dialogue
forgotUsernameValidation(emailController, ctx) async {
  settingsModel.forgotUsernameEmailErrorMessage =
      emailValidation(emailController.text);
  if (settingsModel.forgotUsernameEmailErrorMessage == null) {
    resetUsername(emailController, ctx);
    Navigator.of(ctx).pop();
  }
}
