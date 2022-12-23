import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

///  for the check of internet connectivity Class
/// it has fuction checkInternetConnection that changes in the member _hasInternet to know whether there is internet connectivity or not
class InternetController extends ChangeNotifier {
  /// boolean for internet check
  bool _hasInternet = false;
  /// getter for boolean for internet check
  bool get hasInternet => _hasInternet;
  /// constructor for the InternetController
  InternetController() {
    checkInternetConnection();
  }
  /// check the Internet connection Function
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
