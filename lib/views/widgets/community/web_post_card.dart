import 'package:flutter/material.dart';
import 'package:link_preview_generator/link_preview_generator.dart';
import 'package:numeral/numeral.dart';
import 'package:provider/provider.dart';
import 'package:reddit/controllers/community_controller.dart';
import 'package:reddit/controllers/community_model_controller.dart';
import 'package:reddit/models/post_model.dart';
import 'package:reddit/styles/colors.dart';
import 'package:reddit/views/widgets/community/web_post_bottom.dart';

import '../../../styles/custom_icons.dart';


/// Shows the  card post view
class WebPostCard extends StatelessWidget {
  /// To determine the view of the top part of the post
  /// As it has different views in home, community and profile
  final String postPlace;

  /// To indicate post type: text, image or link
  final String postType;

  /// To show bottom sheets & pop up menus
  final BuildContext context;

  /// Shows when the post was posted
  final DateTime dateTime;

  /// Shows the user name who posted
  final String userName;

  /// Index of the post
  final int index;


  /// Web post card constructor
  const WebPostCard(
      {super.key,
      required this.postType,
      required this.context,
      required this.postPlace,
      required this.dateTime,
      required this.index,
      required this.userName});
  @override
  Widget build(BuildContext context) {
    return Consumer2<CommunityProvider,CommunityModelProvider>(
      builder: (context, value,value1, child) => InkWell(
          onTap: () {},
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                value1.vote("", 1, index, context);
                                
                              },
                              icon: (value.isPostLiked[index])
                                  ? const Icon(
                                      CustomIcons.up_bold,
                                      color: Colors.deepOrange,
                                    )
                                  : const Icon(CustomIcons.up_outline)),
                          Text(Numeral(postsList[index].votesCount!)
                              .format(fractionDigits: 1)),
                          IconButton(
                              onPressed: () {
                                value1.vote("", 1, index, context);
                              },
                              icon: (value.isPostDisliked[index])
                                  ? const Icon(
                                      CustomIcons.down_bold,
                                      color: blueColor,
                                    )
                                  : const Icon(CustomIcons.down_outline)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Posted by ",
                                style: TextStyle(
                                    fontSize: 10.0, color: Colors.grey),
                              ),
                              InkWell(
                                 key: const ValueKey("username_button"),
                                onTap: () {},
                                child: Text(
                                  " u/${postsListMock[index].userID}",
                                  style: const TextStyle(
                                      fontSize: 10.0, color: Colors.grey),
                                ),
                              ),
                              Text(
                                "    ${value.calculateAge(postsListMock[index].createdAt!)}",
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                          ConstrainedBox(
                              constraints: const BoxConstraints(
                                minWidth: 300.0,
                                maxWidth: 420.0,
                                minHeight: 10.0,
                                maxHeight: 100.0,
                              ),
                              child: Text(
                                (postsListMock[index].type == "text")
                                    ? postsListMock[index].text!
                                    : postsListMock[index].title!,
                                style: const TextStyle(fontSize: 17.0),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              )),
                        ],
                      )
                    ],
                  ),
                  if (postsListMock[index].type == "image")
                    Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  postsListMock[index].attachments![0]))),
                    ),
                  if (postsListMock[index].type == "link")
                    SizedBox(
                      height: 90,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: LinkPreviewGenerator(
                          link: postsListMock[index].attachments![0],
                          linkPreviewStyle: LinkPreviewStyle.small,
                          bodyMaxLines: 1,
                          bodyTextOverflow: TextOverflow.ellipsis,
                          showBody: false,
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 7,
                  ),
                  BottomPostWeb(index: index),
                  const SizedBox(
                    height: 7,
                  ),
                ],
              ))),
    );
  }
}
