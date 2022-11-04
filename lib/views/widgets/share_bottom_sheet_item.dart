import 'package:flutter/material.dart';

class ShareBottomSheetItem extends StatelessWidget {
  final Color circleAvatarColor;
  final IconData icon;
  final String text;


  const ShareBottomSheetItem(
      {super.key,
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
                      text == "Copy link")
                  ? Colors.black
                  : Colors.white,
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
