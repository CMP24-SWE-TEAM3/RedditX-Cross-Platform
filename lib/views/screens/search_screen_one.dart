import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/search_text_field.dart';
import '../widgets/search_history_and_trending.dart';

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
    return Scaffold(
      appBar: null,
      body: Column(
        children: [
          //in web ==> text field only
          //in App ==> arrow_back button + text field
          !Provider.of<SearchController>(context).isWeb &&
                  Provider.of<SearchController>(context).isTapped
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          //when the user tap outside the search field
                          Provider.of<SearchController>(
                            context,
                            listen: false,
                          ).onExitTapTextField();
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      const Expanded(
                        //Expanded to make the Widget fill the avaialable space along the row
                        //WARNING ==> removing Expanded will cause a runTime error because the textFieldWidget will not fit in the row
                        child: SearchTextFieldWidget(),
                      ),
                    ],
                  ),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: const SearchTextFieldWidget(),
                ),

          //when the field is tapped in web the search history list is shown over the home page
          Provider.of<SearchController>(context).isTapped &&
                  Provider.of<SearchController>(context).isWeb
              ? Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Provider.of<SearchController>(
                          context,
                          listen: false,
                        ).onExitTapTextField();
                      },
                      //will be replaced by home screen
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.9,
                        width: MediaQuery.of(context).size.width,
                        color: const Color.fromARGB(255, 230, 124, 159),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: const SearchHostoryAndTrending(),
                    ),
                  ],
                )
              //when we tap the search field in App we go to the screen the contains the search results
              : Provider.of<SearchController>(context).isTapped &&
                      !Provider.of<SearchController>(context).isWeb
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const SearchHostoryAndTrending(),
                    )
                  //Will be replaced by home screen
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      width: MediaQuery.of(context).size.width,
                      color: const Color.fromARGB(255, 230, 124, 159),
                    ),
        ],
      ),
    );
  }
}
