import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit/controllers/community_controller_mobile.dart';
import 'package:reddit/methods/show_toast.dart';

import '../../styles/custom_icons.dart';

class PopUpMenu extends StatelessWidget {
  const PopUpMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CommunityProvider>(
      builder: (context, value, child) => PopupMenuButton(
        child: const Icon(Icons.more_vert),
        itemBuilder: (_) => <PopupMenuItem<String>>[
          PopupMenuItem<String>(
              onTap: () {
                value.saveUnsavePost();
                (value.isPostSaved)
                    ? showToast("Post saved!")
                    : showToast("Post unsaved");
              },
              value: (value.isPostSaved) ? "Unsave" : "Save",
              child: Row(
                children: [
                  (value.isPostSaved)
                      ? const Icon(CustomIcons.unsaved)
                      : const Icon(CustomIcons.saved),
                  const SizedBox(
                    width: 5,
                  ),
                  (value.isPostSaved)
                      ? const Text("Unsave")
                      : const Text("Save")
                ],
              )),
          PopupMenuItem<String>(
              value: "Hide post",
              child: Row(
                children: const [
                  Icon(Icons.visibility_off_outlined),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Hide post")
                ],
              )),
          PopupMenuItem<String>(
              value: "Report",
              child: Row(
                children: const [
                  Icon(Icons.flag_outlined),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Report")
                ],
              )),
          PopupMenuItem<String>(
              value: "Block account",
              child: Row(
                children: const [
                  Icon(Icons.block_outlined),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Block account")
                ],
              )),
          PopupMenuItem<String>(
              value: "Award details",
              child: Row(
                children: const [
                  Icon(CustomIcons.award),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Award details")
                ],
              )),
        ],
        onSelected: (String val) {},
      ),
    );
  }
}
