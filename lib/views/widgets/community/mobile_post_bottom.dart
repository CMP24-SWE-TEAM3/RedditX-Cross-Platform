import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';
import 'package:provider/provider.dart';
import 'package:search_project/config/constants.dart';
import 'package:search_project/controllers/profile_model_controller.dart';
import 'package:search_project/models/user_model.dart';
import 'package:search_project/styles/colors.dart';
import '../../../controllers/community_controller.dart';
import '../../../controllers/community_model_controller.dart';
import '../../../methods/community/share_bottom_sheet.dart';

import '../../../styles/custom_icons.dart';

///  Shows the bottom part of mobile post
class BottomPostMobile extends StatelessWidget {
  /// Index of post
  final int index;

  ///Posts
  final List<dynamic> posts;

  /// voters

  final List<dynamic> voters;

  /// Constructor of mobile bottom post widget

  const BottomPostMobile(
      {required this.index,
      required this.posts,
      required this.voters,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<CommunityProvider, CommunityModelProvider,
        ProfileModelProvider>(
      builder: (context, value, value1, value2, child) => Row(
        children: [
          Expanded(
            child: IconButton(
                key: const ValueKey("like_button"),
                onPressed: () {
                  // (profilePostsVotesType[index] == 1)
                  //     ? value2.vote(posts[index]['_id'], -1)
                  //     : value2.vote(posts[index]['_id'], 1);
                },
                icon: (iSMOCK)?const Icon(CustomIcons.upOutline):(profilePostsVotesType[index] == 1)
                    ? const Icon(
                        CustomIcons.upBold,
                        color: Colors.deepOrange,
                      )
                    : const Icon(CustomIcons.upOutline)),
          ),
          Text(
              key: const ValueKey("votes_count"),
              Numeral(posts[index]['votesCount'] ?? 0)
                  .format(fractionDigits: 1)),
          Expanded(
            child: IconButton(
                key: const ValueKey("dislike_button"),
                onPressed: () {
               
                  (profilePostsVotesType[index] == -1)
                      ? value2.vote(posts[index]['_id'], 2)
                      : value2.vote(posts[index]['_id'], -1);
                },
                icon: (iSMOCK)?const Icon(CustomIcons.downOutline):(profilePostsVotesType[index] == -1)
                    ? const Icon(
                        CustomIcons.downBold,
                        color: blueColor,
                      )
                    : const Icon(CustomIcons.downOutline)),
          ),
          Expanded(
            child: IconButton(
                onPressed: () {}, icon: const Icon(CustomIcons.comment)),
          ),
          Text(Numeral(posts[index]['commentsNum'] ?? 0)
              .format(fractionDigits: 1)),
          Expanded(
            child: IconButton(
                key: const ValueKey("share_button"),
                onPressed: () {
                  shareBottomSheet(context, index);
                },
                icon: const Icon(Icons.share_outlined)),
          ),
          const Text("Share"),
          Expanded(
            child: IconButton(
                onPressed: () {}, icon: const Icon(CustomIcons.gift)),
          )
        ],
      ),
    );
  }
}
