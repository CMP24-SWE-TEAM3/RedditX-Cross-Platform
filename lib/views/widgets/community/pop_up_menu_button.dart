import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_project/controllers/profile_controller.dart';
import 'package:search_project/controllers/profile_model_controller.dart';
import 'package:search_project/models/user_model.dart';
import '../../../controllers/community_controller.dart';
import '../../../methods/community/show_snack_bar.dart';
import '../../../styles/custom_icons.dart';

/// Pop up menu
class PopUpMenu extends StatelessWidget {
  /// Index of post
  final int index;

  /// Posts

  final List<dynamic> posts;

  /// Pop up menu constructor
  const PopUpMenu({required this.index, required this.posts, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<CommunityProvider, ProfileProvider, ProfileModelProvider>(
        builder: (context, value, value2, value3, child) => InkWell(
              onTap: () {
               
              },
              child: PopupMenuButton(
                key: const ValueKey("post_options"),
                child: const Icon(Icons.more_vert),
                itemBuilder: (_) => <PopupMenuItem<String>>[
                  PopupMenuItem<String>(
                      key: const ValueKey("save_button"),
                      onTap: () {
                        ((savedPostsIDs.contains(posts[index]['_id'])))
                            ? value3.unSave(posts[index]['_id'])
                            : value3.save(posts[index]['_id']);
                        (savedPostsIDs.contains(posts[index]['_id']))
                            ? Future.delayed(const Duration(milliseconds: 1000),
                                () {
                                showSnackBar(context, "Post unsaved!");
                              })
                            : Future.delayed(const Duration(milliseconds: 1000),
                                () {
                                showSnackBar(context, "Post saved!");
                              });
                      },
                      value: ((savedPostsIDs.contains(posts[index]['_id'])))
                          ? "Unsave"
                          : "Save",
                      child: Row(
                        children: [
                          (savedPostsIDs.contains(posts[index]['_id']))
                              ? const Icon(CustomIcons.unsaved)
                              : const Icon(CustomIcons.saved),
                          const SizedBox(
                            width: 5,
                          ),
                          (savedPostsIDs.contains(posts[index]['_id']))
                              ? const Text("Unsave")
                              : const Text("Save")
                        ],
                      )),
                  PopupMenuItem<String>(
                      value: "Hide post",
                      child: Row(
                        children: const [
                          Icon(Icons.visibility_off_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Hide post")
                        ],
                      )),
                  PopupMenuItem<String>(
                      value: "Report",
                      child: Row(
                        children: const [
                          Icon(Icons.flag_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Report")
                        ],
                      )),
                  PopupMenuItem<String>(
                      value: "Block account",
                      child: Row(
                        children: const [
                          Icon(Icons.block_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Block account")
                        ],
                      )),
                  PopupMenuItem<String>(
                      value: "Award details",
                      child: Row(
                        children: const [
                          Icon(CustomIcons.award),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Award details")
                        ],
                      )),
                ],
                onSelected: (String val) {},
              ),
            ));
  }
}
