import 'package:flutter/material.dart';

class SettingsMobileController with ChangeNotifier {
  static List<String> genderTypes = [
    "Male",
    "Female",
    "Prefere not to say",
  ];
  static List<IconData> bottomSheetNotificationsIcons = [
    Icons.notifications_off_outlined,
    Icons.notifications,
    Icons.notifications_active_outlined
  ];
  bool googleAccountConnected = false;
  IconData notificationIcon = Icons.notifications_outlined;
  List<bool> checkIconNotification = [false, true, false];
}
