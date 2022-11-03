import 'package:flutter/material.dart';
import 'package:reddit/View/screens/account_setting_screen.dart';
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
  runApp(const accountSettingsScreen());
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
      home: const MyHomePage(title: 'Settings Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
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
          SettingsLabel(title: "FEED OPTIONS"),
          SettingsTileButtomSheet(
            leadingIcon: const Icon(Icons.house_rounded),
            titleText: const Text("Sort Home posts by"),
            //variableVal: ,   to be implemented in logic
            sheetText: const Text('SORT POSTS BY'),
            sheetChildrenIconList: const [
              Icon(Icons.rocket),
              Icon(Icons.hot_tub),
              Icon(Icons.psychology_outlined),
              Icon(Icons.arrow_upward_rounded),
              Icon(MyFlutterApp.broadsword),
              Icon(Icons.keyboard_arrow_up),
            ],
            sheetChildrenTextList: const [
              Text('Best'),
              Text('Hot'),
              Text('New'),
              Text('Top'),
              Text('Controversial'),
              Text('Rising')
            ],
          ),
          SettingsLabel(title: "VIEW OPTIONS"),
          SettingsTileButtomSheet(
            leadingIcon: const Icon(Icons.rectangle),
            titleText: const Text("Default view"),
            //variableVal: ,   to be implemented in logic
            sheetText: const Text('DEFAULT VIEW'),
            sheetChildrenIconList: const [
              Icon(Icons.rectangle),
              Icon(Icons.rectangle),
            ],
            sheetChildrenTextList: const [
              Text('Card'),
              Text('Classic'),
            ],
          ),
          SettingsTileButtomSheet(
            leadingIcon: const Icon(Icons.rectangle),
            titleText: const Text("Autoplay"),
            //variableVal: ,   to be implemented in logic
            sheetText: const Text('AUTOPLAY'),
            sheetChildrenIconList: const [
              Icon(Icons.rectangle),
              Icon(Icons.rectangle),
            ],
            sheetChildrenTextList: const [
              Text('Card'),
              Text('Classic'),
            ],
          ),
          ListTileCustom(
              ico: const Icon(Icons.remove_red_eye),
              text: "Reduce animations",
              selector: sw1ReduceAnimation),
          ListTileCustom(
              ico: const Icon(Icons.person),
              text: "Show NSFW content (Im over 18)",
              selector: sw2ShowNSFW),
          ListTileCustom(
              ico: const Icon(Icons.eighteen_mp),
              text: "Blur NSFW Images",
              selector: sw3BlurNSFW),
          SettingsLabel(title: "ADVANCED"),
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
            url: "https://www.reddithelp.com/hc/en-us",
            title: "Report an issue",
            ico: const Icon(Icons.email_outlined),
          ),
          SettingsLabel(title: "BUILD INFORMATION"),
        ],
        //),
      ),
    );
  }
}
