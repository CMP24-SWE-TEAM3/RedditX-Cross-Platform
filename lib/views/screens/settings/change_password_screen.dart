import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../controllers/mobile_settings_view_controller.dart';
import '../../../../models/settings_model.dart';
import '../../../../config/constants.dart';
import '../../../models/user_model.dart';
import '../../widgets/settings/forgot_password_dialogue.dart';
import '../../widgets/settings/setting_email_password_textfield.dart';

///screen for changing users email password, found in account settings
class ChangePasswordScreen extends StatelessWidget {
  ///Password Text field controller for current Password
  final TextEditingController currentPasswordController =
      TextEditingController();

  ///Password Text field controller for new Password
  final TextEditingController newPasswordController = TextEditingController();

  ///Password Text field controller for confirming new Password
  final TextEditingController confirmNewPasswordController =
      TextEditingController();

  ///Change password screen route name
  static const routeName = '/Settings/Account_Settings/Change_Password';

  ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),
        ),
        title: const Text("Change password",
            style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(Icons.person_pin_outlined),
                  )
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Text(
                      "u/${currentUser!.username}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PasswordText(
                key: const ValueKey('Current_Password_Text'),
                passwordController: currentPasswordController,
                labeling: "Current password",
                errorPasswordText: settingsModel.currentPasswordErrorMessage),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                key: const ValueKey('Forgot_Password_Button'),
                onPressed: () => dialogBuilder(context),
                child: const Text("Forgot password?",
                    style: TextStyle(color: Colors.blue))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PasswordText(
                key: const ValueKey('New_Password_Text'),
                passwordController: newPasswordController,
                labeling: "New password",
                errorPasswordText: settingsModel.newPasswordErrorMessage),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PasswordText(
                key: const ValueKey('NewConfirm_Password_Text'),
                passwordController: confirmNewPasswordController,
                labeling: "Confirm new password",
                errorPasswordText:
                    settingsModel.confirmNewPasswordErrorMessage),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.1,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: OutlinedButton(
                        key: const ValueKey('Cancel_Button'),
                        onPressed: () => Navigator.pop(context),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: Colors.blue)),
                          ),
                          //maximumSize: MaterialStateProperty.all(double.infinity),
                        ),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.1,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: OutlinedButton(
                        key: const ValueKey('Save_Button'),
                        onPressed: () =>
                            Provider.of<SettingsViewModelMobileController>(
                                    context,
                                    listen: false)
                                .changePassword(
                                    currentPasswordController,
                                    newPasswordController,
                                    confirmNewPasswordController,
                                    context),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side:
                                        const BorderSide(color: Colors.blue)))),
                        child: const Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
