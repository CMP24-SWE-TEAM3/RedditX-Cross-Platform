import 'package:flutter/material.dart';
import 'package:reddit/views/screens/settings/account_settings_w.dart';

class UserSettingsWeb extends StatelessWidget {
  const UserSettingsWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("User settings"),
          bottom: const TabBar(
            indicatorColor: Colors.blue,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: <Widget>[
              Tab(
                child: Text("Account"),
              ),
              Tab(
                child: Text("Profile"),
              ),
              Tab(
                child: Text("Safety & Privacy"),
              ),
              Tab(
                child: Text("Feed settings"),
              ),
              Tab(
                child: Text("Emails"),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            AccountSettingsWeb(),
            Scaffold(),
            Scaffold(),
            Scaffold(),
            Scaffold(),
          ],
        ),
      ),
    );
  }
}
