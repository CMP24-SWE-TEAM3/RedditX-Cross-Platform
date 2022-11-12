import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit/controllers/Mobile_settings_controller.dart';
import 'package:reddit/views/Settings/screens/account_setting_screen.dart';
import 'package:reddit/views/Settings/screens/change_password_screen.dart';
import 'package:reddit/views/Settings/screens/manage-emails.dart';
import 'package:reddit/views/Settings/screens/update_email_screen.dart';
import '../../../config/const.dart';
import '../../../config/icons/my_flutter_app_icons.dart';

import '../widgets/ListTilesWidgets.dart';
import '../widgets/settingLabelWidget.dart';


void main() {
  runApp(SettingsMenu());
}

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: white,
      ),
      home: ChangeNotifierProvider(
        create: (_) => SettingsMobileController(),
        child: SettingsHomePage(),
      ),
      routes: {
        SettingsHomePage.routeName: (context) => SettingsHomePage(),
        AccountSettingsScreen.routeName: (context) => AccountSettingsScreen(),
        ManageEmailsScreen.routeName: (context) => ManageEmailsScreen(),
        UpdateEmailAddress.routeName: (context) => UpdateEmailAddress(),
        ChangePasswordScreen.routeName: (context) => ChangePasswordScreen(),
      },
    );
  }
}

class SettingsHomePage extends StatelessWidget {
  static const routeName = '/Settings';
  final String title = "Settings";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),
        ),
        title: const Text("Settings"),
      ),
      body: ListView(
        //   child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SettingsLabel(title: "GENERAL"),
          SettingsListTile(
            title: "Account settings for u/USERNAME",
            ico: const Icon(Icons.person),
            onTab: () {
              // Navigator.of(context)
              //     .pushNamed(accountSettingsScreen.routeName, arguments: {});
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                      create: (_) => SettingsMobileController(),
                      child: AccountSettingsScreen(),
                    ),
                  ));
            },
          ),
          SettingsLabel(title: "PREMIUM"),
          SettingsListTile(
            title: "Change app icon",
            ico: const Icon(Icons.reddit),
          ),
          InkWell(
            onTap: () {},
            child: SettingsListTile(
              title: "Change profile picture",
              ico: const Icon(Icons.photo_camera_front_outlined),
            ),
          ),
          SettingsLabel(title: "ABOUT"),
          ListTileURL(
            url: "http://redditinc.com/policies/content-policy",
            title: "Content policy",
            ico: const Icon(Icons.message_sharp),
          ),
          ListTileURL(
            url: "http://reddit.com/policies/privacy-policy",
            title: "Privacy policy",
            ico: const Icon(Icons.settings),
          ),
          ListTileURL(
            url: "http://redditinc.com/policies/user-agreement",
            title: "User agreement",
            ico: const Icon(Icons.settings),
          ),
          SettingsLabel(title: "SUPPORT"),
          ListTileURL(
            url: "http://reddithelp.com/hc/en-us",
            title: "Help center",
            ico: const Icon(Icons.help),
          ),
          ListTileURL(
            url:
                "http://reddit.zendesk.com/hc/en-us/requests/new?ticket_form_id=65076",
            title: "Report an issue",
            ico: const Icon(Icons.email_outlined),
          ),
        ],
        //),
      ),
    );
  }
}
