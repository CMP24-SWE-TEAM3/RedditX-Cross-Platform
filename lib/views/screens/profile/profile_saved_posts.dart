import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../controllers/profile_model_controller.dart';
import '../../../models/user_model.dart';
import '../../../services/profile_services.dart';
import '../../../styles/custom_icons.dart';

import '../../widgets/community/mobile_post_classic.dart';



// ignore: must_be_immutable
class UserSavedPosts extends StatelessWidget {
    /// user name
  final String userName;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  UserSavedPosts({required this.userName,super.key});

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
                                    userName: userName,
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
