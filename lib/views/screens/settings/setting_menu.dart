import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/mobile_settings_controller.dart';
import '/views/screens/settings/account_setting_screen.dart';

import '../../widgets/settings/list_tiles_widgets.dart';
import '../../widgets/settings/setting_label_widget.dart';

//to be moved
bool sw1ReduceAnimation = false;
bool sw2ShowNSFW = false;
bool sw3BlurNSFW = false;
bool sw3enble = false;

class SettingsHomePage extends StatelessWidget {
  static const routeName = '/Settings';
  final String title = "Settings";

  const SettingsHomePage({super.key});
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
                      create: (_) => SettingsViewModelMobileController(),
                      child: const AccountSettingsScreen(),
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
