import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:provider/provider.dart';

import '../../Controllers/internet_controller.dart';
import '../../Controllers/sign_in_controller.dart';

import '../Widgets/show_snackbar.dart';
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

Future<void> resetPass(userNameController, emailController, context) async {
  final sp = Provider.of<SignInController>(context, listen: false);
  final ip = Provider.of<InternetController>(context, listen: false);
  await ip.checkInternetConnection();

  if (ip.hasInternet == false) {
    // ignore: use_build_context_synchronously
    showSnackBar("Check your Internet connection", context);
  } else {
    await sp
        .forgetPass(userNameController.text, emailController.text)
        .then((value) {
      if (sp.hasError == true) {
        showSnackBar(sp.errorCode.toString(), context);
      }
    });
  }
  (kIsWeb) ? null : showSnackBar('You will recieve an email soon', context);
}
