import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit/controllers/Mobile_settings_controller.dart';
import 'package:reddit/views/Settings/screens/manage-emails.dart';
import 'package:reddit/views/Settings/screens/update_email_screen.dart';
import 'package:reddit/views/Settings/widgets/ListTilesWidgets.dart';
import 'package:reddit/views/Settings/widgets/default_buttom_sheet.dart';
import 'package:reddit/views/Settings/widgets/settingLabelWidget.dart';
import '../../../models/settings_model.dart';
import './change_password_screen.dart';

class AccountSettingsScreen extends StatelessWidget {
  // bool allowToFollow = false;
  // bool allowChatRequests = false;
  // bool allowDirectMessages = false;
  static const routeName = '/Settings/Account_Settings';
  //SettingsMobileController settingsController = SettingsMobileController();
  //bool connectedToGoogleee = false;
  @override
  Widget build(BuildContext context) {
    String connectDisconnectGoogle =
        (Provider.of<SettingsMobileController>(context).connectedToGoogle)
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
            sheetChildrenTextList: const [
              Text("u/USERNAME"),
              Text("Anonymous browsing"), //to be changed
              Text("Add account"),
            ],
            sheetChildrenIconList: const [
              Icon(Icons.person),
              Icon(Icons.device_unknown_outlined),
              Icon(Icons.add),
            ], //to be replaced
          ),
          InkWell(
            child: const ListTile(
              leading: Icon(Icons.settings),
              title: Text("Update email address"),
              trailing: Icon(Icons.arrow_forward_rounded),
              subtitle: Text("email@gmail.com"),

              // onTap: () async => (!hasPassword!)
              //     ? await showDialog<String>(
              //         context: context,
              //         builder: (BuildContext context) => AlertDialog(
              //           title: const Text('Update email address'),
              //           content: const Text(
              //               'To change your email address, you need to create a Reddit password first'),
              //           actions: <Widget>[
              //             ElevatedButton(
              //               onPressed: () => Navigator.pop(context, 'Cancel'),
              //               child: const Text('Cancel'),
              //               style: const ButtonStyle(alignment: Alignment.center),
              //             ),
              //             ElevatedButton(
              //               onPressed: () => Navigator.pop(context, 'OK'),
              //               child: const Text('OK'),
              //               style: const ButtonStyle(alignment: Alignment.center),
              //             ),
              //           ],
              //         ),
              //       )
              //     : () {},
            ),
            onTap: () {
              // Navigator.of(context)
              //     .pushNamed(UpdateEmailAddress.routeName, arguments: {});
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                      create: (_) => SettingsMobileController(),
                      child: UpdateEmailAddress(),
                    ),
                  ));
            },
          ),
          InkWell(
            child: const ListTile(
              leading: Icon(Icons.settings),
              title: Text("Change password"),
              trailing: Icon(Icons.arrow_forward_rounded),
            ),
            onTap: () {
              // Navigator.of(context)
              //     .pushNamed(ChangePasswordScreen.routeName, arguments: {});
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                      create: (_) => SettingsMobileController(),
                      child: ChangePasswordScreen(),
                    ),
                  ));
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.person_outline_sharp),
          //   title: Text("Gender"),
          //   onTap: () => showDefaultBottomSheet(
          //       context,
          //       "GENDER",
          //       3,
          //       SettingsMobileController.bottomSheetNotificationsIconsOutlined,
          //       SettingsMobileController.genderTypes,
          //       "postSortBy"),
          // ),
          SettingsLabel(title: "CONNECTED ACCOUNTS"),
          ListTile(
            leading: const Icon(Icons.g_mobiledata_rounded),
            title: const Text("Google"),
            subtitle: const Text("email@gmail.com"),
            trailing: TextButton(
              onPressed: () =>
                  Provider.of<SettingsMobileController>(context, listen: false)
                      .toggleConnectedToGoogle(),
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
            onTap: () =>
                // Navigator.of(context)
                //     .pushNamed(manageEmailsScreen.routeName, arguments: {});
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (_) => SettingsMobileController(),
                        child: ManageEmailsScreen(),
                      ),
                    )),
          ),

          SettingsLabel(title: "BLOCKING AND PERMISSIONS"),
          // const ListTile(
          //   leading: Icon(Icons.block_flipped),
          //   title: Text("Manage blocked accounts"),
          //   trailing: Icon(Icons.arrow_forward_rounded),
          // ),
          ListTileCustom(
            ico: const Icon(Icons.person_pin),
            text: "Allow people to follow you",
            enble: true,
            subtitle:
                "Followers will be notified about posts you make to your profile and see them in their home feed.",
            selector:
                Provider.of<SettingsMobileController>(context, listen: false)
                    .allowToFollow,
            onTap: (_) {
              Provider.of<SettingsMobileController>(context, listen: false)
                  .toggleAllowToFollow();
            },
          ),

          ListTileCustom(
            ico: const Icon(Icons.chat),
            text: "Allow chat requests",
            enble: true,
            subtitle: "",
            selector:
                Provider.of<SettingsMobileController>(context, listen: false)
                    .allowChatRequests,
            onTap: (_) {
              Provider.of<SettingsMobileController>(context, listen: false)
                  .toggleAllowChatRequests();
            },
          ),

          ListTileCustom(
            ico: const Icon(Icons.email_outlined),
            text: "Allow direct messages",
            enble: true,
            subtitle:
                "Heads up - This setting doesnt apply to Reddit admins and moderators of communities you've joined.",
            selector:
                Provider.of<SettingsMobileController>(context, listen: false)
                    .allowDirectMessages,
            onTap: (_) {
              Provider.of<SettingsMobileController>(context, listen: false)
                  .toggleAllowDirectMessages();
            },
          ),
        ],
      ),
    );
  }
}
