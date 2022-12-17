import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../controllers/mobile_settings_view_controller.dart';
import '../authentication/sign_up_page.dart';
import 'manage_emails.dart';
import 'update_email_screen.dart';
import '../../widgets/settings/list_tiles_widgets.dart';
import '../../widgets/settings/setting_label_widget.dart';
import '../../../../models/settings_model.dart';
import '../../../../models/user_model.dart';
import '../../widgets/settings/make_password_first_dialogue.dart';
import 'change_password_screen.dart';

/// Account Settings screen, holds active account's settings and switches accounts
class AccountSettingsScreen extends StatelessWidget {
  /// Account Settings Screen reoute name
  static const routeName = '/Settings/Account_Settings';
  const AccountSettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
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
            key: const ValueKey('Switch_Accounts_Button'),
            leadingIcon: const Icon(Icons.person_outlined),
            titleText: const Text("Switch Accounts"),
            sheetText: const Text("ACCOUNTS"),
            sheetChildrenTextList: [
              Text("u/${currentUser!.username}"),
              const Text("Add account"),
            ],
            sheetChildrenIconList: const [
              Icon(Icons.person),
              Icon(Icons.add),
            ],
            actionMethods: [
              () => Navigator.pop(context),
              () => Navigator.pushNamed(context, SignUpPage.routeName),
            ],
          ),
          InkWell(
            key: const ValueKey('email_Button'),
            onTap: (!currentUser!.isPasswordSet!)
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
              subtitle: Text(currentUser!.email!),
            ),
          ),
          InkWell(
            key: const ValueKey('Pass_Button'),
            onTap: (!currentUser!.isPasswordSet!)
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
            key: const ValueKey('Google_Button'),
            leading: const Icon(Icons.g_mobiledata_rounded),
            title: const Text("Google"),
            subtitle: Text(currentUser!.email!),
            trailing: TextButton(
              onPressed: () => (currentUser!.isPasswordSet!)
                  ? Provider.of<SettingsViewModelMobileController>(context,
                          listen: false)
                      .toggleConnectedToGoogle()
                  : showMakePasswordFirstDialogue(
                      context, "disconnect your Google account"),
              child: Text(settingsModel.connectedToGoogle!,
                  style: const TextStyle(color: Colors.blue)),
            ),
          ),
          SettingsLabel(title: "CONTACT SETTINGS"),
          InkWell(
            key: const ValueKey('Manage_Button'),
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
            key: const ValueKey('Follow_Button'),
            ico: const Icon(Icons.person_pin),
            text: "Allow people to follow you",
            enble: Future<bool>.value(true),
            subtitle:
                "Followers will be notified about posts you make to your profile and see them in their home feed.",
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("allowToFollow"),
            onTap: (_) {
              Provider.of<SettingsViewModelMobileController>(context,
                      listen: false)
                  .toggleSwitch("allowToFollow", context);
            },
          ),
          ListTileCustom(
            key: const ValueKey('Chat_Button'),
            ico: const Icon(Icons.chat),
            text: "Allow chat requests",
            enble: Future<bool>.value(true),
            subtitle: "",
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("allowChatRequests"),
            onTap: (_) {
              Provider.of<SettingsViewModelMobileController>(context,
                      listen: false)
                  .toggleSwitch("allowChatRequests", context);
            },
          ),
          ListTileCustom(
            key: const ValueKey('Direct_Button'),
            ico: const Icon(Icons.email_outlined),
            text: "Allow direct messages",
            enble: Future<bool>.value(true),
            subtitle:
                "Heads up - This setting doesnt apply to Reddit admins and moderators of communities you've joined.",
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("allowDirectMessages"),
            onTap: (_) {
              Provider.of<SettingsViewModelMobileController>(context,
                      listen: false)
                  .toggleSwitch("allowDirectMessages", context);
            },
          ),
        ],
      ),
    );
  }
}
