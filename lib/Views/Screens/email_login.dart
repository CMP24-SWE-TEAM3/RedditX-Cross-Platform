import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:provider/provider.dart';
import 'package:reddit/views/Screens/temphome.dart';

import '../../controllers/internet_controller.dart';
import '../../controllers/sign_in_controller.dart';

import '../Widgets/show_snackbar.dart';
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

Future<void> submitlogin(
    userNameController, passwordController, context) async {
  // final sp = context.read<SignInController>();
  // final ip = context.read<InternetController>();
  final sp = Provider.of<SignInController>(context, listen: false);
  final ip = Provider.of<InternetController>(context, listen: false);
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
    (kIsWeb) ? null : Navigator.of(context).pop();
    Navigator.of(context).pushReplacementNamed(Home.routeName, arguments: {});
  } else {
    // ignore: use_build_context_synchronously
    (kIsWeb) ? null : showSnackBar('incorrect username or password', context);
  }
}
