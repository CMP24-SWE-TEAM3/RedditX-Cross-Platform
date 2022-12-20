import 'package:flutter/material.dart';

import 'profile_mobile_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  static const routeName = '/ProfilePage';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return ProfileMobileScreen(
            context: context,
            constraints: constraints,
            userID: "t2_hamada",
          );
        });
  }
}