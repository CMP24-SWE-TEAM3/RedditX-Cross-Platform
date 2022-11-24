import 'package:flutter/material.dart';

import '../../styles/custom_icons.dart';


void showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      elevation: 10.0,
      backgroundColor: Colors.white,
      duration: const Duration(seconds: 3),
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(CustomIcons.reddit),
          const SizedBox(
            width: 7,
          ),
          Text(
            msg,
            style: const TextStyle(color: Colors.black),
          )
        ],
      )));
}
