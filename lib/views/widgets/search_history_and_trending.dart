import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'trending_today_in_search.dart';

import '../../controllers/search_controller.dart';

class SearchHostoryAndTrending extends StatelessWidget {
  const SearchHostoryAndTrending({super.key});

  @override
  Widget build(BuildContext context) {
    return (Provider.of<SearchController>(context).restoreSearchHistory ==
                null ||
            Provider.of<SearchController>(context)
                .restoreSearchHistory!
                .isEmpty ||
            Provider.of<SearchController>(context).restoreSearchHistory == null)
        //if the stored list history is empty ==> show wtrending only
        ? const TrendingTodayInSearch()
        //if there is search history==> show it then show trending
        : Column(
            children: [
              ListView(
                key: const Key('search_histort_list'),
                //WARNING ==> removing shrinkWrap will cause unBounded height runTime exception
                //because the column gives unBounded constraints
                //shrinkWrap makes the scroll size same as content size
                shrinkWrap: true,
                children: [
                  //call a function the builds the search history column
                  ...Provider.of<SearchController>(context)
                      .buildSearchHistoryColumn(),
                ],
              ),
              const TrendingTodayInSearch(),
            ],
          );
  }
}
