import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit/controllers/community_controller.dart';
import 'package:reddit/methods/show_toast.dart';

import '../../methods/show_snack_bar.dart';
import '../../styles/custom_icons.dart';

/// Pop up menu 
class PopUpMenu extends StatelessWidget {

  /// Index of post
  final int index;

  /// Pop up menu constructor
  const PopUpMenu({required this.index,super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CommunityProvider>(
      builder: (context, value, child) => PopupMenuButton(
        key: const ValueKey("post_options"),
        child: const Icon(Icons.more_vert),
        itemBuilder: (_) => <PopupMenuItem<String>>[
          PopupMenuItem<String>(
            key: const ValueKey("save_button"),
              onTap: () {
                value.saveUnsavePost(index);
                (value.isPostSaved[index])
                    ?showSnackBar(context,"Post saved!")
                    :showSnackBar(context, "Post unsaved"); 
              },
              value: (value.isPostSaved[index]) ? "Unsave" : "Save",
              child: Row(
                children: [
                  (value.isPostSaved[index])
                      ? const Icon(CustomIcons.unsaved)
                      : const Icon(CustomIcons.saved),
                  const SizedBox(
                    width: 5,
                  ),
                  (value.isPostSaved[index])
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
