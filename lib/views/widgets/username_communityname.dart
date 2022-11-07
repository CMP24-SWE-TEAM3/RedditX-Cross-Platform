import 'package:flutter/material.dart';

class UserOrCommunityNameText extends StatelessWidget {
  //the text widget that show the username or community name in search
  const UserOrCommunityNameText({
    super.key,
    required this.usernameOrCommunityName,
  });
  //the text to be shown
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
