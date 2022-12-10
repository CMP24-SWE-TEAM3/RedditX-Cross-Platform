import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


import 'email_signup_m.dart';
import 'email_signup_w.dart';

class EmailSignup extends StatelessWidget {
  const EmailSignup({super.key});
  static const routeName = '/EmailSignup';

  @override
  Widget build(BuildContext context) {
    return (kIsWeb) ? const EmailSignupW() : const EmailSignupM();
  }
}


