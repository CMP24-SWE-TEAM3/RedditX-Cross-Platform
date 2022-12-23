import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';
import 'package:provider/provider.dart';

import '../../../config/constants.dart';
import '../../../controllers/community_controller.dart';
import '../../../controllers/community_model_controller.dart';
import '../../../controllers/profile_controller.dart';
import '../../../controllers/profile_model_controller.dart';
import '../../../methods/community/share_bottom_sheet.dart';

import '../../../models/user_model.dart';
import '../../../styles/colors.dart';
import '../../../styles/custom_icons.dart';
import '../../screens/addComment/add_comment.dart';

///  Shows the bottom part of mobile post
class BottomPostMobile extends StatefulWidget {
  /// Index of post
  final int index;

  ///Posts
  final List<dynamic> posts;

  /// voters of post

  final List<dynamic> voters;

  /// String user name
  final String userName;

  /// Constructor of mobile bottom post widget

  const BottomPostMobile(
      {required this.index,
      required this.posts,
      required this.voters,
      required this.userName,
      super.key});

  @override
  State<BottomPostMobile> createState() => _BottomPostMobileState();
}

class _BottomPostMobileState extends State<BottomPostMobile> {
  bool voting = false;

  refresh() {
    @override
    // ignore: unused_element
    void setState(VoidCallback fn) {
      super.setState(fn);
      voting = !voting;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer4<CommunityProvider, CommunityModelProvider,
        ProfileModelProvider, ProfileProvider>(
      builder: (context, value, value1, value2, value3, child) => Row(
        children: [
          Expanded(
            child: IconButton(
                key: const ValueKey("like_button"),
                onPressed: () async {
                  await Provider.of<ProfileModelProvider>(context,
                          listen: false)
                      .getUserUpVotedPosts(widget.userName);
                  //await value2.getUserUpVotedPosts('t2_lotfy2');
                  ((upvotedPostsIDs
                          .contains(widget.posts[widget.index]['_id'])))
                      ? value2.vote(
                          "t3_${widget.posts[widget.index]['_id']}", 0)
                      : value2.vote(
                          "t3_${widget.posts[widget.index]['_id']}", 1);
                  value2.getUserUpVotedPosts(widget.userName);
                  await value2.getUserUpVotedPosts(widget.userName);
                  refresh();
                },
                icon: (iSMOCK)
                    ? const Icon(CustomIcons.upOutline)
                    : ((upvotedPostsIDs
                            .contains(widget.posts[widget.index]['_id'])))
                        ? const Icon(
                            CustomIcons.upBold,
                            color: Colors.deepOrange,
                          )
                        : const Icon(CustomIcons.upOutline)),
          ),
          Text(
              key: const ValueKey("votes_count"),
              Numeral(widget.posts[widget.index]['votesCount'] ?? 0)
                  .format(fractionDigits: 1)),
          Expanded(
            child: IconButton(
                key: const ValueKey("dislike_button"),
                onPressed: () async {
                  await Provider.of<ProfileModelProvider>(context,
                          listen: false)
                      .getUserDownVotedPosts(widget.userName);

                  ((downvotedPostsIDs
                          .contains(widget.posts[widget.index]['_id'])))
                      ? value2.vote(
                          "t3_${widget.posts[widget.index]['_id']}", 2)
                      : value2.vote(
                          "t3_${widget.posts[widget.index]['_id']}", -1);
                  await value2.getUserDownVotedPosts(widget.userName);
                  refresh();
                },
                icon: (iSMOCK)
                    ? const Icon(CustomIcons.downOutline)
                    : (downvotedPostsIDs
                            .contains(widget.posts[widget.index]['_id']))
                        ? const Icon(
                            CustomIcons.downBold,
                            color: blueColor,
                          )
                        : const Icon(CustomIcons.downOutline)),
          ),
          Expanded(
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddComment(
                                widget.posts[widget.index]['_id'],
                              )));
                  // Navigator.of(context)
                  //     .pushNamed(AddComment.routeName, arguments: {});
                },
                icon: const Icon(CustomIcons.comment)),
          ),
          Text(Numeral(widget.posts[widget.index]['commentsNum'] ?? 0)
              .format(fractionDigits: 1)),
          Expanded(
            child: IconButton(
                key: const ValueKey("share_button"),
                onPressed: () {
                  shareBottomSheet(context, widget.index);
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
