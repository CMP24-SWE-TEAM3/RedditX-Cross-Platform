import 'package:flutter/material.dart';

import '../Widgets/continue_login_button.dart';
import '../Widgets/sign_up_bar.dart';
import '../Widgets/sign_up_button.dart';
import '../Widgets/uesrname_password_textfield.dart';
import '../Widgets/user_login_agreement.dart';
import 'email_signup.dart';
import 'forget_password.dart';
import 'temphome.dart';

class EmailLoginW extends StatefulWidget {
  const EmailLoginW({super.key});

  @override
  State<EmailLoginW> createState() => _EmailLoginWState();
}

class _EmailLoginWState extends State<EmailLoginW> {
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
    final widthScreen = (mediaQuery.size.width);
    final padding = EdgeInsets.symmetric(
      vertical: heightScreen * 0.09,
      horizontal: widthScreen * 0.03,
    );
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Row(
            children: [
              SizedBox(
                child: Image.asset(
                  'assets/images/web_signup_edge.jpg',
                  width: widthScreen * 0.1,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: padding,
                child: SizedBox(
                  width: widthScreen * 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: heightScreen * 0.01,
                      ),
                      Padding(
                        padding: padding * 0.3,
                        child: const Text(
                          'Log in',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      UserLoginAggreement(
                          userAgrementUrl: userAgrementUrl,
                          privacyUrl: privacyUrl),
                      SizedBox(
                        height: heightScreen * 0.1,
                      ),
                      SizedBox(
                        width: widthScreen * 0.2,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: SignUpButton('assets/images/google.png',
                              'CONTINUE WITH GOOGLE', () {}),
                        ),
                      ),
                      SizedBox(
                        width: widthScreen * 0.2,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: SignUpButton('assets/images/facebook.png',
                              'CONTINUE WITH FACEBOOK', () {}),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: widthScreen * 0.07,
                              child: const Divider(
                                thickness: 1,
                                color: Colors.black12,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text('OR'),
                            ),
                            SizedBox(
                              width: widthScreen * 0.09,
                              child: const Divider(
                                thickness: 1,
                                color: Colors.black12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: widthScreen * 0.2,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: UserNameText(
                              userNameController: userNameController),
                        ),
                      ),
                      SizedBox(
                        width: widthScreen * 0.2,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: PasswordText(
                              passwordController: passwordController),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: SizedBox(
                          width: widthScreen * 0.2,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('LOG IN'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: SizedBox(
                          width: widthScreen * 0.2,
                          child: Row(
                            children: [
                              const Text('Forget your'),
                              TextButton(
                                onPressed: () {},
                                child: const Text('username'),
                              ),
                              const Text('or'),
                              TextButton(
                                onPressed: () {},
                                child: const Text('password'),
                              ),
                              const Text('?'),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: SizedBox(
                          width: widthScreen * 0.2,
                          child: Row(
                            children: [
                              const Text('New to Reddit?'),
                              TextButton(
                                onPressed: () {},
                                child: const Text('SIGN UP'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
