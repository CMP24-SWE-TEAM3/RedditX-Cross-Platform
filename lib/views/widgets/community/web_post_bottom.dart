import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';
import 'package:provider/provider.dart';

import '../../../controllers/community_controller.dart';
import '../../../controllers/community_model_controller.dart';
import '../../../methods/community/show_toast.dart';
import '../../../models/post_model.dart';
import '../../../styles/custom_icons.dart';

/// Shows the bottom part of web post
class BottomPostWeb extends StatelessWidget {
  /// Index of the post
  final int index;

  ///Constructor of web bottom post
  const BottomPostWeb({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<CommunityProvider, CommunityModelProvider>(
        builder: (context, value, value1, child) => Padding(
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
                          Text(Numeral(communityPostsList[index]['commentsNum']??0)
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
                                    Icon(CustomIcons.contentCopy),
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
                                (false
                                  //value.isPostSaved[index]
                                  )
                                    ? const Icon(
                                        CustomIcons.unsaved,
                                      )
                                    : const Icon(
                                        CustomIcons.saved,
                                      ),
                                (false
                                  //value.isPostSaved[index]
                                  )
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
