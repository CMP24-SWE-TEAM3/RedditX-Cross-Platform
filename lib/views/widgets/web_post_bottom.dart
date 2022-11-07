import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit/controllers/community_controller.dart';
import '../../methods/show_toast.dart';
import '../../models/post_model.dart';
import '../../styles/custom_icons.dart';

class WebPostBottomWidget extends StatelessWidget {
  final int index;
  const WebPostBottomWidget({required this.index,super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CommunityProvider>(
      builder: (context, value, child) => Row(
        children: [
          Expanded(
              child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    value.likePost(index);
                  },
                  icon: (value.isPostLiked[index])
                      ? const Icon(
                          CustomIcons.up_bold,
                          color: Colors.deepOrange,
                        )
                      : const Icon(CustomIcons.up_outline)),
              Text("${postsList[index].votesCount}"),
              IconButton(
                  onPressed: () {
                    value.disLikePost(index);
                  },
                  icon: (value.isPostDisliked[index])
                      ? const Icon(
                          CustomIcons.down_bold,
                          color: Colors.blue,
                        )
                      : const Icon(CustomIcons.down_outline)),
            ],
          )),
          Expanded(
            child: Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(CustomIcons.comment)),
                const Text("60"),
              ],
            ),
          ),
          // Expanded(
          //   child: Row(
          //     children: [
          //       IconButton(
          //           onPressed: () {}, icon: const Icon(CustomIcons.gift)),
          //       Text("Awards")
          //     ],
          //   ),
          // ),
          Expanded(
              child: Row(
            children: [
              PopupMenuButton(
                child: const Icon(Icons.share_outlined),
                itemBuilder: (_) => <PopupMenuItem<String>>[
                  PopupMenuItem<String>(
                      value: "Copy link",
                      child: Row(
                        children: const [
                          Icon(CustomIcons.content_copy),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Copy link")
                        ],
                      )),
                ],
                onSelected: (String val) {
                  showToast("Link copied");
                },
              ),
              const Text("Share"),
            ],
          )),
          Consumer<CommunityProvider>(
            builder: (context, value, child) => Expanded(
                child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    value.saveUnsavePost();
                    (value.isPostSaved)
                        ? showToast("Post saved!")
                        : showToast("Post unsaved");
                  },
                  icon: (value.isPostSaved)
                      ? const Icon(CustomIcons.unsaved)
                      : const Icon(CustomIcons.saved),
                ),
                (value.isPostSaved) ? const Text("Unsave") : const Text("Save")
              ],
            )),
          ),
          Expanded(
              child: Row(
            children: [
              PopupMenuButton(
                child: const Icon(Icons.more_vert),
                itemBuilder: (_) => <PopupMenuItem<String>>[
                  PopupMenuItem<String>(
                      value: "Hide",
                      child: Row(
                        children: const [
                          Icon(Icons.visibility_off_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Hide")
                        ],
                      )),
                  PopupMenuItem<String>(
                      value: "Report",
                      child: Row(
                        children: const [
                          Icon(Icons.flag),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Report")
                        ],
                      )),
                ],
                onSelected: (String val) {},
              ),
            ],
          )),
        ],
      ),
    );
  }
}
