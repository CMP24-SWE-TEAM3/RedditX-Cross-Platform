import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/search_controller.dart';

class SearchHistoryWidget extends StatelessWidget {
  //the text that will be passed to the widget to show
  final String textToShow;
  //the index of this item in the list of search history
  //it is used to delete the item when the user dlick on delete icon
  final int myIndex;

  //constructor to pass the text and index to the widget
  const SearchHistoryWidget({
    super.key,
    required this.textToShow,
    required this.myIndex,
  });

  @override
  Widget build(BuildContext context) {
    //to detect when the item is clicked
    return GestureDetector(
      onTap: () {
        Provider.of<SearchController>(context, listen: false)
            .searchHistoryClicked(textToShow, myIndex);
      },
      child: Container(
        //if an item is clicked && the clicked item is the current item ==> its color will be grey
        color: (Provider.of<SearchController>(context).isSearchHistoryClicked &&
                Provider.of<SearchController>(context).clickedItemIndex ==
                    myIndex)
            ? const Color.fromRGBO(230, 230, 230, 1)
            : Colors.white,
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
