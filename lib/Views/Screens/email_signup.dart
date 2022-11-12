import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:provider/provider.dart';
import 'package:reddit/views/Screens/temphome.dart';

import '../../controllers/internet_controller.dart';
import '../../controllers/sign_in_controller.dart';
import '../Widgets/show_snackbar.dart';
import 'about_you.dart';
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

Future<void> submitSignup(
    emailController, userNameController, passwordController, context) async {
  final sp = Provider.of<SignInController>(context, listen: false);
  final ip = Provider.of<InternetController>(context, listen: false);
  await ip.checkInternetConnection();

  if (ip.hasInternet == false) {
    // ignore: use_build_context_synchronously
    showSnackBar("Check your Internet connection", context);
  } else {
    await sp
        .signUp(emailController.text, userNameController.text,
            passwordController.text)
        .then((value) {
      if (sp.hasError == true) {
        showSnackBar(sp.errorCode.toString(), context);
      }
    });
  }
  (kIsWeb)
      ? Navigator.of(context)
          .pushReplacementNamed(Home.routeName, arguments: {})
      : Navigator.of(context)
          .pushReplacementNamed(AboutYou.routeName, arguments: {});
}
