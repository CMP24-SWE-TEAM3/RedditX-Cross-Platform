import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';
import 'package:provider/provider.dart';
import 'package:search_project/styles/colors.dart';
import '../../../controllers/community_controller.dart';
import '../../../controllers/community_model_controller.dart';
import '../../../methods/community/share_bottom_sheet.dart';
import '../../../models/post_model.dart';
import '../../../styles/custom_icons.dart';

///  Shows the bottom part of mobile post
class BottomPostMobile extends StatelessWidget {
  /// Index of post
  final int index;

  /// Constructor of mobile bottom post widget
  const BottomPostMobile({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<CommunityProvider, CommunityModelProvider>(
      builder: (context, value, value1, child) => Row(
        children: [
          Expanded(
            child: IconButton(
                key: const ValueKey("like_button"),
                onPressed: () {
                  value1.vote("", 1, index, context);
                  //value.likePost(index);
                },
                icon: (false
                    //value.isPostLiked[index]
                    )
                    ? const Icon(
                        CustomIcons.upBold,
                        color: Colors.deepOrange,
                      )
                    : const Icon(CustomIcons.upOutline)),
          ),
          Text(
              key: const ValueKey("votes_count"),
              Numeral(communityPostsList[index]['votesCount'] ?? 0)
                  .format(fractionDigits: 1)),
          Expanded(
            child: IconButton(
                key: const ValueKey("dislike_button"),
                onPressed: () {
                  value1.vote("", -1, index, context);
                },
                icon: (false
                    //value.isPostDisliked[index]
                    )
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
          Text(Numeral(communityPostsList[index]['commentsNum'] ?? 0)
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
