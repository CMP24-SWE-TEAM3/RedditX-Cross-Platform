import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reddit/methods/show_toast.dart';
import 'package:reddit/styles/custom_icons.dart';
import 'package:reddit/views/widgets/share_bottom_sheet_item.dart';

void shareBottomSheet(BuildContext context) {
  showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      constraints: const BoxConstraints(maxWidth: 395),
      context: context,
      builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      CustomIcons.reddit,
                      size: 30,
                      color: Colors.deepOrange,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      "Share",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const ShareBottomSheetItem(
                            circleAvatarColor:
                                Color.fromARGB(255, 222, 229, 232),
                            icon: Icons.share_outlined,
                            text: "Share Via..."),
                      ),
                      InkWell(
                        onTap: () {
                          showToast("Link copied successfully");
                        },
                        child: const ShareBottomSheetItem(
                            circleAvatarColor:
                                Color.fromARGB(255, 222, 229, 232),
                            icon: CustomIcons.content_copy,
                            text: "Copy link"),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const ShareBottomSheetItem(
                            circleAvatarColor:
                                Color.fromARGB(255, 222, 229, 232),
                            icon: CustomIcons.saved,
                            text: "Save"),
                      )
                    ],
                  ),
                ],
              ),
              const Divider(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const ShareBottomSheetItem(
                              circleAvatarColor: Colors.green,
                              icon: CustomIcons.whatsapp,
                              text: "WhatsApp"),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const ShareBottomSheetItem(
                              circleAvatarColor:
                                  Color.fromARGB(255, 19, 94, 155),
                              icon: CustomIcons.sms,
                              text: "SMS"),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const ShareBottomSheetItem(
                              circleAvatarColor: Colors.white,
                              icon: Icons.message,
                              text: "Messenger"),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const ShareBottomSheetItem(
                              circleAvatarColor: Colors.yellow,
                              icon: CustomIcons.snapchat,
                              text: "Snapchat"),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const ShareBottomSheetItem(
                              circleAvatarColor:
                                  Color.fromARGB(255, 21, 92, 151),
                              icon: CustomIcons.facebook_squared,
                              text: "Facebook"),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const ShareBottomSheetItem(
                              circleAvatarColor:
                                  Color.fromARGB(255, 160, 44, 158),
                              icon: CustomIcons.instagram,
                              text: "Chats"),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const ShareBottomSheetItem(
                              circleAvatarColor: Colors.white,
                              icon: CustomIcons.mail,
                              text: "Email"),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const ShareBottomSheetItem(
                              circleAvatarColor: Colors.blue,
                              icon: Icons.send,
                              text: "Telegram"),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Column(
                            children: const [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    "https://img.freepik.com/free-vector/romantic-floral-background_53876-89197.jpg?w=1060&t=st=1666372949~exp=1666373549~hmac=ceb57c29aa08ce88b7f2f80aeecfefb86c8399beff83859f981e28f8bb4e6c21"),
                              ),
                              SizedBox(height: 10),
                              FittedBox(
                                  fit: BoxFit.contain, child: Text("Profile"))
                            ],
                          )),
                      const ShareBottomSheetItem(
                          circleAvatarColor: Color.fromARGB(255, 222, 229, 232),
                          icon: Icons.double_arrow_sharp,
                          text: "Community")
                    ],
                  ),
                ],
              ),
            ],
          ));
}
