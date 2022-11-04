import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reddit/views/screens/community_home_mobile_screen.dart';

checkInternet(bool internetConnection) async {
  try {
    var result = await InternetAddress.lookup("google.com");
    if (result.isNotEmpty || result[0].rawAddress.isNotEmpty) {
      internetConnection = true;
      return true;
    }
  } on SocketException catch (_) {
    internetConnection = false;
    return false;
    
  }
  internetConnection = false;
  return false;
}
