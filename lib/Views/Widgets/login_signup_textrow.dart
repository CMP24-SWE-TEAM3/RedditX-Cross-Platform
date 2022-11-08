import 'package:flutter/material.dart';

import '../Screens/email_login.dart';
import '../Screens/email_signup.dart';

Padding loginSignupTextRow(double finalWidth, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 8.0,
      left: 4,
    ),
    child: SizedBox(
      width: finalWidth,
      child: Row(
        children: [
          TextButton(
            onPressed: () => Navigator.of(context)
                .pushReplacementNamed(EmailLogin.routeName, arguments: {}),
            child: const Text(
              'LOG IN',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            style: TextStyle(
              fontSize: 26,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
            '٠',
          ),
          TextButton(
            onPressed: () => Navigator.of(context)
                .pushReplacementNamed(EmailSignup.routeName, arguments: {}),
            child: const Text(
              'SIGN UP',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
