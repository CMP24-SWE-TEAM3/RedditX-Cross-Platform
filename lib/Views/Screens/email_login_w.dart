import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// import '../../Controllers/signin_google.dart';
import '../../Controllers/internet_controller.dart';
import '../../Controllers/sign_in_controller.dart';
import '../../Controllers/validations.dart';
import '../Widgets/dividor_or.dart';
import '../Widgets/show_snackbar.dart';

import '../Widgets/sign_up_button.dart';
import '../Widgets/uesrname_password_textfield.dart';
import '../Widgets/user_login_agreement.dart';
import 'email_login.dart';
import 'email_signup.dart';
import 'forget_password.dart';
import 'forget_username.dart';
import 'temphome.dart';

class EmailLoginW extends StatefulWidget {
  const EmailLoginW({super.key});

  @override
  State<EmailLoginW> createState() => _EmailLoginWState();
}

class _EmailLoginWState extends State<EmailLoginW> {
  bool _submited = false;
  TextEditingController userNameController = TextEditingController();
  String? errorUserNameText;
  TextEditingController passwordController = TextEditingController();
  String? errorPasswordText;

  void validate(userNameController, passwordController, ctx) {
    setState(() {
      _submited = true;
      errorUserNameText = usernameValidation(userNameController.text);
      errorPasswordText = passwordValidation(passwordController.text);
    });

    if ((errorUserNameText == null) && (errorPasswordText == null)) {
      submitlogin(userNameController, passwordController, ctx);
    }
  }

  void forgetPass(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(ForgetPassword.routeName, arguments: {});
  }

  void forgetusername(BuildContext ctx) {
    Navigator.of(ctx)
        .pushReplacementNamed(ForgetUserName.routeName, arguments: {});
  }

  void emailsignup(BuildContext ctx) {
    Navigator.of(ctx)
        .pushReplacementNamed(EmailSignup.routeName, arguments: {});
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
    const fixedWidth = 1536;
    final userAgrementUrl =
        Uri.parse('https://www.redditinc.com/policies/user-agreement');
    final privacyUrl =
        Uri.parse('https://www.reddit.com/policies/privacy-policy');

    final mediaQuery = MediaQuery.of(context);

    final heightScreen = (mediaQuery.size.height - mediaQuery.padding.top);
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
                      width: fixedWidth * 0.2,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: SignUpButton('assets/images/google.png',
                            'CONTINUE WITH GOOGLE', handleGoogleSignIn),
                      ),
                    ),
                    SizedBox(
                      width: fixedWidth * 0.2,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: SignUpButton('assets/images/facebook.png',
                            'CONTINUE WITH FACEBOOK', handleFacebookAuth),
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
                        child: UserNameText(
                          userNameController: userNameController,
                          errorUserNameText: errorUserNameText,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: fixedWidth * 0.2,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: PasswordText(
                          passwordController: passwordController,
                          errorPasswordText: errorPasswordText,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SizedBox(
                        width: fixedWidth * 0.2,
                        child: ElevatedButton(
                          onPressed: () => validate(
                              userNameController, passwordController, context),
                          child: (_submited)
                              ? const Icon(Icons.check)
                              : const Text('LOG IN'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SizedBox(
                        width: fixedWidth * 0.2,
                        child: Row(
                          children: [
                            const Text('Forget your'),
                            TextButton(
                              onPressed: () => forgetusername(context),
                              child: const Text('username'),
                            ),
                            const Text('or'),
                            TextButton(
                              onPressed: () => forgetPass(context),
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
                        width: fixedWidth * 0.2,
                        child: Row(
                          children: [
                            const Text('New to Reddit?'),
                            TextButton(
                              onPressed: () => emailsignup(context),
                              child: const Text('SIGN UP'),
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
