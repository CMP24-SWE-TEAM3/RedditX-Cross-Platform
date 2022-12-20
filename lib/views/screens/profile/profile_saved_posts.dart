import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:search_project/controllers/profile_model_controller.dart';
import 'package:search_project/models/user_model.dart';
import 'package:search_project/services/profile_services.dart';
import 'package:search_project/styles/custom_icons.dart';

import '../../widgets/community/mobile_post_classic.dart';



// ignore: must_be_immutable
class UserSavedPosts extends StatelessWidget {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  UserSavedPosts({super.key});

  Future<void> onRefresh() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 3000));
    await getAPISavedPosts();
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 3000));
    await getAPISavedPosts();
    // if failed,use loadFailed(),if no data return,use LoadNodata()
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Consumer<ProfileModelProvider>(
      builder: (context, value, child) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
              title: const Text(
                "Saved",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            body: (savedPosts.isEmpty)
                ? Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        CustomIcons.reddit,
                        size: 100,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Wow, such empty.")
                    ],
                  ))
                : Column(
                    children: [
                      Expanded(
                        child: SmartRefresher(
                          controller: refreshController,
                          onRefresh: onRefresh,
                          onLoading: onLoading,
                          enablePullDown: true,
                          enablePullUp: true,
                          child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  MobilePostClassic(
                                    postType: savedPosts[index]['type'],
                                    context: context,
                                    postPlace: "profile",
                                    index: index,
                                    posts: savedPosts,
                                    voters: const [],
                                  ),
                              separatorBuilder: (context, index) =>
                                  const Divider(),
                              itemCount: savedPosts.length),
                        ),
                      )
                    ],
                  ));
      },
    ));
  }
}
