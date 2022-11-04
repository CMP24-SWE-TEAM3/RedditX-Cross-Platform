import 'package:flutter/material.dart';
import 'package:reddit/View/screens/account_setting_screen.dart';
import 'package:reddit/View/screens/change_password_screen.dart';
import 'package:reddit/View/screens/manage-emails.dart';
import 'package:reddit/View/screens/update_email_screen.dart';
import '../../const/const.dart';
import '../../icons/my_flutter_app_icons.dart';

import '../widgets/ListTilesWidgets.dart';
import '../widgets/settingLabelWidget.dart';

//to be moved
bool sw1ReduceAnimation = false;
bool sw2ShowNSFW = false;
bool sw3BlurNSFW = false;
bool sw3enble = false;

void main() {
  runApp(const ChangePasswordScreen());
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
      home: const SettingsHomePage(
        title: "Settings",
      ),
      routes: {
        SettingsHomePage.routeName: (context) =>
            const SettingsHomePage(title: "Settings"),
        accountSettingsScreen.routeName: (context) =>
            const accountSettingsScreen(),
        manageEmailsScreen.routeName: (context) => const manageEmailsScreen(),
        UpdateEmailAddress.routeName: (context) => const UpdateEmailAddress(),
        ChangePasswordScreen.routeName: (context) =>
            const ChangePasswordScreen(),
      },
    );
  }
}

class SettingsHomePage extends StatefulWidget {
  const SettingsHomePage({super.key, required this.title});

  static const routeName = '/Settings';
  final String title;

  @override
  State<SettingsHomePage> createState() => _SettingsHomePageState();
}

class _SettingsHomePageState extends State<SettingsHomePage> {
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
            title: "Account settings for u/USER_NAME",
            ico: const Icon(Icons.person),
            onTab: () {
              Navigator.of(context)
                  .pushNamed(accountSettingsScreen.routeName, arguments: {});
            },
          ),
          SettingsLabel(title: "PREMIUM"),
          SettingsListTile(
            title: "Change app icon",
            ico: const Icon(Icons.reddit),
          ),
          SettingsListTile(
            title: "Style Avatar",
            ico: const Icon(Icons.checkroom_rounded),
          ),
          SettingsLabel(title: "ABOUT"),
          ListTileURL(
            url: "https://www.redditinc.com/policies/content-policy",
            title: "Content policy",
            ico: const Icon(Icons.message_sharp),
          ),
          ListTileURL(
            url: "https://www.reddit.com/policies/privacy-policy",
            title: "Privacy policy",
            ico: const Icon(Icons.settings),
          ),
          ListTileURL(
            url: "https://www.redditinc.com/policies/user-agreement",
            title: "User agreement",
            ico: const Icon(Icons.settings),
          ),
          SettingsLabel(title: "SUPPORT"),
          ListTileURL(
            url: "https://www.reddithelp.com/hc/en-us",
            title: "Help center",
            ico: const Icon(Icons.help),
          ),
          ListTileURL(
            url:
                "https://reddit.zendesk.com/hc/en-us/requests/new?ticket_form_id=65076",
            title: "Report an issue",
            ico: const Icon(Icons.email_outlined),
          ),
        ],
        //),
      ),
    );
  }
}
