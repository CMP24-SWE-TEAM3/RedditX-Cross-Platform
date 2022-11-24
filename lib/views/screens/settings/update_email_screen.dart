import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/mobile_settings_controller.dart';
import '../../../models/settings_model.dart';
import '../../widgets/settings/setting_email_password_textfield.dart';
import '../../../config/const.dart';
import '../../widgets/settings/forgot_password_dialogue.dart';

///screen for updating users email address, found in account settings
class UpdateEmailAddress extends StatelessWidget {
  ///Email Text field controller for email to be updated
  final TextEditingController updatedEmailController = TextEditingController();

  ///Password Text field controller for email to be updated
  final TextEditingController passwordController = TextEditingController();

  ///Update Email Address screen route name
  static const routeName = '/Settings/Account_Settings/Update_Email';

  UpdateEmailAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),
        ),
        title: const Text("Update email address"),
      ),
      body: ListView(
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
                    Text(
                      settingsModel.accountMail!,
                      style: const TextStyle(fontSize: 16),
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
            child: EmailText(
                emailController: updatedEmailController,
                errorEmailText: settingsModel.updateEmailErrorMessage),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PasswordText(
                passwordController: passwordController, labeling: "Password"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () => dialogBuilder(context),
                child: const Text("Forgot password?",
                    style: TextStyle(color: Colors.blue))),
          ),
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2.1,
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(white),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(color: Colors.blue)),
                              ),
                            ),
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2.1,
                          child: OutlinedButton(
                            onPressed: () {
                              Provider.of<SettingsViewModelMobileController>(
                                      context,
                                      listen: false)
                                  .updateEmail(updatedEmailController.text);
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                            color: Colors.blue)))),
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
        ],
      ),
    );
  }
}
