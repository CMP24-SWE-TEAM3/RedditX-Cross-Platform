import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authentication/splash_screen.dart';
import 'community/community_home.dart';
import 'create_community/create_community_screen.dart';


import '../../controllers/sign_in_controller.dart';
import './search/search_screen_one.dart';
import 'Home/home_page.dart';

import 'profile/profile_page.dart';
// import 'addComment/add_comment.dart';
import 'settings/setting_menu.dart';
/// temphome
class Home extends StatelessWidget {
  const Home({super.key});
  static const routeName = '/Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                child: const Text("Community")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(SearchScreenOne.routeName, arguments: {});
                },
                child: const Text("Search")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                      CreateCommunityScreen.routeName,
                      arguments: {});
                },
                child: const Text("Create community")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(SettingsHomePage.routeName, arguments: {});
                },
                child: const Text("Settings")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(HomePage.routeName, arguments: {});
                },
                child: const Text("Home")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(ProfilePage.routeName, arguments: {});
                },
                child: const Text("profile")),
            ElevatedButton(
                onPressed: () {
   
                },
                child: const Text("Drawers Home")),
          ],
        ),
      ),
    );
  }
}
