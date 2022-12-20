import 'package:flutter/material.dart';

/// Popup menu widget used in mobile and web post page
class PopupMen extends StatelessWidget {
  final List<PopupMenuEntry> MenuList;
  final Widget? icon;

  const PopupMen({Key? key, required this.MenuList, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      key: const ValueKey("post_popUpMenu"),

      constraints: BoxConstraints.expand(
          width: MediaQuery.of(context).size.width * 0.55, height: 350),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: ((context) => MenuList),
      icon: icon,
    );
  }
}
