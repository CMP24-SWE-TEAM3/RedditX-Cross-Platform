import 'package:flutter/material.dart';
import '../../../models/settings_model.dart';
import '../../widgets/settings/setting_email_password_textfield.dart';
import '../../../config/const.dart';
import '../../widgets/settings/forgot_password_dialogue.dart';

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
        title: const Text("Change password"),
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
                      "u/${settingsModel.userName}",
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
                passwordController: currentPasswordController,
                labeling: "Current password"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () => dialogBuilder(context),
                child: const Text("Forgot password?",
                    style: TextStyle(color: Colors.blue))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PasswordText(
                passwordController: newPasswordController,
                labeling: "New password"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PasswordText(
                passwordController: confirmNewPasswordController,
                labeling: "Confirm new password"),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.1,
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: OutlinedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
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
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.1,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: OutlinedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side:
                                        const BorderSide(color: Colors.blue)))),
                        child: const Text("Save"),
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
