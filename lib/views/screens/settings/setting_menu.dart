import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/user_model.dart';
import '../../../controllers/mobile_settings_view_controller.dart';
import '../../../models/authentication.dart';
import '../authentication/choose_profilepicture.dart';
import '../authentication/sign_up_page.dart';
import '../../screens/settings/account_setting_screen.dart';
import '../../widgets/settings/list_tiles_widgets.dart';
import '../../widgets/settings/setting_label_widget.dart';

class SettingsHomePage extends StatelessWidget {
  static const routeName = '/Settings';
  final String title = "Settings";

  ///The main menu for settings
  const SettingsHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),
        ),
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          SettingsLabel(title: "GENERAL"),
          (userauthentication.isSignedIn)
              ? SettingsListTile(
                  key: const ValueKey('Account_settings_Button'),
                  title: "Account settings for u/${currentUser?.username}",
                  ico: const Icon(Icons.person),
                  onTab: () {
                    Provider.of<SettingsViewModelMobileController>(context,
                            listen: false)
                        .updateSharedPrefsFromService(
                            currentUser?.username, context);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider(
                            create: (_) => SettingsViewModelMobileController(),
                            child: const AccountSettingsScreen(),
                          ),
                        ));
                  },
                )
              : SettingsListTile(
                  key: const ValueKey('Add_Account_Button'),
                  title: "Add Account",
                  ico: const Icon(Icons.person),
                  onTab: () =>
                      Navigator.pushNamed(context, SignUpPage.routeName)),
          SettingsLabel(title: "PREMIUM"),
          InkWell(
            onTap: () {},
            child: SettingsListTile(
              key: const ValueKey('Change_profile_picture_Button'),
              title: "Change profile picture",
              ico: const Icon(Icons.photo_camera_front_outlined),
              onTab: () =>
                  Navigator.pushNamed(context, ChooseProfilePicture.routeName),
            ),
          ),
          SettingsLabel(title: "ABOUT"),
          ListTileURL(
            key: const ValueKey('Policy_Button'),
            url: "http://redditinc.com/policies/content-policy",
            title: "Content policy",
            ico: const Icon(Icons.message_sharp),
          ),
          ListTileURL(
            key: const ValueKey('Privacy_Button'),
            url: "http://reddit.com/policies/privacy-policy",
            title: "Privacy policy",
            ico: const Icon(Icons.settings),
          ),
          ListTileURL(
            key: const ValueKey('Agreement_Button'),
            url: "http://redditinc.com/policies/user-agreement",
            title: "User agreement",
            ico: const Icon(Icons.settings),
          ),
          SettingsLabel(title: "SUPPORT"),
          ListTileURL(
            key: const ValueKey('Help_center_Button'),
            url: "http://reddithelp.com/hc/en-us",
            title: "Help center",
            ico: const Icon(Icons.help),
          ),
          ListTileURL(
            key: const ValueKey('Repport_Button'),
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
