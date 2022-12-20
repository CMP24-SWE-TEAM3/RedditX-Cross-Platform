import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:search_project/controllers/profile_model_controller.dart';
import 'package:search_project/models/user_model.dart';

import 'package:search_project/views/widgets/profile/profile_comment.dart';

import '../../../controllers/community_model_controller.dart';
import '../../../controllers/profile_controller.dart';



import '../../widgets/community/mobile_post_classic.dart';


class ProfileMobileScreen extends StatefulWidget {
  /// Constrains to handle respositivity
  final BoxConstraints constraints;

  /// Context used in [defaultBottomSheet] and others
  final BuildContext context;

  /// User name
  final String userID;

  /// Profile mobile screen constructor
  const ProfileMobileScreen({
    super.key,
    required this.userID,
    required this.context,
    required this.constraints,
  });
  @override
  State<StatefulWidget> createState() {
    return ProfileMobileScreenState();
  }
}

/// Profile mobile screen
class ProfileMobileScreenState extends State<ProfileMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer3<ProfileProvider, CommunityModelProvider,
          ProfileModelProvider>(
        builder: (context, value, value1, value2, child) => NestedScrollView(
          body: DefaultTabController(
              length: 3,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TabBar(
                        onTap: (val) {
                          value.changeTab(val);
                        },
                        labelColor: Colors.black,
                        tabs: const [
                          Tab(
                            text: "Posts",
                          ),
                          Tab(text: "Comments"),
                          Tab(text: "About")
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
                              )
                          ],
                        ),
                      ),
                    if (value.tabIndex == 1)
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            for (int index = 0; index < userProfileComments.length; index++)
                              ProfileComment(index:index),
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
                                      "${userProfileAbout['linkKarma']??5}",
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
                                      "${userProfileAbout['commentKarma']??20}",
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
                      ))
                  ],
                ),
              )),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                elevation: 0,
                primary: false,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                foregroundColor: const Color.fromARGB(255, 194, 193, 193),
                collapsedHeight: 60,
                centerTitle: true,
                floating: true,
                pinned: true,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    )),
                actions: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.share_outlined))
                ],
                expandedHeight: 500,
                //title: const Text('Books'),

                snap: false,
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
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
                                backgroundImage: NetworkImage(
                                    userProfileAbout['avatar'] ?? ""),
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
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "${userProfileAbout['userID']??""}"
                                .replaceFirst("t2_", ""),
                            style: const TextStyle(
                                color: Colors.white,
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
                                    "${userProfileAbout['followerCount']??1} follower",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
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
                                "u/${userProfileAbout['userID']??""} "
                                    .replaceFirst("t2_", ""),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "· 1m ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "· ${userProfileAbout['totalKarma']??23} karma ",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                               (userProfileAbout['createdAt']==null)?"":
                                    "${value.calculateAge(DateTime.parse(userProfileAbout['createdAt']))}",
                                 
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Text(
                            userProfileAbout['about'] ?? "",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                )),
              ),
            ];
          },
        ),
      ),
    );
  }
}
