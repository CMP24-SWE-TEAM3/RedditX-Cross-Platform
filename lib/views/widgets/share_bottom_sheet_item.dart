import 'package:flutter/material.dart';
import 'package:reddit/styles/colors.dart';

/// Shows the item of share bottom sheet
class ShareBottomSheetItem extends StatelessWidget {
  /// Color of circle avatar of item
  final Color circleAvatarColor;

  /// Icon of item
  final IconData icon;

  /// Text of icon
  final String text;

  /// Share bottom sheet item constructor
  const ShareBottomSheetItem({
    super.key,
    required this.circleAvatarColor,
    required this.icon,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: circleAvatarColor,
            child: Icon(
              icon,
              color: (text == "Email" ||
                      text == "Messenger" ||
                      text == "Share Via..." ||
                      text == "Save" ||
                      text == "Unsave" ||
                      text == "Community" ||
                      text == "Copy link")
                  ? Colors.black
                  : whiteColor,
              size: 35,
            ),
          ),
          const SizedBox(height: 10),
          FittedBox(fit: BoxFit.contain, child: Text(text))
        ],
      ),
    );
  }
}
