import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class InternetController extends ChangeNotifier {
  bool _hasInternet = false;
  bool get hasInternet => _hasInternet;

  InternetController() {
    checkInternetConnection();
  }

  Future checkInternetConnection() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _hasInternet = false;
    } else {
      _hasInternet = true;
    }
    notifyListeners();
  }
}
