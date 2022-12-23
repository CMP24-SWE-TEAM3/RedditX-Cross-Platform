// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/search_controller.dart';
import '../../widgets/search/drop_down_menu.dart';

///Search results screen
class SearchScreenTwo extends StatelessWidget {
  ///Route for Navigating
  static const routeName = '/SearchScreenTwo';
  const SearchScreenTwo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,

      /// The Builder widget is used to have a different BuildContext to access
      /// closest DefaultTabController.
      child: Builder(
        builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context);

          ///To be called when the the tab changes
          tabController.addListener(
            () {
              if (!tabController.indexIsChanging) {
                ///Detects the tab we are in using the index
                String tab = tabController.index == 0
                    ? 'post'
                    : tabController.index == 1
                        ? 'comment'
                        : tabController.index == 2
                            ? 'sr'
                            : 'user';
                Provider.of<SearchController>(context, listen: false)
                    .changeTab(tab);
              }
            },
          );
          return Scaffold(
            appBar: null,
            body: SafeArea(
              child: Container(
                color: const Color.fromRGBO(135, 138, 140, 0.3),
                child: LayoutBuilder(
                  ///[LayoutBuilder] to be responsive with the size of the screen
                  builder: (context, constraint) => Column(
                    children: [
                      SizedBox(
                        height: constraint.maxHeight * 0.05,
                        child: Row(
                          children: [
                            SizedBox(width: constraint.maxHeight * 0.005),
                            TabBar(
                              labelColor: Colors.black, //selected label
                              unselectedLabelColor: Colors.grey,
                              labelPadding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              isScrollable: true,

                              ///When hover with the mouse
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.hovered)) {
                                    return Colors.white;
                                  }
                                  return null;
                                },
                              ),
                              //when click on it
                              //blue line in App
                              //white rectangularCircle in web
                              indicator:
                                  Provider.of<SearchController>(context).isWeb
                                      ? ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                        )
                                      : const UnderlineTabIndicator(
                                          borderSide: BorderSide(
                                            width: 2.0,
                                            color: Colors.blue,
                                          ),
                                        ),
                              tabs: const [
                                Tab(key: Key('posts_tab'), text: 'Posts'),
                                Tab(key: Key('comments_tab'), text: 'Comments'),
                                Tab(
                                    key: Key('communities_tab'),
                                    text: 'Communities'),
                                Tab(key: Key('people_tab'), text: 'People'),
                              ],
                            ),

                            ///Spacer to place the next widget in the end of the row
                            const Spacer(),

                            ///Safe Search switch appears in web if the user allows NSFW content
                            if (Provider.of<SearchController>(context)
                                    .allowNsfw &&
                                Provider.of<SearchController>(context).isWeb)
                              Row(
                                children: [
                                  const Text(
                                    'Safe Search',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  CupertinoSwitch(
                                    thumbColor: Colors.white,
                                    activeColor: Colors.blue,
                                    trackColor: Colors.grey,
                                    value:
                                        Provider.of<SearchController>(context)
                                            .safeSearch,
                                    onChanged: (val) {
                                      Provider.of<SearchController>(context,
                                              listen: false)
                                          .toggleSafeSearchState();
                                    },
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: constraint.maxHeight * 0.93,
                        child: TabBarView(
                          children: [
                            Container(
                              color: const Color.fromRGBO(135, 138, 140, 0.1),
                              alignment:
                                  (Provider.of<SearchController>(context).isWeb)
                                      ? Alignment.bottomCenter
                                      : Alignment.topCenter,
                              child: SizedBox(
                                width: (Provider.of<SearchController>(context)
                                        .isWeb)
                                    ? constraint.maxWidth * 0.82
                                    : constraint.maxWidth * 1,
                                height: (Provider.of<SearchController>(context)
                                        .isWeb)
                                    ? constraint.maxHeight * 0.85
                                    : constraint.maxHeight * 1,
                                child: ListView(
                                  //WARNING ==> removing shrinkWrap will cause unBounded height runTime exception
                                  //because the column gives unBounded constraints
                                  //shrinkWrap makes the scroll size same as content size
                                  shrinkWrap: true,

                                  ///In the beginning of the list we have sort menu
                                  ///Then we have list of posts
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Sort  ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          ),
                                        ),
                                        DropDownMneu(
                                          key: Key(
                                            'Sort',
                                          ),
                                        ),
                                      ],
                                    ),
                                    //call a function the builds the posts list
                                    ...Provider.of<SearchController>(context)
                                        .buildPostsInSearchListWidget(),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: const Color.fromRGBO(135, 138, 140, 0.1),
                              alignment:
                                  (Provider.of<SearchController>(context).isWeb)
                                      ? Alignment.bottomCenter
                                      : Alignment.topCenter,
                              child: SizedBox(
                                width: (Provider.of<SearchController>(context)
                                        .isWeb)
                                    ? constraint.maxWidth * 0.82
                                    : constraint.maxWidth * 1,
                                height: (Provider.of<SearchController>(context)
                                        .isWeb)
                                    ? constraint.maxHeight * 0.85
                                    : constraint.maxHeight * 1,
                                child: ListView(
                                  //WARNING ==> removing shrinkWrap will cause unBounded height runTime exception
                                  //because the column gives unBounded constraints
                                  //shrinkWrap makes the scroll size same as content size
                                  shrinkWrap: true,
                                  children: [
                                    //call a function the builds the comments list
                                    ...Provider.of<SearchController>(context)
                                        .buildCommentsInSearchListWidget(),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: const Color.fromRGBO(135, 138, 140, 0.1),
                              alignment:
                                  (Provider.of<SearchController>(context).isWeb)
                                      ? Alignment.bottomCenter
                                      : Alignment.topCenter,
                              child: SizedBox(
                                width: (Provider.of<SearchController>(context)
                                        .isWeb)
                                    ? constraint.maxWidth * 0.82
                                    : constraint.maxWidth * 1,
                                height: (Provider.of<SearchController>(context)
                                        .isWeb)
                                    ? constraint.maxHeight * 0.85
                                    : constraint.maxHeight * 1,
                                child: ListView(
                                  //WARNING ==> removing shrinkWrap will cause unBounded height runTime exception
                                  //because the column gives unBounded constraints
                                  //shrinkWrap makes the scroll size same as content size
                                  shrinkWrap: true,
                                  children: [
                                    //call a function the builds the communities list
                                    ...Provider.of<SearchController>(context)
                                        .buildCommunityInSearchListWidget(),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: const Color.fromRGBO(135, 138, 140, 0.1),
                              alignment:
                                  (Provider.of<SearchController>(context).isWeb)
                                      ? Alignment.bottomCenter
                                      : Alignment.topCenter,
                              child: SizedBox(
                                width: (Provider.of<SearchController>(context)
                                        .isWeb)
                                    ? constraint.maxWidth * 0.82
                                    : constraint.maxWidth * 1,
                                height: (Provider.of<SearchController>(context)
                                        .isWeb)
                                    ? constraint.maxHeight * 0.85
                                    : constraint.maxHeight * 1,
                                child: ListView(
                                  //WARNING ==> removing shrinkWrap will cause unBounded height runTime exception
                                  //because the column gives unBounded constraints
                                  //shrinkWrap makes the scroll size same as content size
                                  shrinkWrap: true,
                                  children: [
                                    //call a function the builds the people list
                                    ...Provider.of<SearchController>(context)
                                        .buildPeopleInSearchListWidget(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
