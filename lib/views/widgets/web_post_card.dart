import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:link_preview_generator/link_preview_generator.dart';
import 'package:provider/provider.dart';
import 'package:reddit/controllers/community_controller.dart';
import 'package:reddit/models/community_model.dart';
import 'package:reddit/views/widgets/web_post_bottom.dart';
import 'package:url_launcher/link.dart';

import '../../methods/show_toast.dart';
import '../../models/post_model.dart';
import '../../styles/custom_icons.dart';

//still working on over flow problems

class WebPostWidget extends StatelessWidget {
  final String postType;
  final BuildContext context;
  final String postPlace;
  final int index;
  final String userName;
  final DateTime dateTime;
  const WebPostWidget(
      {super.key,
      required this.postType,
      required this.context,
      required this.postPlace,
      required this.dateTime,
      required this.index,
      required this.userName});

  @override
  Widget build(BuildContext context) {
    return Consumer<CommunityProvider>(
        builder: (context, value, child) => InkWell(
              onTap: () {},
              child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                          ),
                        ),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Posted by ",
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.grey),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Text(
                                            " u/${postsList[index].username}",
                                            style: const TextStyle(
                                                fontSize: 10.0,
                                                color: Colors.grey),
                                          ),
                                        ),
                                        Consumer<CommunityProvider>(
                                          builder: (context, value, ind) =>
                                              Text(
                                            "    ${value.calculateAge(postsList[index].createdAt)}",
                                            style: TextStyle(
                                                color: Colors.grey[600]),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    // Container(
                                    //   width: 400,
                                    //   child: Text(
                                    //     (postsList[index].type == "text")
                                    //         ? postsList[index].text
                                    //         : postsList[index].title,
                                    //     style: const TextStyle(fontSize: 20.0),
                                    //     maxLines: 3,
                                    //     overflow: TextOverflow.ellipsis,
                                    //   ),
                                    // )
                                    Column(
                                      children: [
                                        ConstrainedBox(
                                            constraints: const BoxConstraints(
                                              minWidth: 300.0,
                                              maxWidth: 480.0,
                                              minHeight: 10.0,
                                              maxHeight: 100.0,
                                            ),
                                            child: Text(
                                              (postsList[index].type == "text")
                                                  ? postsList[index].text
                                                  : postsList[index].title,
                                              style: const TextStyle(
                                                  fontSize: 20.0),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Flexible(
                                  child: Column(
                                children: [
                                  if (postsList[index].type == "image")
                                    Container(
                                      height: 250,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  postsList[index]
                                                      .attachments[0]))),
                                    ),
                                  if (postsList[index].type == "link")
                                    SizedBox(
                                      height: 90,
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 18),
                                        child: LinkPreviewGenerator(
                                          link: postsList[index].attachments[0],
                                          linkPreviewStyle:
                                              LinkPreviewStyle.small,
                                          bodyMaxLines: 1,
                                          bodyTextOverflow:
                                              TextOverflow.ellipsis,
                                          showBody: false,
                                        ),
                                      ),
                                    ),
                                  WebPostBottomWidget(index: index),
                                ],
                              )),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ));
  }
}
