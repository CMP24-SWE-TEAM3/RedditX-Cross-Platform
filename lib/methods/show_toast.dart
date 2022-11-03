import "package:flutter/material.dart";
import "package:fluttertoast/fluttertoast.dart";

/// Show Toast message to the user
Future<void> showToast(final String msg) async {
  await Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.black,
      fontSize: 16,
      webPosition: "center");
}
