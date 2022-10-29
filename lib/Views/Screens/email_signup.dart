import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../Widgets/continue_signup_button.dart';
import '../Widgets/sign_up_bar.dart';
import '../Widgets/uesrname_password_textfield.dart';
import '../Widgets/user_login_agreement.dart';
import 'about_you.dart';
import 'email_login.dart';

class EmailSignup extends StatefulWidget {
  const EmailSignup({super.key});
  static const routeName = '/EmailSignup';

  @override
  State<EmailSignup> createState() => _EmailSignupState();
}

class _EmailSignupState extends State<EmailSignup> {
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

  void submit(emailController, userNameController, passwordController, ctx) {
    print('sending data to back end');
    Navigator.of(ctx).pushReplacementNamed(AboutYou.routeName, arguments: {});
  }

  void validate(emailController, userNameController, passwordController, ctx) {
    setState(() => _submit = true);

    bool isValidEmail = EmailValidator.validate(emailController.text);
    bool isValidPassword = (passwordController.text.length >= 8);
    bool isValidUserName1 = ((userNameController.text.length >= 3) &&
        (userNameController.text.length <= 20));
    bool isValidUserName2 =
        (RegExp(r'^[A-Za-z0-9_-]+$').hasMatch(userNameController.text));
    bool isValidUserName3 = true;

    errorEmailText = (!_submit)
        ? null
        : (EmailValidator.validate(emailController.text))
            ? null
            : 'Not a valid email address';

    errorUserNameText = (!_submit)
        ? null
        : ((userNameController.text.length < 3) ||
                (userNameController.text.length > 20))
            ? 'Username must be between 3 and 20 characters'
            : (!(RegExp(r'^[A-Za-z0-9_-]+$').hasMatch(userNameController.text)))
                ? 'Letters, numbers, dashes, and underscores only. please try again without symbols.'
                : !(isValidUserName3)
                    ? 'That username is already taken'
                    : null;

    errorPasswordText = (!_submit)
        ? null
        : (passwordController.text.length >= 8)
            ? null
            : 'the password must be at least 8 characters';

    if (isValidEmail &&
        isValidPassword &&
        isValidUserName1 &&
        isValidUserName2 &&
        isValidUserName3) {
      submit(emailController, userNameController, passwordController, ctx);
    } else {
      print(emailController.text +
          "---" +
          userNameController.text +
          "---" +
          passwordController.text);
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
                          emailController: emailController,
                          errorEmailText: errorEmailText),
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                        heightScreen * 0.02,
                      ),
                      child: UserNameText(
                        userNameController: userNameController,
                        errorUserNameText: errorUserNameText,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                        heightScreen * 0.02,
                      ),
                      child: PasswordText(
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
