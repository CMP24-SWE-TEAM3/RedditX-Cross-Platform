import 'package:flutter/material.dart';
import 'package:reddit/View/widgets/settingLabelWidget.dart';

class accountSettingsScreen extends StatefulWidget {
  const accountSettingsScreen({super.key});

  @override
  State<accountSettingsScreen> createState() => accountStateSettingsScreen();
}

class accountStateSettingsScreen extends State<accountSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text("Acount Settings"),
      ),
      body: ListView(
        children: [
          SettingsLabel(
            title: "BASIC SETTINGS",
          )
        ],
      ),
    );
  }
}
