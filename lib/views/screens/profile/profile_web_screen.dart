import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/community_model_controller.dart';
import '../../../controllers/profile_controller.dart';
import '../../../controllers/profile_model_controller.dart';

import '../../../models/user_model.dart';

import '../../widgets/community/mobile_post_classic.dart';

import '../../widgets/profile/profile_comment.dart';

/// Profile web screen
class ProfileWebScreen extends StatelessWidget {
  /// Constrains to handle respositivity
  final BoxConstraints constraints;

  /// Context used in [defaultBottomSheet] and others
  final BuildContext context;

  final String userID;

  /// Profile web screen constructor
  const ProfileWebScreen(
      {super.key,
      required this.constraints,
      required this.context,
      required this.userID});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer3<ProfileProvider, CommunityModelProvider,
              ProfileModelProvider>(
          builder: (context, value, value1, value2, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    height: 500,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://i.pinimg.com/564x/3e/17/ce/3e17ce3b0066de9192f6b01df8ceb40a.jpg"))),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 100, left: 20, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors.blue,
                              backgroundImage: NetworkImage(userProfileAbout[
                                      'avatar'] ??
                                  "https://i.pinimg.com/564x/dc/6b/7d/dc6b7da2bb455dd400fc986e34dfa2f7.jpg"),
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(0, 198, 197, 197)
                                  .withOpacity(0.3),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.white.withOpacity(0.4),
                                    spreadRadius: 3)
                              ],
                              borderRadius: BorderRadius.circular(30)),
                          child: MaterialButton(
                            onPressed: () {},
                            child: const Text(
                              "Edit",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "${userProfileAbout['userID'] ?? "user name"}"
                              .replaceFirst("t2_", ""),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                Text(
                                  "${userProfileAbout['followerCount'] ?? 1} follower",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                  size: 10,
                                )
                              ],
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "u/${userProfileAbout['userID'] ?? "hamada"} "
                                  .replaceFirst("t2_", ""),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "· 1m ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "· ${userProfileAbout['totalKarma'] ?? 23} karma ",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              (userProfileAbout['createdAt'] == null)
                                  ? "3/12/2022"
                                  : "${value.calculateAge(DateTime.parse(userProfileAbout['createdAt']))}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          userProfileAbout['about'] ?? "user about",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              DefaultTabController(
                length: 6,
                child: Column(
                  children: [
                    TabBar(
                        onTap: (val) {
                          value.changeTab(val);
                        },
                        labelColor: Colors.black,
                        tabs: const [
                          Tab(
                            key: ValueKey("posts_tab"),
                            text: "POSTS",
                          ),
                          Tab(key: ValueKey("comments_tab"), text: "COMMENTS"),
                          Tab(key: ValueKey("about_tab"), text: "ABOUT"),
                          Tab(
                            text: 'SAVED',
                          ),
                          Tab(
                            text: 'UPVOTED',
                          ),
                          Tab(
                            text: 'DOWNVOTED',
                          )
                        ]),
                    if (value.tabIndex == 0)
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            for (int index = 0;
                                index < profilePosts.length;
                                index++)
                              MobilePostClassic(
                                postType: profilePosts[index]['type'],
                                context: context,
                                postPlace: "profile",
                                index: index,
                                posts: profilePosts,
                                voters: votersProfile,
                                userName: userID,
                              )
                          ],
                        ),
                      ),
                    if (value.tabIndex == 1)
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            for (int index = 0;
                                index < userProfileComments.length;
                                index++)
                              ProfileComment(index: index),
                          ],
                        ),
                      ),
                    if (value.tabIndex == 2)
                      SingleChildScrollView(
                          child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${userProfileAbout['linkKarma'] ?? 5}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const Text(
                                      'Post Karma',
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 140,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${userProfileAbout['commentKarma'] ?? 20}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const Text(
                                      'Comment Karma',
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                    if (value.tabIndex == 3)
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            for (int index = 0;
                                index < savedPosts.length;
                                index++)
                              MobilePostClassic(
                                postType: savedPosts[index]['type'],
                                context: context,
                                postPlace: "profile",
                                index: index,
                                posts: profilePosts,
                                voters: votersProfile,
                                userName: userID,
                              )
                          ],
                        ),
                      ),
                    if (value.tabIndex == 4)
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            for (int index = 0;
                                index < upvotedPosts.length;
                                index++)
                              MobilePostClassic(
                                postType: upvotedPosts[index]['type'],
                                context: context,
                                postPlace: "profile",
                                index: index,
                                posts: profilePosts,
                                voters: votersProfile,
                                userName: userID,
                              )
                          ],
                        ),
                      ),
                    if (value.tabIndex == 5)
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            for (int index = 0;
                                index < downvotedPosts.length;
                                index++)
                              MobilePostClassic(
                                postType: downvotedPosts[index]['type'],
                                context: context,
                                postPlace: "profile",
                                index: index,
                                posts: profilePosts,
                                voters: votersProfile,
                                userName: userID,
                              )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
