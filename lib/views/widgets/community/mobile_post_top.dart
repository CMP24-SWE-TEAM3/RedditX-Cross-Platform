import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/constants.dart';
import '../../../controllers/community_controller.dart';
import '../../../methods/community/show_profile_dialog.dart';
import '../../../models/post_model.dart';
import 'pop_up_menu_button.dart';

/// Shows the top part of the communnity post
class TopMobilePost extends StatelessWidget {
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

  ///Posts
  final List<dynamic> posts;

  /// Constructor of mobile top post widget
  const TopMobilePost(
      {required this.postPlace,
      required this.postType,
      required this.context,
      required this.dateTime,
      required this.userName,
      required this.index,
      super.key,
      required this.posts});
  @override
  Widget build(BuildContext context) {
    if (postPlace == 'home') {
      return Row(
        children: [
          InkWell(
            radius: 20,
            onTap: () {},
            child: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage('https://api.redditswe22.tech/subreddits/files/${posts[index]['icon']}'),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: Text(
                  posts[index]['userID']['_id'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      showeProfileDialog(context, index);
                    },
                    child: Text(
                      posts[index]['userID']['_id'],
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                  ),
                  Consumer<CommunityProvider>(
                    builder: (context, value, child) => Text(
                      !iSMOCK
                          ? "${value.calculateAge(DateTime.parse(posts[index]['createdAt']))}"
                          : "${value.calculateAge(communityPostsListMock[index]['createdAt'])}",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  if (postType == "image")
                    InkWell(
                      child: Text(
                        "  i.redd.it",
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                    )
                ],
              ),
            ],
          ),
          const Spacer(),
          PopUpMenu(
            index: index,
            posts: posts,
          ),
        ],
      );
    }

    if (postPlace == "community") {
      return Row(
        children: [
          InkWell(
            key: const ValueKey("username_button"),
            onTap: () {
              showeProfileDialog(context, index);
            },
            child: Text(
              "u/${communityPostsList[index]['userID']['_id']}"
                  .replaceFirst("t2_", ""),
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          const Icon(
            Icons.person,
            color: Colors.blue,
          ),
          Consumer<CommunityProvider>(
            builder: (context, value, child) => Text(
              !iSMOCK
                  ? "${value.calculateAge(DateTime.parse(posts[index]['createdAt']))}"
                  : "${value.calculateAge(communityPostsListMock[index]['createdAt'])}",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          if (postType == "image")
            InkWell(
              onTap: () {},
              child: Text(
                "   i.redd.it",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          const Spacer(),
          PopUpMenu(
            index: index,
            posts: posts,
          ),
        ],
      );
    } else {
      return Row(
        children: [
          CircleAvatar(
            radius: 10,
            backgroundImage: NetworkImage('https://api.redditswe22.tech/subreddits/files/${posts[index]['icon']}'),
          ),
          // const SizedBox(
          //   width: 4,
          // ),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Text("${posts[index]['communityID']['_id']}"
                    .replaceAll("t5_", "")),
              ),
              const SizedBox(
                width: 5,
              ),
              const SizedBox(
                width: 5,
              ),
              Consumer<CommunityProvider>(
                builder: (context, value, child) => Text(
                  "${value.calculateAge(DateTime.parse(posts[index]['createdAt']))}",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              if (postType == 'image')
                InkWell(
                  onTap: () {},
                  child: const Text("  i.redd.it"),
                ),
              PopUpMenu(
                index: index,
                posts: posts,
              ),
            ],
          )
        ],
      );
    }
  }
}
