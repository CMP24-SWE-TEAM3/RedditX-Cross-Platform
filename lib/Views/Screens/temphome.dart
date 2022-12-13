// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_project/models/authentication.dart';
import 'package:search_project/views/screens/authentication/splash_screen.dart';
import 'package:search_project/views/screens/community/community_home.dart';
import '../../controllers/mobile_settings_view_controller.dart';
import '../../controllers/sign_in_controller.dart';
import './search/search_screen_one.dart';
import 'settings/setting_menu.dart';

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
                onPressed: () async {
                  // await Provider.of<SettingsViewModelMobileController>(context,
                  //         listen: false)
                  //     .getSettingsUserDataFromPrefs();
                  // await Provider.of<SettingsViewModelMobileController>(context,
                  //         listen: false)
                  //     .updateSharedPrefsFromService(
                  //         userauthentication.username);
                  Navigator.of(context)
                      .pushNamed(SettingsHomePage.routeName, arguments: {});
                  //settingsServiceModelController.getUserPrefsModelController();
                },
                child: const Text("Settings")),
          ],
        ),
      ),
    );
  }
}
