import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/search_text_field.dart';
import '../widgets/trending_today_in_search.dart';
import '../../controllers/search_controller.dart';

class SearchScreenOne extends StatefulWidget {
  const SearchScreenOne({super.key});

  //stateful to can call initState function
  @override
  State<StatefulWidget> createState() => SearchScreenOneState();
}

class SearchScreenOneState extends State {
  @override
  initState() {
    super.initState();
    //call get search history to restore it in the beginnimg of the program
    //dummy Fututre (duration is zero) ==> to be able to use context
    Future.delayed(
      Duration.zero,
      () {
        Provider.of<SearchController>(context, listen: false)
            .getSearchHistory();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //in web ==> text field only
        //in App ==> arrow_back button + text field
        Provider.of<SearchController>(context).isWeb
            ? const SearchTextFieldWidget()
            : Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Expanded(
                    //Expanded to make the Widget fill the avaialable space along the row
                    //WARNING ==> removing Expanded will cause a runTime error because the textFieldWidget will not fit in the row
                    child: SearchTextFieldWidget(),
                  ),
                ],
              ),
        //check if the search history is empty==> display trending only
        //if there is search history ==> display it then trending
        (Provider.of<SearchController>(context).restoreSearchHistory == null ||
                Provider.of<SearchController>(context)
                    .restoreSearchHistory!
                    .isEmpty ||
                Provider.of<SearchController>(context).restoreSearchHistory ==
                    null)
            //if the stored list history is empty ==> show wtrending only
            ? const TrendingTodayInSearch()
            //if there is search history==> show it then show trending
            : Column(
                children: [
                  ListView(
                    //WARNING ==> removing shrinkWrap will cause unBounded height runTime exception
                    //because the column gives unBounded constraints
                    //shrinkWrap makes the scroll size same as content size
                    shrinkWrap: true,
                    children: [
                      //call a function the buils the search history column
                      ...Provider.of<SearchController>(context)
                          .buildSearchHistoryColumn(),
                    ],
                  ),
                  const TrendingTodayInSearch(),
                ],
              ),
      ],
    );
  }
}
