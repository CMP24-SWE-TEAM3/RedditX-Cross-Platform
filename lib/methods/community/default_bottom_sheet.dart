import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/community_controller.dart';
import '../../controllers/community_model_controller.dart';



/// Show default bottom sheet
///
/// it shows a bottom sheet of [title],[itemCount],[icons],[options] and [source]

void showDefaultBottomSheet(BuildContext context, String title, int itemCount,
    List<IconData> icons, List<String> options, String source,String communityName) {
  showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      constraints: const BoxConstraints(maxWidth: 395),
      context: context,
      builder: (context) => Padding(
          padding: const EdgeInsets.all(15),
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  key: ValueKey(source),
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              ),
              const Divider(),
              Consumer2<CommunityProvider, CommunityModelProvider>(
                builder: (context, value, value1, child) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: itemCount,
                    itemBuilder: (context, index) => ListTile(
                        key: ValueKey("${source}_$index"),
                        tileColor: Colors.white,
                        title: InkWell(
                          onTap: () {
                            if (source == "notifications") {
                              value.changeNotificationsType(
                                  options[index], index);
                            } else if (source == "postView") {
                              value.changePostView(options[index], index);
                            } else if (source == "postSortBy") {
                              value.changePostSortBy(
                                  options[index], index, context);

                              if (index == 0) {
                                value1.getCommunityPosts(
                                    communityName, "hot", [], 2, 40);
                              } else if (index == 1) {
                                value1.getCommunityPosts(
                                    communityName, "new", [], 2, 40);
                              } else {
                                value1.getCommunityPosts(
                                    communityName, "top", [], 2, 40);
                              }
                            }

                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              Icon(icons[index]),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                options[index],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              if (source == "notifications" &&
                                      value.checkIconNotification[index] ||
                                  source == "postSortBy" &&
                                      value.checkIconPostSortBy[index] ||
                                  source == "postView" &&
                                      value.checkIconPostView[index])
                                const Icon(
                                  key: ValueKey("check_icon"),
                                  Icons.check_outlined,
                                  color: Colors.blue,
                                )
                            ],
                          ),
                        ))),
              )
            ],
          )));
}
