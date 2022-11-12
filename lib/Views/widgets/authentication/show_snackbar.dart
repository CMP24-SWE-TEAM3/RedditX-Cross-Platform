import 'package:flutter/material.dart';

void showSnackBar(txt, context) {
  var snackBar = SnackBar(
    content: Text(txt),
    duration: const Duration(milliseconds: 1000),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
