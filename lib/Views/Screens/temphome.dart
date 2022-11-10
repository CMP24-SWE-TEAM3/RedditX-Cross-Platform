import 'package:flutter/material.dart';

import 'about_you.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const routeName = '/Home';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final widthScreen = (mediaQuery.size.width);
    final heightScreen = (mediaQuery.size.height - mediaQuery.padding.top);
    // set up the AlertDialog
    AlertDialog genderPage = AlertDialog(
      content: Container(
        width: widthScreen * 0.4,
        height: heightScreen * 0.73,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        child: const AboutYou(),
      ),
    );
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return genderPage;
                  },
                ),
            child: const Text('Clickme')),
      ),
    );
  }
}