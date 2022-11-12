import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// import '../../Controllers/signin_google.dart';
import '../../Controllers/internet_controller.dart';
import '../../Controllers/sign_in_controller.dart';
import '../Widgets/show_snackbar.dart';
import '../Widgets/sign_up_button.dart';
import '../Widgets/sign_up_bar.dart';

import '../Widgets/user_privacy_agreement.dart';
import 'email_login.dart';
import 'temphome.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static const routeName = '/signup';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  void emailLogin(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(EmailLogin.routeName, arguments: {});
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
                    'Continue with Google', handleGoogleSignIn),
              ),
              Padding(
                padding: padding,
                child: SignUpButton('assets/images/facebook.png',
                    'Continue with Facebook', handleFacebookAuth),
              ),
              Padding(
                padding: padding,
                child: SignUpButton(
                    key: const ValueKey(
                        'continue_with_email_sign_in_options_Page'),
                    'assets/images/email.png',
                    'Continue with email',
                    () => emailLogin(context)),
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

// handling google sigin in
  Future handleGoogleSignIn() async {
    final sp = Provider.of<SignInController>(context, listen: false);
    final ip = Provider.of<InternetController>(context, listen: false);
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      // ignore: use_build_context_synchronously
      showSnackBar("Check your Internet connection", context);
    } else {
      await sp.signInWithGoogle().then((value) {
        if (sp.hasError == true) {
          showSnackBar(sp.errorCode.toString(), context);
        } else {
          // checking whether user exists or not
          sp.checkUserExists().then((value) async {
            if (value == true) {
              // user exists
              await sp.getUserDataFromDataBase(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        handleAfterSignIn();
                      })));
            } else {
              // user does not exist
              sp.saveDataToDataBase().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        handleAfterSignIn();
                      })));
            }
          });
        }
      });
    }
  }

  // handling facebookauth
  // handling google sigin in
  Future handleFacebookAuth() async {
    final sp = Provider.of<SignInController>(context, listen: false);
    final ip = Provider.of<InternetController>(context, listen: false);
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      // ignore: use_build_context_synchronously
      showSnackBar("Check your Internet connection", context);
      // facebookController.reset();
    } else {
      await sp.signInWithFacebook().then((value) {
        if (sp.hasError == true) {
          showSnackBar(sp.errorCode.toString(), context);
        } else {
          // checking whether user exists or not
          sp.checkUserExists().then((value) async {
            if (value == true) {
              // user exists
              await sp.getUserDataFromDataBase(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        handleAfterSignIn();
                      })));
            } else {
              // user does not exist
              sp.saveDataToDataBase().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        handleAfterSignIn();
                      })));
            }
          });
        }
      });
    }
  }

  // handle after signin
  handleAfterSignIn() {
    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      Navigator.of(context).pushReplacementNamed(Home.routeName, arguments: {});
    });
  }
}
