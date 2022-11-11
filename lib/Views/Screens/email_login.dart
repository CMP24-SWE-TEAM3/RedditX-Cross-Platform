import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:reddit/Views/Screens/temphome.dart';

import '../../Controllers/internet_controller.dart';
import '../../Controllers/sign_in_controller.dart';
import '../Widgets/snackBar.dart';
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

Future<void> submitlogin(userNameController, passwordController, context) async {
  final sp = context.read<SignInController>();
  final ip = context.read<InternetController>();
  await ip.checkInternetConnection();

  if (ip.hasInternet == false) {
    // ignore: use_build_context_synchronously
    showSnackBar("Check your Internet connection", context);
  } else {
    await sp
        .logIn(userNameController.text, passwordController.text)
        .then((value) {
      if (sp.hasError == true) {
        showSnackBar(sp.errorCode.toString(), context);
      }
    });
  }
  if (sp.hasError == false) {
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacementNamed(Home.routeName, arguments: {});
  } else {
    // ignore: use_build_context_synchronously
    (kIsWeb) ? null : showSnackBar('incorrect username or password', context);
  }
}
