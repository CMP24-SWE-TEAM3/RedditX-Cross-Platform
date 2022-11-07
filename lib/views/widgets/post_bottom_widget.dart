import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit/controllers/community_controller.dart';
import 'package:reddit/models/post_model.dart';
import '../../methods/share_bottom_sheet.dart';
import '../../styles/custom_icons.dart';

class PostBottomWidget extends StatelessWidget {
  final int index;
  const PostBottomWidget({required this.index,super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CommunityProvider>(
      builder: (context, value, child) => Row(
        children: [
          Expanded(
            child: IconButton(
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
          Text("${postsList[index].votesCount}"),
          Expanded(
            child: IconButton(
                onPressed: () {
                  value.disLikePost(index);
                },
                icon: (value.isPostDisliked[index])
                    ? const Icon(
                        CustomIcons.down_bold,
                        color: Colors.blue,
                      )
                    : const Icon(CustomIcons.down_outline)),
          ),
          Expanded(
            child: IconButton(
                onPressed: () {}, icon: const Icon(CustomIcons.comment)),
          ),
          Text("${postsList[index].commentsNumber}"),
          Expanded(
            child: IconButton(
                onPressed: () {
                  shareBottomSheet(context,index);
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
