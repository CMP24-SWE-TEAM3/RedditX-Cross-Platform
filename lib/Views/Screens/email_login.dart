import 'package:flutter/material.dart';

import '../Widgets/continue_login_button.dart';
import '../Widgets/sign_up_bar.dart';
import '../Widgets/uesrname_password_textfield.dart';
import '../Widgets/user_login_agreement.dart';
import 'email_signup.dart';
import 'forget_password.dart';
import 'temphome.dart';

class EmailLogin extends StatefulWidget {
  const EmailLogin({super.key});
  static const routeName = '/EmailLogin';

  @override
  State<EmailLogin> createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void submit(userNameController, passwordController, ctx) {
    print('sending data to back end');
    Navigator.of(ctx).pop();
    Navigator.of(ctx).pushReplacementNamed(Home.routeName, arguments: {});
  }

  void forgetPass(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(ForgetPassword.routeName, arguments: {});
  }

  void emailsignup(BuildContext ctx) {
    Navigator.of(ctx)
        .pushReplacementNamed(EmailSignup.routeName, arguments: {});
  }

  @override
  Widget build(BuildContext context) {
    final userAgrementUrl =
        Uri.parse('https://www.redditinc.com/policies/user-agreement');
    final privacyUrl =
        Uri.parse('https://www.reddit.com/policies/privacy-policy');

    final mediaQuery = MediaQuery.of(context);
    final dynamic appBar =
        buildAppBar(text: 'Sign Up', function: () => emailsignup(context));
    final heightScreen = (mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top);
    final padding = EdgeInsets.symmetric(
      vertical: heightScreen * 0.01,
      horizontal: mediaQuery.size.width * 0.1,
    );
    return GestureDetector(
      onVerticalDragUpdate: (details) {},
      onHorizontalDragUpdate: (details) {
        if (details.delta.direction > 0) {
          emailsignup(context);
        }
      },
      child: Scaffold(
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
                          'Log in to Reddit',
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
                      height: heightScreen * 0.1,
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                        heightScreen * 0.025,
                      ),
                      child:
                          UserNameText(userNameController: userNameController),
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                        heightScreen * 0.025,
                      ),
                      child:
                          PasswordText(passwordController: passwordController),
                    ),
                    SizedBox(
                      height: heightScreen * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                        heightScreen * 0.02,
                      ),
                      child: TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStatePropertyAll(
                              Theme.of(context).colorScheme.primary),
                        ),
                        onPressed: () => forgetPass(context),
                        child: const Text(
                          'Forget Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightScreen * 0.26,
                    ),
                    UserLoginAggreement(
                        userAgrementUrl: userAgrementUrl,
                        privacyUrl: privacyUrl),
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
                  child: ContinueLoginButton(
                    userNameController: userNameController,
                    passwordController: passwordController,
                    function: submit,
                    ctx: context,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
