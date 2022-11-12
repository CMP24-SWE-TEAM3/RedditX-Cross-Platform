import 'package:flutter/material.dart';
import 'community_home_mobile_screen.dart';
import 'community_home_web_screen.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});
  static const routeName = '/Community';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return (constraints.minWidth.round() < 500)
            ? CommunityMobileScreen(context: context, constraints: constraints)
            : CommunityWebScreen(context: context, constraints: constraints);
      });
  }
}