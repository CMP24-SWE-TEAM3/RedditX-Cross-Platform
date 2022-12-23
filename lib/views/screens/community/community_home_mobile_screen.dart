import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';
import 'package:provider/provider.dart';
import 'package:search_project/models/user_model.dart';

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
import 'dart:math' as math;

/// Community mobile screen
class CommunityMobileScreen extends StatelessWidget {
  /// Constrains to handle respositivity
  final BoxConstraints constraints;

  /// Context used in [defaultBottomSheet] and others
  final BuildContext context;

  final String communityName;

    /// user name
  final String userName;

  /// Community mobile screen constructor
  const CommunityMobileScreen(
      {
        required this.userName,
        super.key,
      required this.context,
      required this.constraints,
      required this.communityName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<CommunityProvider, CommunityModelProvider>(
        builder: (context, value, value1, child) => NestedScrollView(
          body: DefaultTabController(
              length: 2,
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
                                    "postSortBy",
                                    communityName);
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
                                    "postView",
                                    communityName);
                              },
                              icon: Icon(value.postViewIcon))
                        ],
                      ),
                    if (value.tabIndex == 0)
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            for (int index = 0;
                                index < communityPostsList.length;
                                index++)
                              (value.postView == "classic")
                                  ? MobilePostClassic(
                                    userName: userName,
                                      postType: communityPostsList[index]
                                          ['type'],
                                      context: context,
                                      postPlace: 'community',
                                      index: index,
                                      posts: communityPostsList,
                                      voters: votersCommunity,
                                    )
                                  : MobilePostCard(
                                    userName: userName,
                                      postType: communityPostsList[index]
                                          ['type'],
                                      index: index,
                                      posts: communityPostsList,
                                      voters: votersCommunity,
                                    ),
                          ],
                        ),
                      ),
                    if (value.tabIndex == 1)
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              height: 38,
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    child: Text(
                                      "Moderators",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.mail_outlined,
                                        color: Colors.grey,
                                      ))
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                for (int index = 0;
                                    index < moderators.length;
                                    index++)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          child: Text(
                                              "u/${moderators[index]['userID']}"
                                                  .replaceFirst("t2_", "")),
                                          onTap: () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                SizedBox(
                                  height: 38,
                                  child: Row(
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 10,
                                            bottom: 10),
                                        child: Text(
                                          "Subreddit Rules",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  color:
                                      const Color.fromARGB(255, 225, 223, 223),
                                ),
                                for (int index = 0;
                                    index < communityRules.length;
                                    index++)
                                  ExpandableNotifier(
                                      child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        ScrollOnExpand(
                                          scrollOnExpand: true,
                                          scrollOnCollapse: false,
                                          child: ExpandablePanel(
                                            theme: const ExpandableThemeData(
                                              headerAlignment:
                                                  ExpandablePanelHeaderAlignment
                                                      .center,
                                              tapBodyToCollapse: true,
                                            ),
                                            header: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 0,
                                                    bottom: 0,
                                                    left: 20,
                                                    right: 20),
                                                child: Text(
                                                  "${index + 1}. ${communityRules[index]['title']}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                )),
                                            collapsed: const Text(
                                              "",
                                              softWrap: true,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            expanded: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 10),
                                                    child: Text(
                                                      "${communityRules[index]['description']}",
                                                      softWrap: true,
                                                      overflow:
                                                          TextOverflow.fade,
                                                    )),
                                              ],
                                            ),
                                            builder: (_, collapsed, expanded) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 45,
                                                    right: 45,
                                                    bottom: 0),
                                                child: Expandable(
                                                  collapsed: collapsed,
                                                  expanded: expanded,
                                                  theme:
                                                      const ExpandableThemeData(
                                                          crossFadePoint: 0),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                              ],
                            )
                          ],
                        ),
                      )
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
                                "r/${communityInfo['_id'] ?? ""}"
                                    .replaceFirst("t5_", ""),
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
                                    image: NetworkImage(
                                        communityInfo['banner'] ?? "")),
                              ),
                              Positioned(
                                left: 20,
                                bottom: -20,
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage:
                                      NetworkImage(communityInfo['icon'] ?? ""),
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
                                          "r/${communityInfo['_id'] ?? ""}"
                                              .replaceFirst("t5_", ""),
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
                                                            //value1.getCommunityAbout("t5_imagePro235");
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
                                                                "notifications",
                                                                communityName);
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
                                                              "Are you sure you want to leave the r/${communityInfo['_id']} community?"
                                                                  .replaceFirst(
                                                                      "t5_",
                                                                      ""));
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
                                                          "You have joined the r/${communityInfo['id']} community");
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
                                          (communityInfo['membersCnt'] != null)
                                              ? "${Numeral(communityInfo['membersCnt']).format(fractionDigits: 1)} members"
                                              : "",
                                          style: const TextStyle(
                                              color: communityInfoGrey),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          (communityInfo['membersCnt'] != null)
                                              ? "${math.Random().nextInt(communityInfo['membersCnt']) + 1} online"
                                              : "",
                                          style: const TextStyle(
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
                                                communityInfo['description'] ??
                                                    "",
                                                textAlign: TextAlign.start,
                                              )
                                            : Text(
                                                communityInfo['description'] ??
                                                    "",
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
                                              ),
                                      ),
                                    ),
                                    Expanded(
                                        child: RichText(
                                      key: const Key('post_content'),
                                      text: TextSpan(
                                        children: [
                                          ///Container of the flair text
                                          for (int i = 0;
                                              i < communityFlairs.length;
                                              i++)
                                            WidgetSpan(
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                  left: 5,
                                                ),
                                                padding: const EdgeInsets.all(
                                                  2,
                                                ),
                                                decoration: BoxDecoration(
                                                  ///Random color
                                                  color: Color(
                                                    (math.Random()
                                                                .nextDouble() *
                                                            0xFFFFFF)
                                                        .toInt(),
                                                  ).withOpacity(
                                                    1,
                                                  ),
                                                  //rounded rectangle shape
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                child: Text(
                                                  ///Flair text
                                                  '${communityFlairs[i]['flairText']}',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ))
                                  ],
                                )))
                      ],
                    ),
                  )),
            ];
          },
        ),
      ),
    );
  }
}
