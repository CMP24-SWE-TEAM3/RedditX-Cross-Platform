import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';
import 'package:provider/provider.dart';
import '../../../controllers/community_controller.dart';
import '../../../controllers/community_model_controller.dart';
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
class CommunityMobileScreen extends StatelessWidget {
  /// Constrains to handle respositivity
  final BoxConstraints constraints;

  /// Context used in [defaultBottomSheet] and others
  final BuildContext context;

  /// Community mobile screen constructor
  const CommunityMobileScreen({
    super.key,
    required this.context,
    required this.constraints,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer2<CommunityProvider,CommunityModelProvider>(
      builder: (context, value,value1, child) => NestedScrollView(
        body: DefaultTabController(
            length: 2,
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
                      Tab(text: "About")
                    ]),
                if (value.tabIndex == 0)
                  Row(
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
                                3,
                                value.bottomSheetPostSortIcons,
                                [
                                  "Hot",
                                  "New",
                                  "Top",
                                ],
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
                                Text(
                                  value.postSortByType,
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                ),
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
                if (value.tabIndex == 0)
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: postsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return (value.postView == "classic")
                            ? MobilePostClassic(
                                postType:  postsList[index]['type'],
                                context: context,
                                postPlace: "community",
                                index: index,
                              )
                            : MobilePostCard(
                                postType: postsList[index]['type'],
                                index: index,
                              );
                      },
                    ),
                  ),
                if (value.tabIndex == 1)
                  Expanded(
                      child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        color: Colors.red,
                        child: const Text("kjhgf"),
                      ),
                      Container(
                          width: double.infinity,
                          color: Colors.green,
                          child: const Text("kjhgf"))
                    ],
                  ))
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
                  snap: true,
                  pinned: true,
                  expandedHeight: value.expandedHeight,
                  leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.orange,
                      )),
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
                              .withOpacity(0.8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.search,
                                color: whiteColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "r/${communityModel1.id}",
                                style: const TextStyle(
                                    fontSize: 15, color: whiteColor),
                              )
                            ],
                          ),
                        )),
                  ),
                  actions: [
                    PopupMenuButton(
                      key: const ValueKey("community_options_popup_button"),
                      child: const Icon(
                        Icons.more_vert,
                        color: Colors.orange,
                      ),
                      itemBuilder: (_) => <PopupMenuItem<String>>[
                        PopupMenuItem<String>(
                            value: "Share community",
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.share_outlined,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text("Share community")
                              ],
                            )),
                        PopupMenuItem<String>(
                            value: "Add to custom feed",
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text("Add to custom feed")
                              ],
                            )),
                        PopupMenuItem<String>(
                            value: "Community info",
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.info,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text("Community info")
                              ],
                            )),
                        PopupMenuItem<String>(
                            value: "Change user flair",
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.change_circle,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text("Change user flair")
                              ],
                            )),
                        PopupMenuItem<String>(
                            value: "Contact mods",
                            child: Row(
                              children: const [
                                Icon(
                                  CustomIcons.mail,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text("Contact mods")
                              ],
                            )),
                        PopupMenuItem<String>(
                            value: "Add to Home screen",
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text("Add to Home screen")
                              ],
                            )),
                      ],
                      onSelected: (String val) {},
                    ),
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          "https://i.pinimg.com/564x/cd/c8/11/cdc8110b6e2f746ab4c615b69d07dbfe.jpg"),
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
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Image(
                                    fit: BoxFit.cover,
                                    image:
                                        NetworkImage(communityModel1.banner!)),
                              ),
                              Positioned(
                                left: 20,
                                bottom: -20,
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage:
                                      NetworkImage(communityModel1.icon!),
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
                                        Text(
                                          "r/${communityModel1.id}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                        value.joined
                                            ? Row(
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor: blueColor,
                                                    radius: 16,
                                                    child: CircleAvatar(
                                                        backgroundColor:
                                                            whiteColor,
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
                                                            key: const ValueKey(
                                                                "notification_icon"),
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
                                                            color: blueColor),
                                                        color: whiteColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    child: InkWell(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        onTap: () {
                                                          
                                                          showLeaveCommunityDialog(
                                                              context,
                                                              "Are you sure you want to leave the r/Art community?");
                                                        },
                                                        child: const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5),
                                                            child: Center(
                                                              child: Text(
                                                                "Joined",
                                                                style: TextStyle(
                                                                    color:
                                                                        blueColor),
                                                              ),
                                                            ))),
                                                  )
                                                ],
                                              )
                                            : Container(
                                                key: const ValueKey(
                                                    "join_button"),
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: blueColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: InkWell(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    onTap: () {
                                                      
                                                      value.joinCommunity();

                                                      showSnackBar(context,
                                                          "You have joined the r/${communityModel1.id} community");

                                                     
                                                    },
                                                    child: const Padding(
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        child: Center(
                                                          child: Text(
                                                            "   Join   ",
                                                            style: TextStyle(
                                                                color:
                                                                    whiteColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ))),
                                              )
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text(
                                          "${Numeral(communityModel1.membersCnt!).format(fractionDigits: 1)} members",
                                          style: const TextStyle(
                                              color: communityInfoGrey),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          "1,374 online",
                                          style: TextStyle(
                                              color: communityInfoGrey),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Expanded(
                                      key: const ValueKey(
                                          "expanded_discription"),
                                      child: InkWell(
                                        onTap: () {
                                          value.changeExpandedHight(
                                              value.isExpanded);
                                        },
                                        child: value.isExpanded
                                            ? AutoSizeText(
                                                communityModel1.description!,
                                              )
                                            : Text(
                                                communityModel1.description!,
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
          ];
        },
      ),
    ));
  }
}
