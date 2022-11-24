import 'package:flutter/material.dart';



import '../../../controllers/authentication_submitions.dart';

import '../../widgets/authentication/interest_button.dart';
import '../../widgets/authentication/interest_choice.dart';

import '../../widgets/authentication/sign_up_bar.dart';


class Interests extends StatefulWidget {
  const Interests({super.key});
  static const routeName = '/Interests';

  @override
  State<Interests> createState() => _InterestsState();
}

class _InterestsState extends State<Interests> {
  int num = 0;

  String text = ' of 3 selected';

  void select(String text) {
    setState(() {
      if (choosenInterest.contains(text)) {
        choosenInterest.remove(text);
        num--;
      } else {
        choosenInterest.add(text);
        num++;
      }
    });
  }

  List<String> choosenInterest = [];

  List interests = [
    ['Funny', '🤣'],
    ['Jokes', '😄'],
    ['Interesting', '🤔'],
    ['Memes', '💩'],
    ['Lifehacks', '💡'],
    ['Nature', '🌱'],
    ['Space', '🚀'],
    ['History', '🏛️'],
    ['Tech', '📱'],
    ['Science', '🧬'],
    ['News', '🗞️'],
    ['Career', '💼'],
    ['Books', '📖'],
    ['Programming', '💻'],
    ['Travel', '✈️'],
    ['Fishing', '🎣'],
    ['Sports', '🎾'],
    ['Fitness', '💪'],
    ['Cars', '🚘']
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final dynamic appBar = buildAppBar();
    final heightScreen = (mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top);
    final widthScreen = (mediaQuery.size.width);
    final padding = EdgeInsets.symmetric(
      vertical: heightScreen * 0.01,
      horizontal: widthScreen * 0.05,
    );
    return Scaffold(
      appBar: appBar,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: padding,
                      child: const Text(
                        'Interests',
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
                      'Pick things you\'d like to see in your home feed.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      children: [
                        ...interests
                            .map((i) => InterestChoice(
                                  i,
                                  select,
                                ))
                            .toList(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: heightScreen * 0.02),
                child: InterestButton(
                  key: const ValueKey('continue_interest_page'),
                  (num > 2) ? true : false,
                  (num > 2) ? 'Continue' : num.toString() + text,
                  () => submitInterest(choosenInterest, context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

