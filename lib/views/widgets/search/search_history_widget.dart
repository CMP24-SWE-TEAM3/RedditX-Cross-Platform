import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens/search/search_screen_two.dart';

import '../../../controllers/search_controller.dart';

class SearchHistoryWidget extends StatelessWidget {
  ///The text that will be passed to the widget to show
  final String textToShow;

  ///The index of this item in the list of search history
  ///Detects the item when the user click on it or delete it
  final int myIndex;

  const SearchHistoryWidget({
    super.key,
    required this.textToShow,
    required this.myIndex,
  });

  @override
  Widget build(BuildContext context) {
    ///GestureDetector to detect when the item is clicked
    return GestureDetector(
      key: Key('search_history_item_${myIndex}_click'),
      onTap: () {
        Provider.of<SearchController>(context, listen: false)
            .searchHistoryClicked(textToShow, myIndex);

        ///Go to search results screen
        Navigator.of(context)
            .pushNamed(SearchScreenTwo.routeName, arguments: {});
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
                key: Key('search_history_item_${myIndex}_text'),
                textToShow,
                style: const TextStyle(color: Colors.black, fontSize: 12)),

            ///Deletes this search result
            IconButton(
              icon: Icon(
                key: Key(
                  'search_history_item_${myIndex}_delete',
                ),
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
