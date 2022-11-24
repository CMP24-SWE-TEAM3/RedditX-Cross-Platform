import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

dialogBuilder(BuildContext context) {
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
//          mainAxisSize: MainAxisSize.min,
          children: [
            const TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    color: Colors.blue,
                  ),
                ),
                labelText: 'Username',
                labelStyle: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            const Divider(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    color: Colors.blue,
                  ),
                ),
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            const Text(
                "Unfortunately, if you never given us your emsil,we will not be able to reset your password."),
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
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text(
              'EMAIL ME',
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
