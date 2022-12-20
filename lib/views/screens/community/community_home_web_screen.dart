import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/constants.dart';
import '../../../controllers/community_controller.dart';
import '../../../controllers/community_model_controller.dart';
import '../../../methods/community/show_toast.dart';
import '../../../models/community_model.dart';
import '../../../models/post_model.dart';
import '../../../styles/colors.dart';
import '../../../styles/custom_icons.dart';
import '../../widgets/community/web_app_bar.dart';
import '../../widgets/community/web_post_card.dart';

/// Community web screen
class CommunityWebScreen extends StatelessWidget {
  /// Constrains to handle respositivity
  final BoxConstraints constraints;

  /// Context used in [defaultBottomSheet] and others
  final BuildContext context;

  final String communityName;

  /// Community web screen constructor
  const CommunityWebScreen(
      {super.key,
      required this.context,
      required this.constraints,
      required this.communityName});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
                titleSpacing: 0,
                // centerTitle: false,
                automaticallyImplyLeading: false,
                backgroundColor: whiteColor,
                title:
                    WebAppBarTitle(constraints: constraints, context: context)),
            body: Consumer2<CommunityProvider, CommunityModelProvider>(
              builder: (context, value, value1, child) {
                return Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(communityInfo['banner'] ?? "")),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width / 5,
                        ),
                        CircleAvatar(
                          radius: 35,
                          backgroundImage:
                              NetworkImage(communityInfo['icon'] ?? ""),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Flexible(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              communityInfo['description'] ?? "",
                              maxLines: 1,
                              softWrap: true,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "${communityInfo['_id']}".replaceFirst("t5_", ""),
                              style: const TextStyle(color: Colors.grey),
                            )
                          ],
                        )),
                        const SizedBox(
                          width: 30,
                        ),
                        value.joined
                            ? Consumer<CommunityProvider>(
                                builder: (context, value, child) => Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: blueColor),
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: MouseRegion(
                                      onHover: (val) {
                                        value.joinLeaveButtonOnHover();
                                      },
                                      onExit: (event) {
                                        value.joinLeaveButtonOnExit();
                                      },
                                      child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          onTap: () {
                                            showToast(
                                                "Successfully left r/${communityInfo['_id']}"
                                                    .replaceFirst("t5_", ""));

                                            Provider.of<CommunityProvider>(
                                                    context,
                                                    listen: false)
                                                .unJoinCommunity();
                                          },
                                          child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Center(
                                                child: Text(
                                                  "   ${value.joinLeaveButtonText}  ",
                                                  style: const TextStyle(
                                                      color: blueColor),
                                                ),
                                              ))),
                                    )),
                              )
                            : Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: blueColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    onTap: () {
                                      value.joinCommunity();
                                      showToast(
                                          "Successfully joined r/${communityInfo['_id']}"
                                              .replaceAll("t5_", ""));
                                    },
                                    child: const Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Center(
                                          child: Text(
                                            "     Join     ",
                                            style: TextStyle(
                                                color: whiteColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ))),
                              ),
                        const SizedBox(
                          width: 10,
                        ),
                        PopupMenuButton(
                          child: CircleAvatar(
                            backgroundColor: blueColor,
                            radius: 20,
                            child: CircleAvatar(
                                backgroundColor: whiteColor,
                                radius: 19,
                                child: Icon(
                                  value.notificationIcon,
                                  size: 20,
                                )),
                          ),
                          itemBuilder: (_) => <PopupMenuItem<String>>[
                            PopupMenuItem<String>(
                                value: 'Off',
                                child: Row(
                                  children: [
                                    Icon(
                                        value.bottomSheetNotificationsIcons[0]),
                                    const Text("Off")
                                  ],
                                )),
                            PopupMenuItem<String>(
                                value: 'Low',
                                child: Row(
                                  children: [
                                    Icon(
                                        value.bottomSheetNotificationsIcons[1]),
                                    const Text("Low")
                                  ],
                                )),
                            PopupMenuItem<String>(
                                value: 'Frequent',
                                child: Row(
                                  children: [
                                    Icon(
                                        value.bottomSheetNotificationsIcons[2]),
                                    const Text("Frequent")
                                  ],
                                )),
                          ],
                          onSelected: (String val) {
                            (val == "Off")
                                ? value.changeNotificationsType(val, 0)
                                : (val == "Low")
                                    ? value.changeNotificationsType(val, 1)
                                    : (val == "Frequent")
                                        ? value.changeNotificationsType(val, 2)
                                        : value.changeNotificationsType(val, 0);
                          },
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TabBar(
                        onTap: (val) {
                          value.changeTab(val);
                        },
                        padding:
                            EdgeInsets.only(left: width / 4, right: width / 2),
                        labelPadding: const EdgeInsets.only(right: 0),
                        labelColor: Colors.grey,
                        indicatorColor: Colors.deepOrange,
                        tabs: const [
                          Tab(text: "Posts"),
                          Tab(
                            text: "About",
                          )
                        ]),
                    if (value.tabIndex == 0)
                      Expanded(
                          child: SingleChildScrollView(
                              child: Container(
                        color: webBackGroundColor,
                        child: Row(
                          children: [
                            if (constraints.minWidth >= 600)
                              Container(
                                color: webBackGroundColor,
                                width: width / 8,
                              ),
                            Column(
                              children: [
                                SizedBox(height: height / 20),
                                Container(
                                  height: 50,
                                  width: (constraints.minWidth >= 1250)
                                      ? width / 2.5
                                      : 500,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: whiteColor,
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey, spreadRadius: 1),
                                    ],
                                  ),
                                  child: Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 7, vertical: 5),
                                    child: Row(
                                      children: [
                                        InkWell(
                                            onHover: (val) {
                                              value.sortPostsButtonsOnHover(
                                                  val, 0);
                                            },
                                            onTap: () {
                                              value.changePostSortBy(
                                                  "hot", 0, context);
                                              value1.getCommunityPosts(
                                                  communityName,
                                                  "hot",
                                                  [],
                                                  2,
                                                  40);
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: (value
                                                        .sortPostsButtonsHover[0])
                                                    ? webPostsSortTextColorOnHover
                                                    : whiteColor,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: (value
                                                              .sortPostsButtonsHover[0])
                                                          ? webPostsSortTextColorOnHover
                                                          : whiteColor,
                                                      spreadRadius: 1),
                                                ],
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                      Icons
                                                          .local_fire_department_rounded,
                                                      color: (value
                                                              .checkIconPostSortBy[0])
                                                          ? webPostsSortTextColorBlue
                                                          : webPostsSortTextColorGrey),
                                                  const SizedBox(
                                                    width: 3,
                                                  ),
                                                  Text(
                                                    "Hot",
                                                    style: TextStyle(
                                                        color: (value
                                                                .checkIconPostSortBy[0])
                                                            ? webPostsSortTextColorBlue
                                                            : webPostsSortTextColorGrey),
                                                  )
                                                ],
                                              ),
                                            )),
                                        const SizedBox(
                                          width: 7,
                                        ),
                                        InkWell(
                                            onHover: (val) {
                                              value.sortPostsButtonsOnHover(
                                                  val, 1);
                                            },
                                            onTap: () {
                                              value.changePostSortBy(
                                                  "new", 1, context);
                                              value1.getCommunityPosts(
                                                  communityName,
                                                  "new",
                                                  [],
                                                  2,
                                                  40);
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: (value
                                                        .sortPostsButtonsHover[1])
                                                    ? webPostsSortTextColorOnHover
                                                    : whiteColor,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: (value
                                                              .sortPostsButtonsHover[1])
                                                          ? webPostsSortTextColorOnHover
                                                          : whiteColor,
                                                      spreadRadius: 1),
                                                ],
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                      CustomIcons
                                                          .certificateOutline,
                                                      size: 20,
                                                      color: (value
                                                              .checkIconPostSortBy[1])
                                                          ? webPostsSortTextColorBlue
                                                          : webPostsSortTextColorGrey),
                                                  const SizedBox(
                                                    width: 3,
                                                  ),
                                                  Text(
                                                    "New",
                                                    style: TextStyle(
                                                        color: (value
                                                                .checkIconPostSortBy[1])
                                                            ? webPostsSortTextColorBlue
                                                            : webPostsSortTextColorGrey),
                                                  )
                                                ],
                                              ),
                                            )),
                                        const SizedBox(
                                          width: 7,
                                        ),
                                        InkWell(
                                            onHover: (val) {
                                              value.sortPostsButtonsOnHover(
                                                  val, 2);
                                            },
                                            onTap: () {
                                              value.changePostSortBy(
                                                  "top", 2, context);
                                              value1.getCommunityPosts(
                                                  communityName,
                                                  "top",
                                                  [],
                                                  2,
                                                  40);
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: (value
                                                        .sortPostsButtonsHover[2])
                                                    ? webPostsSortTextColorOnHover
                                                    : whiteColor,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: (value
                                                              .sortPostsButtonsHover[2])
                                                          ? webPostsSortTextColorOnHover
                                                          : whiteColor,
                                                      spreadRadius: 1),
                                                ],
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(CustomIcons.award,
                                                      size: 20,
                                                      color: (value
                                                              .checkIconPostSortBy[2])
                                                          ? webPostsSortTextColorBlue
                                                          : webPostsSortTextColorGrey),
                                                  const SizedBox(
                                                    width: 3,
                                                  ),
                                                  Text(
                                                    "Top",
                                                    style: TextStyle(
                                                      color: (value
                                                              .checkIconPostSortBy[2])
                                                          ? webPostsSortTextColorBlue
                                                          : webPostsSortTextColorGrey,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )),
                                        const Spacer(),
                                      ],
                                    ),
                                  )),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                    width: (constraints.minWidth >= 1250)
                                        ? width / 2.5
                                        : 500,
                                    child: Expanded(
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        separatorBuilder: (context, index) =>
                                            const Divider(),
                                        itemCount: communityPostsList.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                              color: whiteColor,
                                              child: WebPostCard(
                                                userName: (!iSMOCK)
                                                    ? "u/${communityPostsList[index]['userID']['_id']}"
                                                        .replaceFirst("t2_", "")
                                                    : "u/${communityPostsList[index]['userID']['_id']}"
                                                        .replaceFirst(
                                                            "t2_", ""),
                                                index: index,
                                                dateTime: !iSMOCK
                                                    ? "${communityPostsList[index]['createdAt']}"
                                                    : "${communityPostsListMock[index]['createdAt']}",
                                                context: context,
                                                postPlace: "community",
                                                postType:
                                                    communityPostsList[index]
                                                        ['type'],
                                              ));
                                        },
                                      ),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ))),
                    if (value.tabIndex == 1)
                      Expanded(
                          child: SingleChildScrollView(
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
                      ))
                  ],
                );
              },
            )));
  }
}
