import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawersViewModelController with ChangeNotifier {
  bool? onlineStatusControl = false;
  toggleOnlineStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    onlineStatusControl = !onlineStatusControl!;
    prefs.setBool("OnlineStatus", !onlineStatusControl!);
    notifyListeners();
  }
}
