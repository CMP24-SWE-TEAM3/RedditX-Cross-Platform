import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';
import 'package:provider/provider.dart';
import '../../../controllers/community_controller.dart';
import '../../../controllers/community_model_controller.dart';
import '../../../controllers/profile_controller.dart';
import '../../../methods/community/default_bottom_sheet.dart';
import '../../../methods/community/show_leave_community_dialog.dart';
import '../../../methods/community/show_snack_bar.dart';
import '../../../models/community_model.dart';
import '../../../models/post_model.dart';
import '../../../styles/colors.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../styles/custom_icons.dart';
import '../../widgets/community/mobile_post_card.dart';
import '../../widgets/community/mobile_post_classic.dart';

/// Community mobile screen
class ProfileMobileScreen extends StatelessWidget {
  /// Constrains to handle respositivity
  final BoxConstraints constraints;

  /// Context used in [defaultBottomSheet] and others
  final BuildContext context;

  /// Community mobile screen constructor
  const ProfileMobileScreen({
    super.key,
    required this.context,
    required this.constraints,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProfileProvider>(
        builder: (context, value, child) => NestedScrollView(
          body: DefaultTabController(
              length: 3,
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
                    if (value.tabIndex == 0)
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: postsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return MobilePostClassic(
                              postType: postsList[index]['type'],
                              context: context,
                              postPlace: "community",
                              index: index,
                            );
                          },
                        ),
                      ),
                  if (value.tabIndex == 1)
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: postsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text("cmments");
                        },
                      ),
                    ),
                  if (value.tabIndex == 2)
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: postsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text("about");
                        },
                      ),
                    )
                ],
              )),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              Consumer<CommunityProvider>(
                builder: (context, value, child) => SliverAppBar(
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
                        onPressed: () {},
                        icon: const Icon(Icons.share_outlined))
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
                        padding: const EdgeInsets.only(
                            top: 100, left: 20, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: () {},
                                child: const CircleAvatar(
                                  radius: 70,
                                  backgroundColor: Colors.blue,
                                  backgroundImage: NetworkImage(
                                      "https://i.pinimg.com/564x/6f/29/00/6f290029bc26b8ead13bf3ad311acc03.jpg"),
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
                            const Text(
                              "Heba_Ashraf",
                              style: TextStyle(
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
                                  children: const [
                                    Text(
                                      "1 follower",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
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
                              children: const [
                                Text(
                                  "u/Heba_Ashraf ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "· 1m ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "· 2 karma ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "· Oct 8.2022",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )),
                ),
              ),
            ];
          },
        ),
      ),
    );
  }
}
