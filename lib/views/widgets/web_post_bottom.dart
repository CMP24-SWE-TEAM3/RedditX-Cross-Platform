import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';
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
        builder: (context, value, child) => Padding(
              padding: const EdgeInsets.only(right: 220, left: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            CustomIcons.comment,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(Numeral(postsList[index].commentsNumber)
                              .format(fractionDigits: 1)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: InkWell(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        PopupMenuButton(
                          child: const Icon(
                            Icons.share_outlined,
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
                    ),
                  )),
                  Consumer<CommunityProvider>(
                    builder: (context, value, child) => Expanded(
                        child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              value.saveUnsavePost(index);
                              (value.isPostSaved[index])
                                  ? showToast("Post saved!")
                                  : showToast("Post unsaved");
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                (value.isPostSaved[index])
                                    ? const Icon(
                                        CustomIcons.unsaved,
                                      )
                                    : const Icon(
                                        CustomIcons.saved,
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PopupMenuButton(
                        child: const Icon(
                          Icons.more_vert,
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
                  )
                ],
              ),
            ));
  }
}
