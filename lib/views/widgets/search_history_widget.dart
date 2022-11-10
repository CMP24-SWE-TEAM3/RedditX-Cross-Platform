import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/search_screen_two.dart';

import '../../controllers/search_controller.dart';
import '../../models/search_model.dart';

class SearchHistoryWidget extends StatelessWidget {
  ///the text that will be passed to the widget to show
  final String textToShow;

  ///the index of this item in the list of search history
  ///it is used to detect the item when the user click on it or delete it
  final int myIndex;

  //constructor to pass the text and index to the widget
  const SearchHistoryWidget({
    super.key,
    required this.textToShow,
    required this.myIndex,
  });

  @override
  Widget build(BuildContext context) {
    //GestureDetector to detect when the item is clicked
    return GestureDetector(
      onTap: () {
        Provider.of<SearchController>(context, listen: false)
            .searchHistoryClicked(textToShow, myIndex);
        //when it is clicked ==> Go to search results screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (_) => SearchController(
                searchService: SearchService(),
              ),
              child: const SearchScreenTwo(),
            ),
          ),
        );
      },
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            Icon(
              //in web ==> search icon with black color
              //in App ==> access_Time icon with grey color
              Provider.of<SearchController>(context).isWeb
                  ? Icons.search
                  : Icons.access_time,
              color: Provider.of<SearchController>(context).isWeb
                  ? Colors.black
                  : Colors.grey,
            ),
            Text(
              key: Key('search_history_item_$myIndex'),
              textToShow,
            ),
            IconButton(
              icon: Icon(
                Icons.close,
                color: Provider.of<SearchController>(context).isWeb
                    ? Colors.black
                    : Colors.grey,
              ),
              onPressed: () {
                //call the function that deletes the item from the list and modify the list
                Provider.of<SearchController>(context, listen: false)
                    .deleteSearchHistory(myIndex);
              },
            ),
          ],
        ),
      ),
    );
  }
}
