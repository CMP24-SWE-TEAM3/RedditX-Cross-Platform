import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// import '../../Controllers/signin_google.dart';
import '../../Controllers/validations.dart';
import '../Widgets/dividor_or.dart';
import '../Widgets/sign_up_bar.dart';
import '../Widgets/sign_up_button.dart';
import '../Widgets/uesrname_password_textfield.dart';
import '../Widgets/user_login_agreement.dart';
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

  void submit(userNameController, passwordController, ctx) {
    print('sending data to back end');
    Navigator.of(ctx).pop();
    Navigator.of(ctx).pushReplacementNamed(Home.routeName, arguments: {});
  }

  void validate(userNameController, passwordController, ctx) {
    setState(() {
      _submited = true;
      errorUserNameText = usernameValidation(userNameController.text);
      errorPasswordText = passwordValidation(passwordController.text);
    });

    if ((errorUserNameText == null) && (errorPasswordText == null)) {
      submit(userNameController, passwordController, ctx);
    } else {
      print(userNameController.text + "---" + passwordController.text);
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
                            'CONTINUE WITH GOOGLE', googleSignIn),
                      ),
                    ),
                    SizedBox(
                      width: fixedWidth * 0.2,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: SignUpButton('assets/images/facebook.png',
                            'CONTINUE WITH FACEBOOK', () {}),
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
}
