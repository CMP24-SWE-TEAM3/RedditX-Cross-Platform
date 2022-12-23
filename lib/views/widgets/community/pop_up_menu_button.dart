import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/profile_controller.dart';
import '../../../controllers/profile_model_controller.dart';
import '../../../methods/community/show_snack_bar.dart';
import '../../../models/user_model.dart';
import '../../../controllers/community_controller.dart';


import '../../../styles/custom_icons.dart';

/// Pop up menu
class PopUpMenu extends StatefulWidget {
  /// Index of post
  final int index;

  /// Posts

  final List<dynamic> posts;

  /// Pop up menu constructor
  const PopUpMenu({required this.index, required this.posts, super.key});

  @override
  State<PopUpMenu> createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {

    bool voting = true;
    refresh() {
    @override
    // ignore: unused_element
    void setState(VoidCallback fn) {
      super.setState(fn);
      voting = !voting;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Consumer3<CommunityProvider, ProfileProvider, ProfileModelProvider>(
        builder: (context, value, value2, value3, child) => InkWell(
              onTap: () {
                refresh();
               
              },
              child: PopupMenuButton(
                key: const ValueKey("post_options"),
                child: const Icon(Icons.more_vert),
                itemBuilder: (_) => <PopupMenuItem<String>>[
                  PopupMenuItem<String>(
                      key: const ValueKey("save_button"),
                      onTap: () {
                        ((savedPostsIDs.contains(widget.posts[widget.index]['_id'])))
                            ? value3.unSave(widget.posts[widget.index]['_id'])
                            : value3.save(widget.posts[widget.index]['_id']);
                        (savedPostsIDs.contains(widget.posts[widget.index]['_id']))
                            ? Future.delayed(const Duration(milliseconds: 1000),
                                () {
                                showSnackBar(context, "Post unsaved!");
                              })
                            : Future.delayed(const Duration(milliseconds: 1000),
                                () {
                                showSnackBar(context, "Post saved!");
                              });
                              refresh();
                      },
                      value: ((savedPostsIDs.contains(widget.posts[widget.index]['_id'])))
                          ? "Unsave"
                          : "Save",
                      child: Row(
                        children: [
                          (savedPostsIDs.contains(widget.posts[widget.index]['_id']))
                              ? const Icon(CustomIcons.unsaved)
                              : const Icon(CustomIcons.saved),
                          const SizedBox(
                            width: 5,
                          ),
                          (savedPostsIDs.contains(widget.posts[widget.index]['_id']))
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
