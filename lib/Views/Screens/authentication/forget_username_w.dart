import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



import '../../../controllers/authentication_submitions.dart';
import '../../../controllers/validations.dart';
import '../../widgets/authentication/login_signup_textrow.dart';
import '../../widgets/authentication/uesrname_password_textfield.dart';
import 'forget_username.dart';

class ForgetUserNameW extends StatefulWidget {
  const ForgetUserNameW({super.key});

  @override
  State<ForgetUserNameW> createState() => _ForgetUserNameWState();
}

class _ForgetUserNameWState extends State<ForgetUserNameW> {
  bool _valid = false;
  TextEditingController emailController = TextEditingController();
  String? errorEmailText;

  void validate(emailController, ctx) async {
    setState(() {
      errorEmailText = emailValidation(emailController.text);
    });

    if (errorEmailText == null) {
      _valid = true;
      resetUsername(emailController, ctx);
    }
  }

  void forgetusername(BuildContext ctx) {
    Navigator.of(ctx)
        .pushReplacementNamed(ForgetUserName.routeName, arguments: {});
  }

  void havingTrouble(havingTroubleurl) {
    launchUrl(havingTroubleurl, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final havingTroubleurl = Uri.parse(
        'https://reddithelp.com/hc/en-us/sections/360008917491-Account-Security');
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: heightScreen * 0.05,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: widthScreen * 0.009,
                      ),
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 40,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: widthScreen * 0.009,
                      ),
                      child: const Text(
                        'Recover your username',
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
                        width: finalWidth,
                        child: Text(
                          'Tell us the email address associated with your Reddit account, and we’ll send you an email with your username.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: finalWidth,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: EmailText(
                            emailController: emailController,
                            errorEmailText: errorEmailText),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 4,
                      ),
                      child: SizedBox(
                        width: fixedWidth * 0.1,
                        child: ElevatedButton(
                          onPressed: () => validate(emailController, context),
                          child: (_valid)
                              ? const Icon(Icons.check)
                              : const Text(
                                  'EMAIL ME',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        left: 4,
                      ),
                      child: SizedBox(
                        width: fixedWidth * 0.27,
                        child: Visibility(
                          visible: _valid,
                          child: Text(
                            'Thanks! If your Reddit username and email address match, you\'ll get an email with a link to reset your password shortly.',
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        left: 4,
                      ),
                      child: SizedBox(
                        width: finalWidth,
                        child: Row(
                          children: [
                            const Text(
                              style: TextStyle(
                                fontSize: 12,
                              ),
                              'Don\'t have an email or need assistance logging in? ',
                            ),
                            TextButton(
                              onPressed: () => havingTrouble(havingTroubleurl),
                              child: const Text(
                                'GET HELP',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    loginSignupTextRow(finalWidth, context),
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
