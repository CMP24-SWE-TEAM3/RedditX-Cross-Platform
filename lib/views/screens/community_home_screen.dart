import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit/methods/default_bottom_sheet.dart';
import 'package:reddit/methods/show_leave_community_dialog.dart';
import 'package:reddit/styles/custom_icons.dart';
import 'package:reddit/views/widgets/post_card_widget.dart';
import 'package:reddit/views/widgets/post_classic_widget.dart';
import '../../controllers/community_controller.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: DefaultTabController(
      length: 2,
      child: CustomScrollView(
        slivers: [
          Consumer<CommunityProvider>(
            builder: (context, value, child) => SliverAppBar(
                elevation: 0,
                primary: false,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                foregroundColor: const Color.fromARGB(255, 194, 193, 193),
                collapsedHeight: 60,
                centerTitle: true,
                floating: true,
                snap: true,
                pinned: true,
                expandedHeight: value.expandedHeight,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                title: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  onTap: () {},
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                        color: const Color.fromARGB(0, 198, 197, 197)
                            .withOpacity(0.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: const [
                            Icon(Icons.search),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "r/Art",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      )),
                ),
                actions: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.more_vert)),
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        "https://img.freepik.com/free-vector/romantic-floral-background_53876-89197.jpg?w=1060&t=st=1666372949~exp=1666373549~hmac=ceb57c29aa08ce88b7f2f80aeecfefb86c8399beff83859f981e28f8bb4e6c21"),
                  ),
                  const SizedBox(
                    width: 15,
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 150,
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.bottomLeft,
                          children: const [
                            SizedBox(
                              width: double.infinity,
                              child: Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://img.freepik.com/free-vector/hand-drawn-floral-wallpaper_52683-67169.jpg?w=1060&t=st=1666378342~exp=1666378942~hmac=17e16de142749acc0d7770d08abefff1c63cad6e6c3ce4320085d7c0ec1a17ad")),
                            ),
                            Positioned(
                              left: 20,
                              bottom: -20,
                              child: CircleAvatar(
                                radius: 35,
                                backgroundImage: NetworkImage(
                                    "https://img.freepik.com/premium-photo/background-texture-red-blossom-roses-red-rose-is-meaning-love-romantic_10585-89.jpg?w=1060"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 35),
                      Expanded(
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "r/Art",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      value.joined
                                          ? Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor: Colors.blue,
                                                  radius: 16,
                                                  child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
                                                      radius: 15,
                                                      child: InkWell(
                                                        onTap: () {
                                                          showDefaultBottomSheet(
                                                              context,
                                                              "COMMUNITY NOTIFICATIONS",
                                                              3,
                                                              value
                                                                  .bottomSheetNotificationsIcons,
                                                              [
                                                                "Off",
                                                                "Low",
                                                                "Frequent"
                                                              ],
                                                              "notifications");
                                                        },
                                                        child: Icon(
                                                          value
                                                              .notificationIcon,
                                                          size: 18,
                                                        ),
                                                      )),
                                                ),
                                                const SizedBox(
                                                  width: 7,
                                                ),
                                                Container(
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.blue),
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      onTap: () {
                                                        showLeaveCommunityDialog(
                                                            context,
                                                            "Are you sure you want to leave the r/Art community?");
                                                      },
                                                      child: const Padding(
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        child: Text(
                                                          "Joined",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.blue),
                                                        ),
                                                      )),
                                                )
                                              ],
                                            )
                                          : Container(
                                              height: 25,
                                              decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  onTap: () {
                                                    value.joinCommunity();
                                                  },
                                                  child: const Padding(
                                                    padding: EdgeInsets.all(5),
                                                    child: Text(
                                                      "   Join   ",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  )),
                                            )
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Text(
                                        "21,493,483 members",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 75, 75, 75)),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "1,374 online",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 75, 75, 75)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        value.changeExpandedHight(
                                            value.isExpanded);
                                      },
                                      child: value.isExpanded
                                          ? const Text(
                                              "This is a subreddit about art, where we are serious about art and artists, and discussing art in mature, substantive way. READ THE RULES AND LOOK AT THE OTHER POSTS BEFORE POSTING. Be on your best behaviour and do not comment unless you have something meaningful and mature to say. We are STRICTLE MODERATED and DO NOT give out warnings.",
                                            )
                                          : const Text(
                                              "This is a subreddit about art, where we are serious about art and artists, and discussing art in mature, substantive way. READ THE RULES AND LOOK AT THE OTHER POSTS BEFORE POSTING. Be on your best behaviour and do not comment unless you have something meaningful and mature to say. We are STRICTLE MODERATED and DO NOT give out warnings.",
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                    ),
                                  )
                                ],
                              )))
                    ],
                  ),
                )),
          ),
          const SliverAppBar(
            pinned: true,
            primary: false,
            elevation: 0,
            backgroundColor: Colors.white,
            title: Align(
              alignment: Alignment.center,
              child:
                  TabBar(labelColor: Colors.black, isScrollable: true, tabs: [
                Tab(
                  text: 'Posts',
                ),
                Tab(
                  text: 'About',
                )
              ]),
            ),
          ),
          Consumer<CommunityProvider>(
            builder: (context, value, child) => SliverToBoxAdapter(
                child: SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                      onTap: () {
                        showDefaultBottomSheet(
                            context,
                            "SORT POSTS BY",
                            5,
                            value.bottomSheetPostSortIcons,
                            ["Hot", "New", "Top", "Controversial", "Rising"],
                            "postSortBy");
                      },
                      child: SizedBox(
                        height: 30,
                        child: Row(
                          children: [
                            Icon(value.postSortByIcon),
                            const SizedBox(
                              width: 5,
                            ),
                            Text("${value.postSortByType} POSTS"),
                            const Icon(Icons.arrow_drop_down_rounded),
                          ],
                        ),
                      )),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        showDefaultBottomSheet(
                            context,
                            "POST VIEW",
                            2,
                            value.bottomSheetPostViewIcons,
                            ["Card", "Classic"],
                            "postView");
                      },
                      icon: Icon(value.postViewIcon))
                ],
              ),
            )),
          ),
          Consumer<CommunityProvider>(
            builder: (context, value, child) => SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
                    tileColor: Colors.white,
                    title: (value.postView == "card")
                        ? PostCardWidget(
                            postType: "link",
                            context: context,
                            postPlace: "home")
                        : const PostClassic(postType: "image")),
                childCount: 10,
              ),
            ),
          )
        ],
      ),
    )));
  }
}
