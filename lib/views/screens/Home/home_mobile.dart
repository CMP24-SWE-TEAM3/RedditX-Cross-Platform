import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:search_project/controllers/home_controller.dart';
import 'package:search_project/models/home_model.dart';
// ignore: unused_import
import 'package:search_project/views/screens/temphome.dart';
import 'package:search_project/views/widgets/community/mobile_post_classic.dart';

import '../../widgets/Home/home_bar_mobile.dart';

class HomeMobile extends StatefulWidget {
  HomeMobile({super.key});

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  bool finish = false;

  refresh() {
    @override
    // ignore: unused_element
    void setState(VoidCallback fn) {
      super.setState(fn);
      finish = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHomeBar('Home'),
      body: Consumer<HomeController>(
        builder: (context, value, child) => SmartRefresher(
          controller: refreshController,
          enablePullUp: true,
          onRefresh: () async {
            value.refresh();
            await value.loadPosts();
            refresh();
            refreshController.refreshCompleted();
          },
          onLoading: () async {
            value.load();
            await value.loadPosts();
            refresh();
            refreshController.loadComplete();
          },
          child: ListView.separated(
            key: const ValueKey('list_Home_page'),
            itemBuilder: (context, index) {
              return MobilePostClassic(
                  // ignore: prefer_const_literals_to_create_immutables
                  postType: homePostsList[index]['type'],
                  context: context,
                  postPlace: 'home',
                  index: index,
                  posts: homePostsList,
                  // ignore: prefer_const_literals_to_create_immutables
                  voters: []);
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: 10,
          ),
        ),
      ),
    );
  }
}
