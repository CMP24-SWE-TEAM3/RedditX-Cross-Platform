
import 'package:flutter/material.dart';



import '../../controllers/validations.dart';
import '../widgets/continue_signup_button.dart';
import '../widgets/sign_up_bar.dart';

import '../widgets/uesrname_password_textfield.dart';
import '../widgets/user_login_agreement.dart';

import 'email_login.dart';
import 'email_signup.dart';

class EmailSignupM extends StatefulWidget {
  const EmailSignupM({super.key});

  @override
  State<EmailSignupM> createState() => _EmailSignupMState();
}

class _EmailSignupMState extends State<EmailSignupM> {
  bool _submit = false;
  TextEditingController emailController = TextEditingController();
  String? errorEmailText;
  TextEditingController userNameController = TextEditingController();
  String? errorUserNameText;
  TextEditingController passwordController = TextEditingController();
  String? errorPasswordText;

  void emailLogin(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(EmailLogin.routeName, arguments: {});
  }

  void validate(emailController, userNameController, passwordController, ctx) {
    setState(() => _submit = true);

    errorEmailText = emailValidation(emailController.text);
    errorUserNameText = usernameValidation(userNameController.text);
    errorPasswordText = passwordValidation(passwordController.text);

    if ((errorEmailText == null) &&
        (errorUserNameText == null) &&
        (errorPasswordText == null)) {
      submitSignup(emailController, userNameController, passwordController, ctx);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                          'Hi new friend, welcome to Reddit',
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
                        heightScreen * 0.02,
                      ),
                      child: EmailText(
                          key: const ValueKey('email_sign_up_Page'),
                          emailController: emailController,
                          errorEmailText: errorEmailText),
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                        heightScreen * 0.02,
                      ),
                      child: UserNameText(
                        key: const ValueKey('username_sign_up_Page'),
                        userNameController: userNameController,
                        errorUserNameText: errorUserNameText,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: heightScreen * 0.02,
                          horizontal: heightScreen * 0.01),
                      child: PasswordText(
                        key: const ValueKey('password_sign_up_Page'),
                        passwordController: passwordController,
                        errorPasswordText: errorPasswordText,
                      ),
                    ),
                    SizedBox(
                      height: _submit ? heightScreen * 0.1 : heightScreen * 0.2,
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
                  child: ContinueSignUpButton(
                    key: const ValueKey('continue_sign_up_Page'),
                    userNameController: userNameController,
                    passwordController: passwordController,
                    emailController: emailController,
                    function: validate,
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
