import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UserSignupWebAgreement extends StatelessWidget {
  const UserSignupWebAgreement({
    Key? key,
    required this.userAgrementUrl,
    required this.privacyUrl,
  }) : super(key: key);

  final Uri userAgrementUrl;
  final Uri privacyUrl;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: <TextSpan>[
          const TextSpan(
            text:
                'By continuing, you are setting up a Reddit account and agree to our ',
          ),
          TextSpan(
            text: 'User Agreement ',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Theme.of(context).colorScheme.primary,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launchUrl(userAgrementUrl);
              },
          ),
          const TextSpan(
            text: 'and ',
          ),
          TextSpan(
            text: 'Privacy Policy.',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Theme.of(context).colorScheme.primary,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launchUrl(privacyUrl);
              },
          ),
        ],
      ),
    );
  }
}
