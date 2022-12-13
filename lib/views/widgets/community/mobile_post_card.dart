import 'package:float_column/float_column.dart';
import 'package:flutter/material.dart';
import 'package:link_preview_generator/link_preview_generator.dart';
import 'package:provider/provider.dart';

import '../../../config/constants.dart';
import '../../../controllers/community_controller.dart';
import '../../../methods/community/show_profile_dialog.dart';
import '../../../models/post_model.dart';
import '../../../styles/colors.dart';
import 'mobile_post_bottom.dart';
import 'pop_up_menu_button.dart';

/// Shows the card post view
class MobilePostCard extends StatelessWidget {
  /// To indicate post type: text, image or link
  final String postType;

  /// Index of the post
  final int index;

  /// Post card constructor
  const MobilePostCard(
      {required this.index, required this.postType, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      InkWell(
                        key: const ValueKey("username_button"),
                        onTap: () {
                          showeProfileDialog(context, index);
                        },
                        child: Text(
                          (!iSMOCK)
                              ? "u/${postsList[index]['userID']['_id']}"
                                  .replaceFirst("t2_", "")
                              : "u/${postsList[index]['userID'].userID}"
                                  .replaceFirst("t2_", ""),
                          style: TextStyle(
                              color: communityPostsGrey, fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Consumer<CommunityProvider>(
                        builder: (context, value, child) => Text(
                          !iSMOCK
                              ? "${value.calculateAge(DateTime.parse(postsList[index]['createdAt']))}"
                              : "${value.calculateAge(postsListMock[index].createdAt!)}",
                          // "  ${value.calculateAge(iSMOCK?postsList[index].createdAt: postsList[index]['createdAt']!)}",
                          style: TextStyle(
                              color: communityPostsGrey, fontSize: 15),
                        ),
                      ),
                      if (postType == 'img')
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "  · i.redd.it",
                            style: TextStyle(
                                color: communityPostsGrey, fontSize: 15),
                          ),
                        ),
                      if (postType == "text") const Spacer(),
                      PopUpMenu(index: index),
                    ],
                  ),
                  if (postType == "text")
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Text(
                        postsList[index]['title']!,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  else
                    FloatColumn(
                      children: [
                        Floatable(
                            float: FCFloat.end,
                            padding: (postType == 'img')
                                ? const EdgeInsets.only(left: 8, right: 8)
                                : const EdgeInsets.only(left: 0),
                            child: (postType == 'link')
                                ? SizedBox(
                                    height: 90,
                                    width: 150,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18),
                                      child: LinkPreviewGenerator(
                                        link: postsList[index]['attachments']
                                            [0],
                                        linkPreviewStyle:
                                            LinkPreviewStyle.small,
                                        bodyMaxLines: 1,
                                        bodyTextOverflow: TextOverflow.ellipsis,
                                        showBody: false,
                                      ),
                                    ),
                                  )
                                : (postType == 'img')
                                    ? Container(
                                        height: 90,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    postsList[index]
                                                        ['attachments'][0]))),
                                      )
                                    : const SizedBox(height: 20)),
                        WrappableText(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 9,
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            text: TextSpan(text: postsList[index]['title']))
                      ],
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: BottomPostMobile(
                index: index,
              ),
            ),
             const Divider()
          ],
        ),
      ),
    );
  }
}
