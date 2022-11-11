import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../Controllers/internet_controller.dart';
import '../../Controllers/sign_in_controller.dart';
import '../Widgets/snackBar.dart';
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

Future<void> resetUsername(emailController, context) async {
  final sp = context.read<SignInController>();
  final ip = context.read<InternetController>();
  await ip.checkInternetConnection();

  if (ip.hasInternet == false) {
    // ignore: use_build_context_synchronously
    showSnackBar("Check your Internet connection", context);
  } else {
    await sp
        .forgetUsername(emailController.text)
        .then((value) {
      if (sp.hasError == true) {
        showSnackBar(sp.errorCode.toString(), context);
      }
    });
  }
  (kIsWeb) ? null : showSnackBar('You will recieve an email soon', context);
}
