import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'forget_username_m.dart';
import 'forget_username_w.dart';

class ForgetUserName extends StatelessWidget {
  const ForgetUserName({super.key});
  static const routeName = '/ForgetUserName';

  @override
  Widget build(BuildContext context) {
    return (kIsWeb) ? const ForgetUserNameW() : const ForgetUserNameM();
  }
}
