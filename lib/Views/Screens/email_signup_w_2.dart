import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:username_gen/username_gen.dart';

import '../../Controllers/validations.dart';
import '../Widgets/dividor_or.dart';
import '../Widgets/sign_up_bar.dart';
import '../Widgets/sign_up_button.dart';
import '../Widgets/uesrname_password_textfield.dart';
import '../Widgets/user_login_agreement.dart';
import '../Widgets/user_signup_web_agreement.dart';
import 'about_you.dart';
import 'email_login.dart';
import 'email_signup.dart';
import 'temphome.dart';

class EmailSignupW2 extends StatefulWidget {
  const EmailSignupW2({super.key});
  static const routeName = '/EmailSignupStep2Web';

  @override
  State<EmailSignupW2> createState() => _EmailSignupW2State();
}

void emailLogin(BuildContext ctx) {
  Navigator.of(ctx).pushReplacementNamed(EmailLogin.routeName, arguments: {});
}

void submit(userNameController, passwordController, ctx) {
  print('sending data to back end');
  Navigator.of(ctx).pushReplacementNamed(Home.routeName, arguments: {});
}

class _EmailSignupW2State extends State<EmailSignupW2> {
  TextEditingController userNameController = TextEditingController();
  String? errorUserNameText;
  TextEditingController passwordController = TextEditingController();
  String? errorPasswordText;
  var _userNameSuggest = ['', '', '', '', ''];

  void refresh() {
    setState(() => _userNameSuggest = [
          UsernameGen().generate(),
          UsernameGen().generate(),
          UsernameGen().generate(),
          UsernameGen().generate(),
          UsernameGen().generate()
        ]);
  }

  @override
  void initState() {
    super.initState();
    _userNameSuggest = [
      UsernameGen().generate(),
      UsernameGen().generate(),
      UsernameGen().generate(),
      UsernameGen().generate(),
      UsernameGen().generate()
    ];
  }

  void validate(userNameController, passwordController, ctx) {
    setState(() {
      errorUserNameText = usernameValidation(userNameController.text);
      errorPasswordText = passwordValidation(passwordController.text);
    });

    if ((errorUserNameText == null) && (errorPasswordText == null)) {
      final routeargs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      submitSignup(
          routeargs['email'], userNameController, passwordController, ctx);
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
    const finalWidth = fixedWidth * 0.27;
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
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: widthScreen * 0.009,
                      ),
                      child: const Text(
                        'Choose your username',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    Padding(
                      padding: padding * 0.3,
                      child: const SizedBox(
                        child: Text(
                          'Your username is how other community members will see you. This name will be used to credit you for things you share on Reddit. What should we call you?',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: finalWidth,
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: UserNameText(
                                    userNameController: userNameController,
                                    errorUserNameText: errorUserNameText),
                              ),
                            ),
                            SizedBox(
                              width: finalWidth,
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: PasswordText(
                                    passwordController: passwordController,
                                    errorPasswordText: errorPasswordText),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Here are some username suggestions',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                IconButton(
                                  onPressed: refresh,
                                  icon: const Icon(Icons.refresh_rounded),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () =>
                                  userNameController.text = _userNameSuggest[0],
                              child: Text(_userNameSuggest[0]),
                            ),
                            TextButton(
                              onPressed: () =>
                                  userNameController.text = _userNameSuggest[1],
                              child: Text(_userNameSuggest[1]),
                            ),
                            TextButton(
                              onPressed: () =>
                                  userNameController.text = _userNameSuggest[2],
                              child: Text(_userNameSuggest[2]),
                            ),
                            TextButton(
                              onPressed: () =>
                                  userNameController.text = _userNameSuggest[3],
                              child: Text(_userNameSuggest[3]),
                            ),
                            TextButton(
                              onPressed: () =>
                                  userNameController.text = _userNameSuggest[4],
                              child: Text(_userNameSuggest[4]),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () =>
                              userNameController.text = _userNameSuggest[4],
                          child: const Text(
                            'Back',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: SizedBox(
                            width: fixedWidth * 0.1,
                            child: ElevatedButton(
                              onPressed: () => validate(userNameController,
                                  passwordController, context),
                              child: const Text('SIGN UP'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
