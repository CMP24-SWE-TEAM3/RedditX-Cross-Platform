import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class UserLoginAggreement extends StatelessWidget {
  const UserLoginAggreement({
    Key? key,
    required this.userAgrementUrl,
    required this.privacyUrl,
  }) : super(key: key);

  final Uri userAgrementUrl;
  final Uri privacyUrl;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(
          color: (kIsWeb) ? Colors.black : Colors.grey,
          fontSize: (kIsWeb) ? 12 : 15,
        ),
        children: <TextSpan>[
          const TextSpan(
            text: 'By continuing, you agree to our ',
          ),
          TextSpan(
            text: 'User Agreement ',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Theme.of(context).colorScheme.primary,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launchUrl(userAgrementUrl,
                    mode: LaunchMode.externalApplication);
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
                launchUrl(privacyUrl, mode: LaunchMode.externalApplication);
              },
          ),
        ],
      ),
    );
  }
}
