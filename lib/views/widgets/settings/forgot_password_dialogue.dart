import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../models/settings_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controllers/settings_validations.dart';

import '../authentication/email_me_button.dart';
import 'forgot_username_dialogue.dart';

///dialogue for forgot password
dialogBuilder(BuildContext context) {
  ///text editing Controller for user Name in Forgot password screen
  final TextEditingController userNameForgot = TextEditingController();
  ///text editing Controller for user email in Forgot password screen
  final TextEditingController emailForgot = TextEditingController();

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding:
            const EdgeInsets.symmetric(vertical: 40.0, horizontal: 10),
        clipBehavior: Clip.antiAlias,
        scrollable: true,
        contentPadding: const EdgeInsets.all(30),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        title: const Text('Forgot your password?'),
        content: Column(
          children: [
            TextField(
              controller: userNameForgot,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    color: Colors.blue,
                  ),
                ),
                labelText: 'Username',
                errorText: settingsModel.forgotPasswordUsernameErrorMessage,
                labelStyle: const TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            const Divider(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    dialogBuilderForgotUsername(context);
                  },
                  child: const Text("Forgot username?",
                      style: TextStyle(color: Colors.blue))),
            ),
            const Divider(
              height: 10,
            ),
            TextField(
              controller: emailForgot,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    color: Colors.blue,
                  ),
                ),
                labelText: 'Email',
                errorText: settingsModel.forgotPasswordEmailErrorMessage,
                labelStyle: const TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            const Text(
                "Unfortunately, if you never given us your email,we will not be able to reset your password."),
            Text.rich(TextSpan(
                text: "Having trouble?",
                style: const TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    //on tap code here, you can navigate to other page or URL
                    String url =
                        "https://reddit.zendesk.com/hc/en-us/articles/205240005-How-do-I-log-in-to-Reddit-if-I-forgot-my-password-";
                    await launchUrl(Uri.parse(
                        url)); //launch is from url_launcher package to launch URL
                  }))
          ],
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text(
              'CANCEL',
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          MailMeButton1(
            userNameController: userNameForgot,
            emailController: emailForgot,
            function: forgotPasswordValidation,
            ctx: context,
          ),
        ],
      );
    },
  );
}
