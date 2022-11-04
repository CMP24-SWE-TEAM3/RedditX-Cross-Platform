import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit/controllers/community_controller_mobile.dart';
import '../../methods/share_bottom_sheet.dart';
import '../../styles/custom_icons.dart';

class PostBottomWidget extends StatelessWidget {
  const PostBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MobileCommunityProvider>(
      builder: (context, value, child) => Row(
        children: [
          Expanded(
            child: IconButton(
                onPressed: () {
                  value.likePost();
                },
                icon: (value.isPostLiked)
                    ? const Icon(
                        CustomIcons.up_bold,
                        color: Colors.deepOrange,
                      )
                    : const Icon(CustomIcons.up_outline)),
          ),
          Text("${value.reactsCount}"),
          Expanded(
            child: IconButton(
                onPressed: () {
                  value.disLikePost();
                },
                icon: (value.isPostDisliked)
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
          const Text("60"),
          Expanded(
            child: IconButton(
                onPressed: () {
                  shareBottomSheet(context);
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
