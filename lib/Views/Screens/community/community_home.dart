import 'package:flutter/material.dart';

import 'community_home_mobile_screen.dart';
import 'community_home_web_screen.dart';

class CommunityHome extends StatelessWidget {
  const CommunityHome({super.key});
  static const routeName = '/CommunityHome';

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return (constraints.minWidth.round() < 500)
          ? CommunityMobileScreen(context: context, constraints: constraints)
          : CommunityWebScreen(context: context, constraints: constraints);
    }));
  }
}
