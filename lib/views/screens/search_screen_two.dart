import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/search_controller.dart';

class SearchScreenTwo extends StatelessWidget {
  const SearchScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: null,
        body: Container(
          color: const Color.fromRGBO(135, 138, 140, 0.3),
          child: LayoutBuilder(
            //to be responsive with the size of the screen
            builder: (context, constraint) => Column(
              children: [
                SizedBox(
                  height: constraint.maxHeight * 0.07,
                  child: TabBar(
                    labelColor: Colors.black, //selected label
                    unselectedLabelColor: Colors.grey,
                    labelPadding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    isScrollable: true,
                    //when hover with the mouse
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
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
                    indicator: Provider.of<SearchController>(context).isWeb
                        ? ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
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
                      Tab(key: Key('communities_tab'), text: 'Communities'),
                      Tab(key: Key('people_tab'), text: 'People'),
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
                          width: (Provider.of<SearchController>(context).isWeb)
                              ? constraint.maxWidth * 0.82
                              : constraint.maxWidth * 1,
                          height: (Provider.of<SearchController>(context).isWeb)
                              ? constraint.maxHeight * 0.85
                              : constraint.maxHeight * 1,
                          child: ListView(
                            //WARNING ==> removing shrinkWrap will cause unBounded height runTime exception
                            //because the column gives unBounded constraints
                            //shrinkWrap makes the scroll size same as content size
                            shrinkWrap: true,
                            children: [
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
                          width: (Provider.of<SearchController>(context).isWeb)
                              ? constraint.maxWidth * 0.82
                              : constraint.maxWidth * 1,
                          height: (Provider.of<SearchController>(context).isWeb)
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
                          width: (Provider.of<SearchController>(context).isWeb)
                              ? constraint.maxWidth * 0.82
                              : constraint.maxWidth * 1,
                          height: (Provider.of<SearchController>(context).isWeb)
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
                          width: (Provider.of<SearchController>(context).isWeb)
                              ? constraint.maxWidth * 0.82
                              : constraint.maxWidth * 1,
                          height: (Provider.of<SearchController>(context).isWeb)
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
  }
}
