import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:provider/provider.dart';

import '../../../controllers/internet_controller.dart';
import '../../../controllers/sign_in_controller.dart';
import '../../widgets/authentication/choice_button.dart';
import '../../widgets/authentication/show_snackbar.dart';
import '../../widgets/authentication/sign_up_bar.dart';
import 'interests.dart';

class AboutYou extends StatefulWidget {
  const AboutYou({super.key});
  static const routeName = '/AboutYou';

  @override
  State<AboutYou> createState() => _AboutYouState();
}

class _AboutYouState extends State<AboutYou> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final dynamic appBar =
        buildAppBar(text: 'Skip', function: () => skip(context));
    final heightScreen = (mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top);
    final padding = EdgeInsets.symmetric(
      vertical: heightScreen * 0.01,
      horizontal: mediaQuery.size.width * 0.1,
    );

    return Scaffold(
      appBar: appBar,
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: padding,
                  child: const Text(
                    'About you',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(
                  heightScreen * 0.02,
                ),
                child: const Text(
                  'Tell us about yourself to start building your home feed.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: heightScreen * 0.05,
              ),
              Padding(
                padding: EdgeInsets.all(
                  heightScreen * 0.02,
                ),
                child: const Text(
                  '|\'m a ...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(
                  heightScreen * 0.02,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ChoiceButton(
                    key: const ValueKey('man_gender_Page'),
                    'Man',
                    submit,
                    context,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(
                  heightScreen * 0.02,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ChoiceButton(
                    key: const ValueKey('woman_gender_Page'),
                    'Woman',
                    submit,
                    context,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void skip(context) {
    Navigator.of(context).pop();
  }

   Future<void> submit(String kind, ctx)  async {
    final mediaQuery = MediaQuery.of(ctx);
    final widthScreen = (mediaQuery.size.width);
    final heightScreen = (mediaQuery.size.height - mediaQuery.padding.top);
    // set up the AlertDialog
    AlertDialog interestPage = AlertDialog(
      content: Container(
        width: widthScreen * 0.4,
        height: heightScreen * 0.73,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        child: const Interests(),
      ),
    );

    final sp = Provider.of<SignInController>(context, listen: false);
    final ip = Provider.of<InternetController>(context, listen: false);
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      // ignore: use_build_context_synchronously
      showSnackBar("Check your Internet connection", context);
    } else {
      await sp.sendGender(kind).then((value) {
        if (sp.hasError == true) {
          showSnackBar(sp.errorCode.toString(), context);
        }
      });
    }

    (kIsWeb)
        ? showDialog(
            context: ctx,
            builder: (BuildContext context) {
              return interestPage;
            },
          )
        : Navigator.of(ctx)
            .pushReplacementNamed(Interests.routeName, arguments: {});
  }
}
