import 'package:flutter/material.dart';

///the Widget that shows the username or community name in search
class UserOrCommunityNameText extends StatelessWidget {
  const UserOrCommunityNameText({
    super.key,
    required this.usernameOrCommunityName,
  });

  ///Text to be shown
  final String usernameOrCommunityName;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.start,
      usernameOrCommunityName,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: Color.fromRGBO(28, 28, 28, 1),
      ),
    );
  }
}
