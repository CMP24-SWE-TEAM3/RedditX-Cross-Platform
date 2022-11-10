import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import '../Widgets/interest_button.dart';
import '../Widgets/interest_choice.dart';
import '../Widgets/sign_up_bar.dart';
import 'choose_profilepicture.dart';
import 'choose_username.dart';

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
                  () => submit(choosenInterest, context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void submit(List<String> list, ctx) {
  if (false) {
    print('sending data to back end');
    print(list);
    print('----------------------------------------');
    Navigator.of(ctx)
        .pushReplacementNamed(ChooseProfilePicture.routeName, arguments: {});
  } else {
    final mediaQuery = MediaQuery.of(ctx);
    final widthScreen = (mediaQuery.size.width);
    final heightScreen = (mediaQuery.size.height - mediaQuery.padding.top);
    // set up the AlertDialog
    AlertDialog profilePicturePage = AlertDialog(
      content: Container(
        width: widthScreen * 0.4,
        height: heightScreen * 0.73,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        child: const ChooseProfilePicture(),
      ),
    );
    print('sending data to back end');
    print(list);
    print('----------------------------------------');
    (kIsWeb)
        ? showDialog(
            context: ctx,
            builder: (BuildContext context) {
              return profilePicturePage;
            },
          )
        : Navigator.of(ctx)
            .pushReplacementNamed(ChooseUserName.routeName, arguments: {});
  }
}


/**
 * 
 * 
 * 
 * 
 * 

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







 */