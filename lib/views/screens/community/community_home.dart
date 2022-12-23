import 'package:flutter/material.dart';

import 'community_home_mobile_screen.dart';
import 'community_home_web_screen.dart';

// ignore: must_be_immutable
class CommunityHome extends StatelessWidget {
    /// user name
  final String userName;
  /// Posts list
  final List<dynamic>posts;
  CommunityHome({required this.posts,required this.userName, required this.commName, super.key});
  static const routeName = '/CommunityHome';
  String commName;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return (constraints.minWidth.round() < 500)
          ? CommunityMobileScreen(
            userName: userName,
              context: context,
              constraints: constraints,
              communityName: commName,
            )
          : CommunityWebScreen(
            posts: posts,
              context: context,
              constraints: constraints,
              communityName: commName,
            );
    }));
  }
}
