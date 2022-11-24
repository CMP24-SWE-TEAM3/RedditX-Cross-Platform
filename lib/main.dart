import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/const.dart';
import 'controllers/mobile_settings_controller.dart';
import 'views/screens/settings/account_setting_screen.dart';
import 'views/screens/settings/setting_menu.dart';
import 'package:reddit/views/screens/settings/change_password_screen.dart';
import 'package:reddit/views/screens/settings/manage_emails.dart';
import 'package:reddit/views/screens/settings/update_email_screen.dart';

void main() {
  runApp(const SettingsMenu());
}

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: white,
      ),
      home: ChangeNotifierProvider(
        create: (_) => SettingsViewModelMobileController(),
        child: const SettingsHomePage(),
      ),
      routes: {
        SettingsHomePage.routeName: (context) => const SettingsHomePage(),
        AccountSettingsScreen.routeName: (context) =>
            const AccountSettingsScreen(),
        ManageEmailsScreen.routeName: (context) => const ManageEmailsScreen(),
        UpdateEmailAddress.routeName: (context) => UpdateEmailAddress(),
        ChangePasswordScreen.routeName: (context) => ChangePasswordScreen(),
      },
    );
  }
}
