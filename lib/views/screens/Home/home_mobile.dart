import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:search_project/controllers/home_controller.dart';

import '../../widgets/Home/home_bar_mobile.dart';

class HomeMobile extends StatelessWidget {
  HomeMobile({super.key});

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHomeBar('Home'),
      body: Consumer<HomeController>(
        builder: (context, value, child) => SmartRefresher(
          controller: refreshController,
          enablePullUp: true,
          onRefresh: () {
            value.refresh();
            refreshController.refreshCompleted();
          },
          onLoading: () {
            value.load();
            refreshController.loadComplete();
          },
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('test ${value.testo} $index'),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: 5,
          ),
        ),
      ),
    );
  }
}
