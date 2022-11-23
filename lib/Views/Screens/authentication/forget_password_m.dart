
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


import '../../../controllers/authentication_submitions.dart';
import '../../../controllers/validations.dart';
import '../../widgets/authentication/sign_up_bar.dart';
import '../../widgets/authentication/email_me_button.dart';
import '../../widgets/authentication/uesrname_password_textfield.dart';
import 'email_login.dart';
import 'forget_username.dart';

class ForgetPasswordM extends StatefulWidget {
  const ForgetPasswordM({super.key});

  @override
  State<ForgetPasswordM> createState() => _ForgetPasswordMState();
}

class _ForgetPasswordMState extends State<ForgetPasswordM> {
  TextEditingController emailController = TextEditingController();
  String? errorEmailText;
  TextEditingController userNameController = TextEditingController();
  String? errorUserNameText;



  void validate(userNameController, emailController, ctx) {
    setState(() async {
      errorEmailText = emailValidation(emailController.text);
      errorUserNameText = await usernameValidation(userNameController.text, ctx);
    });

    if ((errorEmailText == null) && (errorUserNameText == null)) {
      resetPass(emailController, userNameController, ctx);
    }
  }

  void forgetusername(BuildContext ctx) {
    Navigator.of(ctx)
        .pushReplacementNamed(ForgetUserName.routeName, arguments: {});
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
                        'Forget your password?',
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
                    child: UserNameText(
                      key: const ValueKey('username_forget_password_Page'),
                        userNameController: userNameController,
                        errorUserNameText: errorUserNameText),
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                      heightScreen * 0.02,
                    ),
                    child: EmailText(
                       key: const ValueKey('email_forget_password_Page'),
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
                    child: textbutton(
                        'Forget username?', () => forgetusername(context)),
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
                child: MailMeButton1(
                  key: const ValueKey('emailme_forget_password_Page'),
                  userNameController: userNameController,
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
       key: const ValueKey('forget_username_forget_password_Page'),
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
