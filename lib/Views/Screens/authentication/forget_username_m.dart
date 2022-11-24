
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


import '../../../controllers/authentication_submitions.dart';
import '../../../controllers/validations.dart';
import '../../widgets/authentication/sign_up_bar.dart';
import '../../widgets/authentication/email_me_button.dart';
import '../../widgets/authentication/uesrname_password_textfield.dart';
import 'email_login.dart';

class ForgetUserNameM extends StatefulWidget {
  const ForgetUserNameM({super.key});

  @override
  State<ForgetUserNameM> createState() => _ForgetUserNameMState();
}

class _ForgetUserNameMState extends State<ForgetUserNameM> {
  TextEditingController emailController = TextEditingController();
  String? errorEmailText;



  void validate(emailController, ctx) {
    setState(() => errorEmailText = emailValidation(emailController.text));

    if (errorEmailText == null) {
      resetUsername(emailController, ctx);
    }
  }

  void havingTrouble(havingTroubleurl) {
    launchUrl(havingTroubleurl, mode: LaunchMode.externalApplication);
  }

  void emailLogin(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(EmailLogin.routeName, arguments: {});
  }

  @override
  Widget build(BuildContext context) {
    final havingTroubleurl =
        Uri.parse('https://www.reddithelp.com/hc/en-us/articles/205240005');
    final mediaQuery = MediaQuery.of(context);
    final dynamic appBar =
        buildAppBar(text: 'Log in', function: () => emailLogin(context));
    final heightScreen = (mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top);
    final padding = EdgeInsets.symmetric(
      vertical: heightScreen * 0.01,
      horizontal: mediaQuery.size.width * 0.1,
    );
    return Scaffold(
      appBar: appBar,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: padding,
                      child: const Text(
                        'Recover username',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: heightScreen * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                      heightScreen * 0.02,
                    ),
                    child: EmailText(
                      key: const ValueKey('email_forget_username_Page'),
                        emailController: emailController,
                        errorEmailText: errorEmailText),
                  ),
                  SizedBox(
                    height: heightScreen * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                      heightScreen * 0.02,
                    ),
                    child: const Text(
                      'Unfortunately,if you have never given us you email, we will not be able to reset your password.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                      heightScreen * 0.02,
                    ),
                    child: textbutton('Having trouble?',
                        () => havingTrouble(havingTroubleurl)),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: heightScreen * 0.02),
                child: MailMeButton2(
                  key: const ValueKey('emailme_forget_username_Page'),
                  emailController: emailController,
                  function: validate,
                  ctx: context,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextButton textbutton(txt, fuction) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor:
            MaterialStatePropertyAll(Theme.of(context).colorScheme.primary),
      ),
      onPressed: fuction,
      child: Text(
        txt,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }
}
