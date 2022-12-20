import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/add_post_controller.dart';
import '../../../methods/circular_image_widget.dart';
import '../../../models/add_post_model.dart';
import '../../widgets/add_post/community_flairs.dart';
import '../../widgets/add_post/nsfw_spoiler_button.dart';
import '../../widgets/add_post/rules.dart';
import 'add_post_screen_two.dart';

///Arguments of add post third screen
class ScreenThreeArguments {
  ///the selected community
  final CommunityInAddPost communityInAddPost;

  ScreenThreeArguments(this.communityInAddPost);
}

///Third screen in adding post
class AddPostScreenThree extends StatelessWidget {
  const AddPostScreenThree({
    super.key,
  });

  static const routeName = '/addPostScreenThree';
  @override
  Widget build(BuildContext context) {
    ///the arguments passed to the screen
    final args =
        ModalRoute.of(context)!.settings.arguments as ScreenThreeArguments;
    return Scaffold(
      body: Provider.of<AddPostController>(context).isWeb

          ///WEB
          ? Container()

          ///App
          : SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      ///close button that closes that screen
                      IconButton(
                        key: const Key('add_post_screen_3_back'),
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Spacer(),

                      ///Post button that sends the post
                      TextButton(
                        key: const Key('post_button'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              return Colors.blue;
                            },
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            //to make the button RoundedRectangle
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              //Border side Color
                              side: const BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            //if the text is longer(Following and Joined case) ==> make the padding cmaller
                            horizontal: 8.0,
                          ),
                          child: Text(
                            'Post',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Provider.of<AddPostController>(
                            context,
                            listen: false,
                          ).sendPost();
                        },
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),

                      ///When tapping the community name==? open the second screen to select community
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AddPostScreenTwo.routeName,
                            arguments: {},
                          );
                        },
                        child: Row(
                          children: [
                            CircularImageWidget(
                              img: args.communityInAddPost.communityIcon,
                              radius: 30,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              textAlign: TextAlign.right,
                              args.communityInAddPost.communityName,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        key: const Key('rules_button'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              return Colors.white;
                            },
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            //to make the button RoundedRectangle
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              //Border side Color
                              side: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            //if the text is longer(Following and Joined case) ==> make the padding cmaller
                            horizontal: 8.0,
                          ),
                          child: Text(
                            'Rules',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Provider.of<AddPostController>(
                            context,
                            listen: false,
                          ).getCommunityRules(
                            args.communityInAddPost.communityName,
                          );
                          Navigator.of(context)
                              .pushNamed(Rules.routeName, arguments: {});
                        },
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: const [
                      NsfwSpoiler(
                        nsfwOrSpoiler: 'NSFW',
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      NsfwSpoiler(
                        nsfwOrSpoiler: 'Spoiler',
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),

                  ///If there are flairs ==> show them
                  if (flairs.isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        Provider.of<AddPostController>(
                          context,
                          listen: false,
                        ).openFlair(args.communityInAddPost.communityName);
                        Navigator.pushNamed(
                          context,
                          CommunityFlairs.routeName,
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.bookmark),
                          Text(' Add Flair'),
                          Spacer(),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                ],
              ),
            ),
    );
  }
}
