import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../controllers/home_controller.dart';
import '../../../models/home_model.dart';
import '../../widgets/Home/home_bar_web.dart';
import '../../widgets/community/mobile_post_classic.dart';

class HomeWeb extends StatefulWidget {
  const HomeWeb({super.key});

  @override
  State<HomeWeb> createState() => _HomeWebState();
}

class _HomeWebState extends State<HomeWeb> {
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
      appBar: buildHomeBarWeb('Home'),
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
          child: SizedBox(
            width: 25,
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
              itemCount: homePostsList.length,
            ),
          ),
        ),
      ),
      // endDrawer: rightDrawer(context),
      // drawer: leftDrawer(context),
    );
  }
}
