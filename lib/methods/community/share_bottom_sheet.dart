import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../controllers/community_controller.dart';
import '../../styles/custom_icons.dart';
import '../../views/widgets/community/share_bottom_sheet_item.dart';
import 'show_toast.dart';



/// Show Bottom Sheet when share button pressed

void shareBottomSheet(BuildContext context, int index) {
  showModalBottomSheet(
    isDismissible: true,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    backgroundColor: Colors.white,
    constraints: const BoxConstraints(maxWidth: 395),
    context: context,
    builder: (context) => Consumer<CommunityProvider>(
        builder: (context, value, child) => Column(
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
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
                          key: const ValueKey("save_button2"),
                          onTap: () {
                            value.saveUnsavePost(index);
                            (value.isPostSaved[index])
                                ? showToast("Post saved!")
                                : showToast("Post unsaved!");
                          },
                          child: ShareBottomSheetItem(
                              circleAvatarColor:
                                  const Color.fromARGB(255, 222, 229, 232),
                              icon: (value.isPostSaved[index])
                                  ? CustomIcons.unsaved
                                  : CustomIcons.saved,
                              text: (value.isPostSaved[index])
                                  ? "Unsave"
                                  : "Save"),
                        ),
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
                                      "https://i.pinimg.com/564x/cd/c8/11/cdc8110b6e2f746ab4c615b69d07dbfe.jpg"),
                                ),
                                SizedBox(height: 10),
                                FittedBox(
                                    fit: BoxFit.contain, child: Text("Profile"))
                              ],
                            )),
                        const ShareBottomSheetItem(
                            circleAvatarColor:
                                Color.fromARGB(255, 222, 229, 232),
                            icon: Icons.double_arrow_sharp,
                            text: "Community")
                      ],
                    ),
                  ],
                ),
              ],
            )),
  );
}
