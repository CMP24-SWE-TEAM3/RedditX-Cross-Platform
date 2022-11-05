import 'package:flutter/material.dart';

import '../Widgets/choice_button.dart';
import '../Widgets/sign_up_bar.dart';
import 'interests.dart';

class AboutYou extends StatelessWidget {
  const AboutYou({super.key});
  static const routeName = '/AboutYou';

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
                  child: ChoiceButton('Man', submit, context),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(
                  heightScreen * 0.02,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ChoiceButton('Woman', submit, context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void skip(context) {
  Navigator.of(context).pop();
}

void submit(String kind, ctx) {
  print('sending data to back end');
  print('---------------------' + kind + '-------------------');
  Navigator.of(ctx)
      .pushReplacementNamed(Interests.routeName, arguments: {});
}
