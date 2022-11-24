import 'package:flutter/material.dart';


import '../../../controllers/authentication_submitions.dart';

import '../../../controllers/validations.dart';

import '../../widgets/authentication/dividor_or.dart';
import '../../widgets/authentication/sign_up_button.dart';
import '../../widgets/authentication/uesrname_password_textfield.dart';
import '../../widgets/authentication/user_signup_web_agreement.dart';
import 'email_login.dart';
import 'email_signup_w_2.dart';

class EmailSignupW extends StatefulWidget {
  const EmailSignupW({super.key});

  @override
  State<EmailSignupW> createState() => _EmailSignupWState();
}

void emailLogin(BuildContext ctx) {
  Navigator.of(ctx).pushReplacementNamed(EmailLogin.routeName, arguments: {});
}

void submit(emailController, ctx) {
  Navigator.of(ctx).pushReplacementNamed(EmailSignupW2.routeName,
      arguments: {'email': emailController});
}

class _EmailSignupWState extends State<EmailSignupW> {
  TextEditingController emailController = TextEditingController();
  String? errorEmailText;

  void validate(emailController, ctx) {
    setState(() => errorEmailText = emailValidation(emailController.text));

    if (errorEmailText == null) {
      submit(emailController, ctx);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userAgrementUrl =
        Uri.parse('https://www.redditinc.com/policies/user-agreement');
    final privacyUrl =
        Uri.parse('https://www.reddit.com/policies/privacy-policy');

    final mediaQuery = MediaQuery.of(context);

    final heightScreen = (mediaQuery.size.height - mediaQuery.padding.top);
    final widthScreen = (mediaQuery.size.width);
    const fixedWidth = 1536;
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: heightScreen * 0.01,
                    ),
                    Padding(
                      padding: padding * 0.3,
                      child: const Text(
                        'Sign up',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: fixedWidth * 0.2,
                      child: UserSignupWebAgreement(
                          userAgrementUrl: userAgrementUrl,
                          privacyUrl: privacyUrl),
                    ),
                    SizedBox(
                      height: heightScreen * 0.1,
                    ),
                    SizedBox(
                      width: fixedWidth * 0.2,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: SignUpButton(
                            'assets/images/google.png',
                            'CONTINUE WITH GOOGLE',
                            () => handleGoogleSignIn(context)),
                      ),
                    ),
                    SizedBox(
                      width: fixedWidth * 0.2,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: SignUpButton(
                            'assets/images/facebook.png',
                            'CONTINUE WITH FACEBOOK',
                            () => handleFacebookAuth(context)),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: DividerOR(fixedWidth: fixedWidth),
                    ),
                    SizedBox(
                      width: fixedWidth * 0.2,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: EmailText(
                            emailController: emailController,
                            errorEmailText: errorEmailText),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SizedBox(
                        width: fixedWidth * 0.2,
                        child: ElevatedButton(
                          onPressed: () => validate(emailController, context),
                          child: const Text('CONTINUE'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SizedBox(
                        width: fixedWidth * 0.2,
                        child: Row(
                          children: [
                            const Text(
                              style: TextStyle(
                                fontSize: 12,
                              ),
                              'Already a redditor?',
                            ),
                            TextButton(
                              onPressed: () => emailLogin(context),
                              child: const Text(
                                'LOG IN',
                                style: TextStyle(
                                  fontSize: 12,
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
            ],
          ),
        ),
      ),
    );
  }
}
