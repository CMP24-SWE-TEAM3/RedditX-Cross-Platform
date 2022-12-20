import 'package:flutter/material.dart';

import '../config/constants.dart';

bool mockData = iSMOCK;

class HomeController extends ChangeNotifier {
  String testo = 'hi';
  load() {
    testo = 'load';
    notifyListeners();
  }

  refresh() {
    testo = 'refresh';
    notifyListeners();
  }
}
