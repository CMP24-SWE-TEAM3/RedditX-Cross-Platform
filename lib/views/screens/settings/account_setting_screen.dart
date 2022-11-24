import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit/controllers/mobile_settings_controller.dart';
import 'package:reddit/views/screens/settings/manage_emails.dart';
import 'package:reddit/views/screens/settings/update_email_screen.dart';
import 'package:reddit/views/widgets/settings/list_tiles_widgets.dart';
import 'package:reddit/views/widgets/settings/setting_label_widget.dart';
import '../../../models/settings_model.dart';
import '../../../models/user_model.dart';
import '../../widgets/settings/make_password_first_dialogue.dart';
import 'change_password_screen.dart';

/// Account Settings screen, holds active account's settings and switches accounts
class AccountSettingsScreen extends StatelessWidget {
  /// Account Settings Screen reoute name
  static const routeName = '/Settings/Account_Settings';

  const AccountSettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    ///Appears in AccountSettingsScreen indicating if connected to google or not
    // Provider.of<SettingsViewModelMobileController>(context)
    //     .updateIsPasswordCheck();
    String connectDisconnectGoogle =
        (Provider.of<SettingsViewModelMobileController>(context)
                .connectedToGoogle)
            ? "Disconnect"
            : "Connect";
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),
        ),
        title: const Text("Acount Settings"),
      ),
      body: ListView(
        children: [
          SettingsLabel(title: "BASIC SETTINGS"),
          SettingsTileButtomSheet(
            leadingIcon: const Icon(Icons.person_outlined),
            titleText: const Text("Switch Accounts"),
            sheetText: const Text("ACCOUNTS"),
            sheetChildrenTextList: [
              Text("u/${settingsModel.userName}"),
              const Text("Anonymous browsing"), //to be changed
              const Text("Add account"),
            ],
            sheetChildrenIconList: const [
              Icon(Icons.person),
              Icon(Icons.device_unknown_outlined),
              Icon(Icons.add),
            ], //todo replace with service list
          ),
          InkWell(
            onTap: (settingsModel.hasPassword!)
                ? () => showMakePasswordFirstDialogue(
                    context, "change your email address")
                : () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider(
                            create: (_) => SettingsViewModelMobileController(),
                            child: UpdateEmailAddress(),
                          ),
                        ));
                  },
            child: ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Update email address"),
              trailing: const Icon(Icons.arrow_forward_rounded),
              subtitle: Text(currentUser.email!),
            ),
          ),
          InkWell(
            onTap: (settingsModel.hasPassword!)
                ? () => showMakePasswordFirstDialogue(
                    context, "change your password")
                : () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider(
                            create: (_) => SettingsViewModelMobileController(),
                            child: ChangePasswordScreen(),
                          ),
                        ));
                  },
            child: const ListTile(
              leading: Icon(Icons.settings),
              title: Text("Change password"),
              trailing: Icon(Icons.arrow_forward_rounded),
            ),
          ),
          SettingsLabel(title: "CONNECTED ACCOUNTS"),
          ListTile(
            leading: const Icon(Icons.g_mobiledata_rounded),
            title: const Text("Google"),
            subtitle: Text(settingsModel.accountMail!),
            trailing: TextButton(
              onPressed: () => (!settingsModel.hasPassword!)
                  ? Provider.of<SettingsViewModelMobileController>(context,
                          listen: false)
                      .toggleConnectedToGoogle()
                  : showMakePasswordFirstDialogue(
                      context, "disconnect your Google account"),
              child: Text(connectDisconnectGoogle,
                  style: const TextStyle(color: Colors.blue)),
            ),
          ),
          SettingsLabel(title: "CONTACT SETTINGS"),
          InkWell(
            child: const ListTile(
              leading: Icon(Icons.email),
              title: Text("Manage emails"),
              trailing: Icon(Icons.arrow_forward_rounded),
            ),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider(
                    create: (_) => SettingsViewModelMobileController(),
                    child: const ManageEmailsScreen(),
                  ),
                )),
          ),
          SettingsLabel(title: "BLOCKING AND PERMISSIONS"),
          ListTileCustom(
            ico: const Icon(Icons.person_pin),
            text: "Allow people to follow you",
            enble: true,
            subtitle:
                "Followers will be notified about posts you make to your profile and see them in their home feed.",
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: false)
                .allowToFollow,
            onTap: (_) {
              Provider.of<SettingsViewModelMobileController>(context,
                      listen: false)
                  .toggleAllowToFollow();
            },
          ),
          ListTileCustom(
            ico: const Icon(Icons.chat),
            text: "Allow chat requests",
            enble: true,
            subtitle: "",
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: false)
                .allowChatRequests,
            onTap: (_) {
              Provider.of<SettingsViewModelMobileController>(context,
                      listen: false)
                  .toggleAllowChatRequests();
            },
          ),
          ListTileCustom(
            ico: const Icon(Icons.email_outlined),
            text: "Allow direct messages",
            enble: true,
            subtitle:
                "Heads up - This setting doesnt apply to Reddit admins and moderators of communities you've joined.",
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: false)
                .allowDirectMessages,
            onTap: (_) {
              Provider.of<SettingsViewModelMobileController>(context,
                      listen: false)
                  .toggleAllowDirectMessages();
            },
          ),
        ],
      ),
    );
  }
}
