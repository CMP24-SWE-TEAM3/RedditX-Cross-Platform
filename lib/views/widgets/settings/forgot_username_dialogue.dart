import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../controllers/settings_validations.dart';
import '../../../models/settings_model.dart';
import '../authentication/email_me_button.dart';

///dialogue for forgot username
dialogBuilderForgotUsername(BuildContext context) {
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
        title: const Text('Recover username'),
        content: Column(
          children: [
            TextField(
              controller: emailForgot,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    color: Colors.blue,
                  ),
                ),
                labelText: 'Email address for your account',
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
          MailMeButton2(
            emailController: emailForgot,
            function: forgotUsernameValidation,
            ctx: context,
          ),
        ],
      );
    },
  );
}
