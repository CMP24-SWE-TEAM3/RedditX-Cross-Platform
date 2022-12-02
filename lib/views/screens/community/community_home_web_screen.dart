import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  /// Community web screen constructor
  const CommunityWebScreen(
      {super.key, required this.context, required this.constraints});
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
                          image: NetworkImage(communityModel1.banner!)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width / 5,
                        ),
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(communityModel1.icon!),
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
                              (communityModel1.description!.length > 50)
                                  ? communityModel1.id!
                                  : communityModel1.description!,
                              maxLines: 1,
                              softWrap: true,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              communityModel1.id!,
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
                                                "Successfully left r/${communityModel1.id}");

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
                                          "Successfully joined r/${communityModel1.id}");
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
                                              value1.getPosts("At5_imagePro235",
                                                  "hot", [], 2, 40);
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
                                              value1.getPosts("At5_imagePro235",
                                                  "new", [], 2, 40);
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
                                              value1.getPosts("At5_imagePro235",
                                                  "top", [], 2, 40);
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
                                        itemCount: postsList.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                              color: whiteColor,
                                              child: WebPostCard(
                                                userName: postsList[index]
                                                    ['userID'],
                                                index: index,
                                                dateTime: postsListMock[index]
                                                    .createdAt!,
                                                context: context,
                                                postPlace: "community",
                                                postType: postsList[index]
                                                    ['type'],
                                              ));
                                        },
                                      ),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ))),
                    if (value.tabIndex == 1) const Text("About"),
                  ],
                );
              },
            )));
  }
}
