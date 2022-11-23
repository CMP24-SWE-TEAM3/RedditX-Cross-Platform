import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';
import 'package:provider/provider.dart';
import 'package:reddit/controllers/community_controller.dart';
import 'package:reddit/controllers/community_model_controller.dart';
import 'package:reddit/models/post_model.dart';
import 'package:reddit/styles/colors.dart';
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
    return Consumer2<CommunityProvider,CommunityModelProvider>(
      builder: (context, value,value1, child) => Row(
        children: [
          Expanded(
            child: IconButton(
              key: const ValueKey("like_button"),
                onPressed: () {
                  value1.vote("", 1, index, context);
                  //value.likePost(index);
                },
                icon: (value.isPostLiked[index])
                    ? const Icon(
                        CustomIcons.up_bold,
                        color: Colors.deepOrange,
                      )
                    : const Icon(CustomIcons.up_outline)),
          ),
          Text(key:const ValueKey("votes_count"),
            Numeral(postsList[index].votesCount!).format(fractionDigits: 1)),
          Expanded(
            child: IconButton(
              key: const ValueKey("dislike_button"),
                onPressed: () {
                  
                  value1.vote("", -1, index, context);
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
          Text(Numeral(postsList[index].commentsNum!)
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
