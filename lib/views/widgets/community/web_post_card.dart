import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:link_preview_generator/link_preview_generator.dart';
import 'package:numeral/numeral.dart';
import 'package:provider/provider.dart';
import 'package:search_project/controllers/profile_controller.dart';

import '../../../config/constants.dart';
import '../../../controllers/community_controller.dart';
import '../../../controllers/community_model_controller.dart';
import '../../../controllers/profile_model_controller.dart';
import '../../../models/post_model.dart';

import '../../../models/user_model.dart';
import '../../../styles/colors.dart';
import '../../../styles/custom_icons.dart';
import '../../screens/profile/profile_page.dart';
import 'web_post_bottom.dart';

/// Shows the  card post view
class WebPostCard extends StatefulWidget {
  /// To determine the view of the top part of the post
  /// As it has different views in home, community and profile
  final String postPlace;

  /// To indicate post type: text, image or link
  final String postType;

  /// To show bottom sheets & pop up menus
  final BuildContext context;

  /// Shows when the post was posted
  final String dateTime;

  /// Shows the user name who posted
  final String userName;

  /// Index of the post
  final int index;

  /// List of posts
  final List<dynamic>posts;

  /// Web post card constructor
  const WebPostCard(
      {super.key,
      required this.posts,
      required this.postType,
      required this.context,
      required this.postPlace,
      required this.dateTime,
      required this.index,
      required this.userName});

  @override
  State<WebPostCard> createState() => _WebPostCardState();
}

class _WebPostCardState extends State<WebPostCard> {
   refresh() {
    @override
    // ignore: unused_element
    void setState(VoidCallback fn) {
      super.setState(fn);

    }
  }
  @override
  Widget build(BuildContext context) {
    return Consumer4<CommunityProvider, CommunityModelProvider,ProfileModelProvider,ProfileProvider>(
      builder: (context, value, value1,value2,value3, child) => InkWell(
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
                              onPressed: () async {
                                await Provider.of<ProfileModelProvider>(context,
                                        listen: false)
                                    .getUserUpVotedPosts(widget.userName);
                                //await value2.getUserUpVotedPosts('t2_lotfy2');
                                ((upvotedPostsIDs.contains(
                                        widget.posts[widget.index]['_id'])))
                                    ? value2.vote(
                                        "t3_${widget.posts[widget.index]['_id']}",
                                        0)
                                    : value2.vote(
                                        "t3_${widget.posts[widget.index]['_id']}",
                                        1);
                                value2.getUserUpVotedPosts(widget.userName);
                                await value2
                                    .getUserUpVotedPosts(widget.userName);
                                refresh();
                              },
                              icon: (iSMOCK)
                                  ? const Icon(CustomIcons.upOutline)
                                  : ((upvotedPostsIDs.contains(
                                          widget.posts[widget.index]['_id'])))
                                      ? const Icon(
                                          CustomIcons.upBold,
                                          color: Colors.deepOrange,
                                        )
                                      : const Icon(CustomIcons.upOutline)),
                          Text(Numeral(
                                  communityPostsList[widget.index]['votesCount'] ?? 0)
                              .format(fractionDigits: 1)),
                          IconButton(
                              onPressed: ()async {
                                await Provider.of<ProfileModelProvider>(context,
                                        listen: false)
                                    .getUserDownVotedPosts(widget.userName);

                                ((downvotedPostsIDs.contains(
                                        widget.posts[widget.index]['_id'])))
                                    ? value2.vote(
                                        "t3_${widget.posts[widget.index]['_id']}",
                                        2)
                                    : value2.vote(
                                        "t3_${widget.posts[widget.index]['_id']}",
                                        -1);
                                await value2
                                    .getUserDownVotedPosts(widget.userName);
                                refresh();
                              },
                               icon: (iSMOCK)
                                  ? const Icon(CustomIcons.downOutline)
                                  : (downvotedPostsIDs.contains(
                                          widget.posts[widget.index]['_id']))
                                      ? const Icon(
                                          CustomIcons.downBold,
                                          color: blueColor,
                                        )
                                      : const Icon(CustomIcons.downOutline)),
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
                                onTap: () async {
                                  await Provider.of<ProfileModelProvider>(
                                          context,
                                          listen: false)
                                      .getProfilePosts(communityPostsList[widget.index]
                                          ['userID']['_id']);

                                  // ignore: use_build_context_synchronously
                                  await Provider.of<ProfileModelProvider>(
                                          context,
                                          listen: false)
                                      .getProfileComments(
                                          communityPostsList[widget.index]['userID']
                                              ['_id']);
                                  // ignore: use_build_context_synchronously
                                  await Provider.of<ProfileModelProvider>(
                                          context,
                                          listen: false)
                                      .getProfileAbout(communityPostsList[widget.index]
                                          ['userID']['_id']);

                                  // ignore: use_build_context_synchronously
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProfilePage(
                                              userID: communityPostsList[widget.index]
                                                  ['userID']['_id'],
                                              context: context)));
                                },
                                child: Text(
                                  "u/${communityPostsList[widget.index]['userID']['_id']}"
                                      .replaceFirst("t2_", ""),
                                  style: const TextStyle(
                                      fontSize: 10.0, color: Colors.grey),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                !iSMOCK
                                    ? "${value.calculateAge(DateTime.parse(communityPostsList[widget.index]['createdAt']))}"
                                    : "${value.calculateAge(communityPostsListMock[widget.index]['createdAt'])}",
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
                                (communityPostsList[widget.index]['type'] == "text")
                                    ? "${communityPostsList[widget.index]['textHTML']}"
                                    : communityPostsList[widget.index]['title'],
                                style: const TextStyle(fontSize: 17.0),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              )),
                        ],
                      )
                    ],
                  ),
                  if (widget.postType == 'linkWithImage')
                    Html(
                      data: communityPostsList[widget.index]['textHTML'] ?? '',
                      shrinkWrap: true,
                      style: {
                        '#': Style(
                            maxLines: 3, textOverflow: TextOverflow.ellipsis)
                      },
                    ),
                  if (communityPostsList[widget.index]['type'] == "image")
                    Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage((communityPostsList[widget.index]
                                              ['attachments']
                                          .length ==
                                      0)
                                  ? "https://i.pinimg.com/564x/07/6b/62/076b62cf375a4d1a009d7e501fd8f451.jpg"
                                  : communityPostsList[widget.index]['attachments']
                                      [0]))),
                    ),
                  if (communityPostsList[widget.index]['type'] == "link")
                    SizedBox(
                      height: 90,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: LinkPreviewGenerator(
                          link: (communityPostsList[widget.index]['attachments']
                                      .length ==
                                  0)
                              ? "https://i.pinimg.com/564x/07/6b/62/076b62cf375a4d1a009d7e501fd8f451.jpg"
                              : communityPostsList[widget.index]['attachments'][0],
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
                  BottomPostWeb(index: widget.index),
                  const SizedBox(
                    height: 7,
                  ),
                ],
              ))),
    );
  }
}
