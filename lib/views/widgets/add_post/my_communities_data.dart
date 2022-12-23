import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/add_post_controller.dart';
import '../../../methods/circular_omage_widget.dart';
import '../../../models/add_post_model.dart';
import '../../screens/add_post/add_post_screen_three.dart';

///The data of a vommunity in my communities list while adding post
class CommunityDataAddPost extends StatelessWidget {
  const CommunityDataAddPost({
    super.key,
    required this.communityInAddPost,
  });

  ///the community that will be shown
  final CommunityInAddPost communityInAddPost;

  @override
  Widget build(BuildContext context) {
    ///[GestureDetector] to detect tapping and select the community and go to the next screen
    return GestureDetector(
      onTap: () {
        Provider.of<AddPostController>(
          context,
          listen: false,
        ).setCommunityName(
          communityInAddPost.communityName,
        );

        ///go to the next screen
        Navigator.pushNamed(
          context,
          AddPostScreenThree.routeName,
          arguments: ScreenThreeArguments(
            communityInAddPost,
          ),
        );
      },
      child: Row(
        children: [
          const SizedBox(
            width: 5,
          ),
          CircularImageWidget(
            img: communityInAddPost.communityIcon,
            radius: 30,
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textAlign: TextAlign.right,
                communityInAddPost.communityName,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  ///if the community is [NSFW] ==> show NSFW
                  if (communityInAddPost.nsfw)
                    const Text(
                      'NSFW',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Colors.red,
                      ),
                    ),
                  Text(
                    textAlign: TextAlign.right,
                    communityInAddPost.membersCount > 1000000
                        ? '${double.parse((communityInAddPost.membersCount / 1000000.0).toStringAsFixed(3))}m members . subscribed'
                        : communityInAddPost.membersCount > 1000
                            ? '${communityInAddPost.membersCount / 1000.0}k members . subscribed'
                            : '${communityInAddPost.membersCount} members . subscribed',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color.fromRGBO(124, 124, 124, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
