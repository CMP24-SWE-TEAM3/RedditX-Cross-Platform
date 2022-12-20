import 'package:flutter/material.dart';

import 'community_home_mobile_screen.dart';
import 'community_home_web_screen.dart';

class CommunityHome extends StatelessWidget {
  CommunityHome(this.commName, {super.key});
  static const routeName = '/CommunityHome';
  String commName;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return (constraints.minWidth.round() < 500)
          ? CommunityMobileScreen(
              context: context,
              constraints: constraints,
              communityName: commName,
            )
          : CommunityWebScreen(
              context: context,
              constraints: constraints,
              communityName: commName,
            );
    }));
  }
}
