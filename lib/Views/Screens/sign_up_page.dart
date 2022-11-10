import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../Controllers/signin_google.dart';
import '../Widgets/sign_up_button.dart';
import '../Widgets/sign_up_bar.dart';
import '../Widgets/user_privacy_agreement.dart';
import 'email_login.dart';
import 'temphome.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  static const routeName = '/signup';

  void emailLogin(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(EmailLogin.routeName, arguments: {});
  }

  void googleSignIn() {
    // final GoogleSignInAccount user = signInGoogle() as GoogleSignInAccount;
    // if (user != null) {
    //   print(user.displayName);
    // } else {
    //   print('Null');
    // }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final dynamic appBar = buildAppBar(
        text: 'Skip',
        function: () => Navigator.of(context)
            .pushReplacementNamed(Home.routeName, arguments: {}));
    final heightScreen = (mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top);
    final padding = EdgeInsets.symmetric(
      vertical: heightScreen * 0.01,
      horizontal: mediaQuery.size.width * 0.1,
    );
    final userAgrementUrl =
        Uri.parse('https://www.redditinc.com/policies/user-agreement');
    final privacyUrl =
        Uri.parse('https://www.reddit.com/policies/privacy-policy');
    return Scaffold(
        appBar: appBar,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: heightScreen * 0.05,
              ),
              const Text(
                'Dive into anything',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(
                height: heightScreen * 0.05,
              ),
              Image.asset(
                'assets/images/loginEmote.png',
                height: heightScreen * 0.4,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: heightScreen * 0.05,
              ),
              Padding(
                padding: padding,
                child: SignUpButton('assets/images/google.png',
                    'Continue with Google', googleSignIn),
              ),
              Padding(
                padding: padding,
                child: SignUpButton('assets/images/facebook.png',
                    'Continue with Facebook', () {}),
              ),
              Padding(
                padding: padding,
                child: SignUpButton(
                    key: const ValueKey(
                        'continue_with_email_sign_in_options_Page'),
                    'assets/images/email.png',
                    'Continue with email',
                    (context) => emailLogin(context)),
              ),
              Padding(
                padding: padding,
                child: UserPrivacyAggreement(
                    userAgrementUrl: userAgrementUrl, privacyUrl: privacyUrl),
              ),
              SizedBox(
                height: heightScreen * 0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already a Redditor?',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    TextButton(
                      key: const ValueKey('login_sign_in_options_Page'),
                      style: ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.primary),
                      ),
                      onPressed: () => emailLogin(context),
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
