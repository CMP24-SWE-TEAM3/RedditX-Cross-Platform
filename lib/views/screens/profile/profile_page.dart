import 'package:flutter/material.dart';
import 'profile_mobile_screen.dart';
import 'profile_web_screen.dart';

class ProfilePage extends StatelessWidget {
  final BuildContext context;
  final String userID;
  const ProfilePage({required this.userID,required this.context, super.key});
  static const routeName = '/ProfilePage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return (constraints.minWidth.round() < 500)
          ? ProfileMobileScreen(
              context: context,
              userID: userID,
            )
          : ProfileWebScreen(
              context: context,
              constraints: constraints,
              userID: userID,
            );
    }));
  }
}
