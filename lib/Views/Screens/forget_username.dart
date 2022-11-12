import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:provider/provider.dart';

import '../../controllers/internet_controller.dart';
import '../../controllers/sign_in_controller.dart';

import '../widgets/show_snackbar.dart';
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
  final sp = Provider.of<SignInController>(context, listen: false);
  final ip = Provider.of<InternetController>(context, listen: false);
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
