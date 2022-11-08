import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit/controllers/community_controller.dart';
import 'package:reddit/methods/show_toast.dart';
import 'package:reddit/models/community_model.dart';
import 'package:reddit/models/post_model.dart';
import 'package:reddit/views/widgets/web_app_bar.dart';
import 'package:reddit/views/widgets/web_post_card.dart';

class CommunityWebScreen extends StatelessWidget {
  final BoxConstraints constraints;
  final BuildContext context;
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
                backgroundColor: Colors.white,
                title:
                    WebAppBarTitle(constraints: constraints, context: context)),
            body: Consumer<CommunityProvider>(
              builder: (context, value, child) {
                return Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(communityModel1.banner)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width / 5,
                        ),
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(communityModel1.icon),
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
                              (communityModel1.description.length > 50)
                                  ? communityModel1.name
                                  : communityModel1.description,
                              maxLines: 1,
                              softWrap: true,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              communityModel1.name,
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
                                        border: Border.all(color: Colors.blue),
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
                                                "Successfully left r/aww");
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
                                                      color: Colors.blue),
                                                ),
                                              ))),
                                    )),
                              )
                            : Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(20)),
                                child: InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    onTap: () {
                                      value.joinCommunity();
                                      showToast("Successfully joined r/aww");
                                    },
                                    child: const Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Center(
                                          child: Text(
                                            "     Join     ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ))),
                              ),
                        const SizedBox(
                          width: 10,
                        ),
                        PopupMenuButton(
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 20,
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
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
                    Expanded(
                        child: SingleChildScrollView(
                            child: Container(
                      color: const Color.fromARGB(255, 227, 234, 237),
                      child: Row(
                        children: [
                          if (constraints.minWidth >= 600)
                            Container(
                              color: Colors.red,
                              width: width / 8,
                            ),
                          Column(
                            children: [
                              SizedBox(height: height / 10),
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
                                            color: Colors.white,
                                            child: WebPostCard(
                                              userName:
                                                  postsList[index].username,
                                              index: index,
                                              dateTime:
                                                  postsList[index].createdAt,
                                              context: context,
                                              postPlace: "community",
                                              postType: postsList[index].type,
                                            ));
                                      },
                                    ),
                                  ))
                            ],
                          )
                        ],
                      ),
                    )))
                  ],
                );
              },
            )));
  }
}
