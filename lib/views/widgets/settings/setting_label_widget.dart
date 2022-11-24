import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SettingsLabel extends StatelessWidget {
  SettingsLabel({
    super.key,
    this.title,
  });
  String? title = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
      color: const Color.fromARGB(249, 216, 216, 216),
      child: Row(
        children: [
          Text(
            title!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}