import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../Widgets/continue_signup_button.dart';
import '../Widgets/sign_up_bar.dart';
import '../Widgets/uesrname_password_textfield.dart';
import '../Widgets/user_login_agreement.dart';
import 'email_login.dart';

class EmailSignup extends StatefulWidget {
  const EmailSignup({super.key});
  static const routeName = '/EmailSignup';

  @override
  State<EmailSignup> createState() => _EmailSignupState();
}

class _EmailSignupState extends State<EmailSignup> {
  void emailLogin(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(EmailLogin.routeName, arguments: {});
  }

  void submit(emailController, userNameController, passwordController) {
    print('object');
  }

  void validate(emailController, userNameController, passwordController) {
    bool isValidEmail = EmailValidator.validate(emailController.text);
    bool isValidPassword = (passwordController.text.length >= 8);
    bool isValidUserName = ((userNameController.text.length >= 3) &&
        (userNameController.text.length <= 20) &&
        (RegExp(r'^[A-Za-z0-9_-]+$').hasMatch(userNameController.text)));

    if (isValidEmail && isValidPassword && isValidUserName) {
      submit(emailController, userNameController, passwordController);
    } else {
      print(emailController.text +
          userNameController.text +
          passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController userNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final userAgrementUrl =
        Uri.parse('https://www.redditinc.com/policies/user-agreement');
    final privacyUrl =
        Uri.parse('https://www.reddit.com/policies/privacy-policy');

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
    return GestureDetector(
      onVerticalDragUpdate: (details) {},
      onHorizontalDragUpdate: (details) {
        if (details.delta.direction <= 0) {
          emailLogin(context);
        }
      },
      child: Scaffold(
        appBar: appBar,
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: padding,
                  child: const Text(
                    'Hi new friend, welcome to Reddit',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
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
                  child: EmailText(emailController: emailController),
                ),
                Padding(
                  padding: EdgeInsets.all(
                    heightScreen * 0.025,
                  ),
                  child: UserNameText(userNameController: userNameController),
                ),
                Padding(
                  padding: EdgeInsets.all(
                    heightScreen * 0.025,
                  ),
                  child: PasswordText(passwordController: passwordController),
                ),
                SizedBox(
                  height: heightScreen * 0.2,
                ),
                UserLoginAggreement(
                    userAgrementUrl: userAgrementUrl, privacyUrl: privacyUrl),
                SizedBox(
                  height: heightScreen * 0.03,
                ),
                ContinueSignUpButton(
                  userNameController: userNameController,
                  passwordController: passwordController,
                  emailController: emailController,
                  function: validate,
                ),
                SizedBox(
                  height: heightScreen * 0.01,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
