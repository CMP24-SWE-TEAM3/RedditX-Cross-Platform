import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit/Controller/Mobile_settings_controller.dart';
import 'package:reddit/View/screens/manage-emails.dart';
import 'package:reddit/View/screens/update_email_screen.dart';
import 'package:reddit/View/widgets/ListTilesWidgets.dart';
import 'package:reddit/View/widgets/default_buttom_sheet.dart';
import 'package:reddit/View/widgets/settingLabelWidget.dart';
import '../../model/settings_model.dart';
import './change_password_screen.dart';

class accountSettingsScreen extends StatefulWidget {
  const accountSettingsScreen({super.key});
  static const routeName = '/Settings/Account_Settings';
  @override
  State<accountSettingsScreen> createState() => accountStateSettingsScreen();
}

class accountStateSettingsScreen extends State<accountSettingsScreen> {
  bool allowToFollow = false;
  bool allowChatRequests = false;
  bool allowDirectMessages = false;
  bool connectedToGoogleee = false;
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
      body: ChangeNotifierProvider(
        create: (context) => SettingsMobileController(),
        child: ListView(
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
                Navigator.of(context)
                    .pushNamed(UpdateEmailAddress.routeName, arguments: {});
              },
            ),
            InkWell(
              child: const ListTile(
                leading: Icon(Icons.settings),
                title: Text("Change password"),
                trailing: Icon(Icons.arrow_forward_rounded),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushNamed(ChangePasswordScreen.routeName, arguments: {});
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
              trailing: (connectedToGoogleee)
                  ? TextButton(
                      child: const Text("Connect"),
                      onPressed: () {},
                    )
                  : TextButton(
                      child: const Text("Disconnect",
                          style: TextStyle(color: Colors.blue)),
                      onPressed: () {},
                    ),
            ),
            SettingsLabel(title: "CONTACT SETTINGS"),
            InkWell(
              child: const ListTile(
                leading: Icon(Icons.email),
                title: Text("Manage emails"),
                trailing: Icon(Icons.arrow_forward_rounded),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushNamed(manageEmailsScreen.routeName, arguments: {});
              },
            ),

            SettingsLabel(title: "BLOCKING AND PERMISSIONS"),
            const ListTile(
              leading: Icon(Icons.block_flipped),
              title: Text("Manage blocked accounts"),
              trailing: Icon(Icons.arrow_forward_rounded),
            ),
            ListTileCustom(
                ico: const Icon(Icons.person_pin),
                text: "Allow people to follow you",
                subtitle:
                    "Followers will be notified about posts you make to your profile and see them in their home feed.",
                selector: allowToFollow),
            ListTileCustom(
              ico: const Icon(Icons.chat),
              text: "Allow chat requests",
              subtitle: "",
              selector: allowChatRequests,
            ),
            ListTileCustom(
              ico: const Icon(Icons.email_outlined),
              text: "Allow direct messages",
              subtitle:
                  "Heads up - This setting doesnt apply to Reddit admins and moderators of communities you've joined.",
              selector: allowDirectMessages,
            ),
          ],
        ),
      ),
    );
  }
}
