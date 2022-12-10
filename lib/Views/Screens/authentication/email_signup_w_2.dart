import 'package:flutter/material.dart';
import 'package:username_gen/username_gen.dart';

import '../../../controllers/authentication_submitions.dart';
import '../../../controllers/validations.dart';
import '../../widgets/authentication/uesrname_password_textfield.dart';
import 'email_login.dart';
import 'email_signup.dart';

class EmailSignupW2 extends StatefulWidget {
  const EmailSignupW2({super.key});
  static const routeName = '/EmailSignupStep2Web';

  @override
  State<EmailSignupW2> createState() => _EmailSignupW2State();
}

void emailLogin(BuildContext ctx) {
  Navigator.of(ctx).pushReplacementNamed(EmailLogin.routeName, arguments: {});
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

  Future<void> validate(userNameController, passwordController, ctx) async {
    setState(() {
      errorPasswordText = passwordValidation(passwordController.text);
    });
    errorUserNameText = await usernameValidation(userNameController.text, ctx);

    if ((errorUserNameText == null) && (errorPasswordText == null)) {
      final routeargs =
          // ignore: use_build_context_synchronously
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      submitSignup(
          routeargs['email'], userNameController, passwordController, ctx);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.of(context)
                              .pushReplacementNamed(EmailSignup.routeName,
                                  arguments: {}),
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
