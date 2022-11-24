import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_project/views/screens/authentication/splash_screen.dart';
import 'package:search_project/views/screens/community/community_home.dart';

import '../../controllers/sign_in_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const routeName = '/Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  final sp =
                      Provider.of<SignInController>(context, listen: false);
                  sp.userSignOut();
                  Navigator.of(context).pushReplacementNamed(
                      SplashScreen.routeName,
                      arguments: {});
                },
                child: const Text('sign out')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(CommunityHome.routeName, arguments: {});
                },
                child: const Text("Community"))
          ],
        ),
      ),
    );
  }
}
