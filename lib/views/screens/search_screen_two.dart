import 'package:flutter/material.dart';
import '../widgets/posts_in_search_results.dart';
import '../widgets/comments_in_search_results.dart';
import '../widgets/communities_in_search_results.dart';
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
          color: const Color.fromRGBO(135, 138, 140, 0.2),
          child: LayoutBuilder(
            builder: (ctx, constraint) => Column(
              children: [
                SizedBox(
                  height: constraint.maxHeight * 0.07,
                  child: TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    labelPadding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    isScrollable: true,
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.white;
                        }
                        return null;
                      },
                    ),
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
                      Tab(text: 'Posts'),
                      Tab(text: 'Comments'),
                      Tab(text: 'Communities'),
                      Tab(text: 'People'),
                    ],
                  ),
                ),
                SizedBox(
                  height: constraint.maxHeight * 0.93,
                  child: TabBarView(
                    children: [
                      const PostsSearchResult(),
                      Container(
                        color: const Color.fromRGBO(135, 138, 140, 0.2),
                        alignment:
                            (Provider.of<SearchController>(context).isWeb)
                                ? Alignment.center
                                : Alignment.topCenter,
                        child: SizedBox(
                          width: (Provider.of<SearchController>(context).isWeb)
                              ? constraint.maxWidth * 0.7
                              : constraint.maxWidth * 1,
                          child: const CommentsSearchResult(),
                        ),
                      ),
                      Container(
                        color: const Color.fromRGBO(135, 138, 140, 0.2),
                        alignment:
                            (Provider.of<SearchController>(context).isWeb)
                                ? Alignment.center
                                : Alignment.topCenter,
                        child: SizedBox(
                          width: (Provider.of<SearchController>(context).isWeb)
                              ? constraint.maxWidth * 0.7
                              : constraint.maxWidth * 1,
                          child: const CommunitiesSearchResult(),
                        ),
                      ),
                      Container(
                        color: const Color.fromRGBO(135, 138, 140, 0.2),
                        alignment:
                            (Provider.of<SearchController>(context).isWeb)
                                ? Alignment.center
                                : Alignment.topCenter,
                        child: SizedBox(
                          width: (Provider.of<SearchController>(context).isWeb)
                              ? constraint.maxWidth * 0.7
                              : constraint.maxWidth * 1,
                          child: ListView(
                            //WARNING ==> removing shrinkWrap will cause unBounded height runTime exception
                            //because the column gives unBounded constraints
                            //shrinkWrap makes the scroll size same as content size
                            shrinkWrap: true,
                            children: [
                              //call a function the builds the search history column
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
