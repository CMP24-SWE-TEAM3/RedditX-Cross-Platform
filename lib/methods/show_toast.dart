import "package:flutter/material.dart";
import "package:fluttertoast/fluttertoast.dart";

/// Show Toast message [msg] to the user
Future<void> showToast(final String msg) async {
  await Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: const Color.fromARGB(255, 195, 118, 85),
      textColor: Colors.black,
      fontSize: 16,
      webPosition: "center");
}
