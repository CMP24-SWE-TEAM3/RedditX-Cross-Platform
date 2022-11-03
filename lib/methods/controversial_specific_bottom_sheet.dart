import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit/controllers/community_controller_mobile.dart';

void showControversialBottomSheet(BuildContext context, String title,
    int itemCount, List<IconData> icons, List<String> options) {
  showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      constraints: const BoxConstraints(maxWidth: 395),
      context: context,
      builder: (BuildContext context) => Padding(
          padding: const EdgeInsets.all(15),
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              ),
              const Divider(),
              Consumer<MobileCommunityProvider>(
                builder: (context, value, child) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: itemCount,
                    itemBuilder: (context, index) => ListTile(
                        tileColor: Colors.white,
                        title: InkWell(
                          onTap: () {
                            value.changeControversialPostsFrom(
                                options[index], index, context);

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
                            ],
                          ),
                        ))),
              )
            ],
          )));
}
