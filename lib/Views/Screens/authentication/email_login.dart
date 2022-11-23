import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'email_login_m.dart';
import 'email_login_w.dart';

class EmailLogin extends StatelessWidget {
  const EmailLogin({super.key});
  static const routeName = '/EmailLogin';

  @override
  Widget build(BuildContext context) {
    return (kIsWeb) ? const EmailLoginW() : const EmailLoginM();
  }
}

