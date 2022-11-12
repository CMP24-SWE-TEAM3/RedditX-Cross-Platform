import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';
import 'package:provider/provider.dart';
import '/controllers/community_controller.dart';
import '/models/post_model.dart';
import '/styles/colors.dart';
import '../../../methods/community/share_bottom_sheet.dart';
import '../../../styles/custom_icons.dart';


///  Shows the bottom part of mobile post
class BottomPostMobile extends StatelessWidget {

  /// Index of post
  final int index;

  /// Constructor of mobile bottom post widget
  const BottomPostMobile({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CommunityProvider>(
      builder: (context, value, child) => Row(
        children: [
          Expanded(
            child: IconButton(
              key: const ValueKey("like_button"),
                onPressed: () {
                  value.likePost(index);
                },
                icon: (value.isPostLiked[index])
                    ? const Icon(
                        CustomIcons.up_bold,
                        color: Colors.deepOrange,
                      )
                    : const Icon(CustomIcons.up_outline)),
          ),
          Text(key:const ValueKey("votes_count"),
            Numeral(postsList[index].votesCount).format(fractionDigits: 1)),
          Expanded(
            child: IconButton(
              key: const ValueKey("dislike_button"),
                onPressed: () {
                  value.disLikePost(index);
                },
                icon: (value.isPostDisliked[index])
                    ? const Icon(
                        CustomIcons.down_bold,
                        color: blueColor,
                      )
                    : const Icon(CustomIcons.down_outline)),
          ),
          Expanded(
            child: IconButton(
                onPressed: () {}, icon: const Icon(CustomIcons.comment)),
          ),
          Text(Numeral(postsList[index].commentsNumber)
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
