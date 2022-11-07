import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit/controllers/community_controller.dart';
import '../../methods/show_toast.dart';
import '../../models/post_model.dart';
import '../../styles/custom_icons.dart';

class WebPostBottomWidget extends StatelessWidget {
  final int index;
  const WebPostBottomWidget({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CommunityProvider>(
      builder: (context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: InkWell(
              child: Row(
                children: [
                  const Icon(
                    CustomIcons.comment,
                    size: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("${postsList[index].commentsNumber}"),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              PopupMenuButton(
                child: const Icon(
                  Icons.share_outlined,
                  size: 15,
                ),
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
                InkWell(
                    onTap: () {
                      value.saveUnsavePost(index);
                      (value.isPostSaved[index])
                          ? showToast("Post saved!")
                          : showToast("Post unsaved");
                    },
                    child: Row(
                      children: [
                        (value.isPostSaved[index])
                            ? const Icon(
                                CustomIcons.unsaved,
                                size: 15,
                              )
                            : const Icon(
                                CustomIcons.saved,
                                size: 15,
                              ),
                        (value.isPostSaved[index])
                            ? const Text(
                                "Unsave",
                                style: TextStyle(fontSize: 12),
                              )
                            : const Text("Save")
                      ],
                    )),
              ],
            )),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Row(
            children: [
              PopupMenuButton(
                child: const Icon(
                  Icons.more_vert,
                  size: 15,
                ),
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
