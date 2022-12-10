import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'forget_password_m.dart';
import 'forget_password_w.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});
  static const routeName = '/ForgetPassword';

  @override
  Widget build(BuildContext context) {
    return (kIsWeb) ? const ForgetPasswordW() : const ForgetPasswordM();
  }
}
