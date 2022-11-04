import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as international;
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/search_model.dart';
import '../views/widgets/search_history_widget.dart';
import '../views/widgets/people_in_search_results.dart';
import '../views/widgets/communities_in_search_results.dart';
import '../views/widgets/posts_in_search_results.dart';

class SearchController with ChangeNotifier {
  //controller that stores the input text
  var searchTextFieldcontroller = TextEditingController();
  //detect the platform
  //web==> true , App==> false
  bool isWeb = false;
  //text appears from RTL ==> true, from LTR ==< false
  bool isRTLText = false;
  //the icon that appears in the end of the text field to delete the input text
  Widget closeIcon = const Icon(Icons.close, color: Colors.grey);
  //is the textField focused
  bool isFocused = false;
  //is the text field hovered with the mouse
  bool isHoveredTextField = false;
  //to detect when the textField is tapped
  bool isTapped = false;
  //to detect whether the border is circular or rectangular depending on the platform
  double borderRadius = 0;
  //to save the search history
  List<String> searchHistory = [];
  //to store  and restore the search history
  List<String>? restoreSearchHistory = [];
  //if the user click one of the search history
  bool isSearchHistoryClicked = false;
  //to detect which item was clicked
  int clickedItemIndex = 0;
  double bottomborderRadius = 0;
  //to store in it useres from the search result of people are followed and which are not
  //I will fill it during reading data in the model class
  List<bool> isFollowing = [];
  //to store in it subreddits from the search result of communities are joined and which are not
  //I will fill it during reading data in the model class
  List<bool> isJoining = [];
  //to detect if the Follow button in the search result is hovered with mouse
  List<bool> isHoveredFollowButton = [];
  //to detect if the join button in the search result is hovered with mouse
  List<bool> isHoveredJoinButton = [];

  SearchController() {
    //web==> circular
    //App==> rectangular
    borderRadius = isWeb ? 20.0 : 0.0;
    //Initially ==> the icon is does not appear in we nut the close icon appears in App
    closeIcon =
        isWeb ? const Icon(null) : const Icon(Icons.close, color: Colors.grey);
  }

  onHoverTextField() {
    //when hover the field with the mouse
    isHoveredTextField = true;
    notifyListeners();
  }

  onExitTextField() {
    //when move the mouse away from the text field the region
    isHoveredTextField = false;
    notifyListeners();
  }

  onTapTextField() {
    //when tap the text field
    isTapped = true;
    bottomborderRadius = 0;
    notifyListeners();
  }

  onExitTapTextField() {
    //when tap outside the text field
    isTapped = false;
    //to change make the ottom circular in web
    //rect in App
    bottomborderRadius = isWeb ? 20 : 0;
    notifyListeners();
  }

  textFieldSuffixOnPressed() {
    //clear button in the end of the text field
    searchTextFieldcontroller.clear();
    if (isWeb) {
      //in web ==> when clear the text ==> the close button diappear
      closeIcon = const Icon(null);
    }
    notifyListeners();
  }

  searchHistoryClicked(String textClicked, int itemIndex) {
    //when click on a serach history item
    //1-clear the current written text in the text fiels
    searchTextFieldcontroller.clear();
    //2-flags to make the clicked item color: grey
    isSearchHistoryClicked = true;
    clickedItemIndex = itemIndex;
    //3-make the text in the text field = the text of the clicked item
    searchTextFieldcontroller.text = textClicked;
    //4-to make the cursor in the end of the new text
    searchTextFieldcontroller.selection = TextSelection.fromPosition(
      TextPosition(offset: searchTextFieldcontroller.text.length),
    );
    //5-every change in text this function is called
    onChangeTextField();
    notifyListeners();
  }
  ////////////////////////////////////////////

  Color fillColorTextField() {
    //if App ==> the color is always grey
    //if web==>
    //===if the text field is hovered ==> the color is white
    //===else ==> the color is grey
    Color fillColor = (isWeb && (isHoveredTextField || isTapped))
        ? Colors.white
        : const Color.fromRGBO(230, 230, 230, 1);

    return fillColor;
  }

  Color hoverColorTextField() {
    Color hovorColor =
        isWeb ? Colors.white : const Color.fromRGBO(230, 230, 230, 1); //grey
    return hovorColor;
  }

  Color focusBorderColorTextField() {
    Color focusBorderColor =
        isWeb ? Colors.blue : const Color.fromRGBO(230, 230, 230, 1); //grey
    return focusBorderColor;
  }

  Color enabledBorderColor() {
    Color enableBorderColor = isWeb
        ? (isHoveredTextField)
            ? Colors.blue
            : Colors.white
        : const Color.fromRGBO(230, 230, 230, 1); //grey
    return enableBorderColor;
  }

  isRTLTextField() {
    //if web ==> always LTR
    isRTLText = isWeb
        ? false
        //if App ==> detect RTL or LTR
        : international.Bidi.detectRtlDirectionality(
                //function from lib intl.dart
                searchTextFieldcontroller.text //input text
                )
            ? true
            : false;
    notifyListeners();
  }

  closeIconAppearOrDisappear() {
    //if the text is empty ==> close button disappear
    //else it appears
    //this func is called every change
    closeIcon = searchTextFieldcontroller.text.isEmpty
        ? const Icon(null)
        : const Icon(Icons.close, color: Colors.grey);
    notifyListeners();
  }

  /////////////////////////////////////////

  getSearchHistory() async {
    //Get the List of stored search History
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList("SearchHistory") != null) {
      restoreSearchHistory = prefs.getStringList("SearchHistory")!;
    } else {
      //to avoid nullable call runtime erroe
      restoreSearchHistory = [];
    }
    notifyListeners();
  }

  onChangeTextField() {
    //to detect the text direction according to the written text
    isRTLTextField();
    //to detect whether to show the icon of delete or no ==>
    //if the text in web is deleted ==> it will not be icon
    //if a text is empty ==> make the close icon appear
    closeIconAppearOrDisappear();
  }

  onSubmittingTextField() async {
    //Save search history in the front of the list
    restoreSearchHistory!.insert(0, searchTextFieldcontroller.text);
    //save the new list in the shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("SearchHistory", restoreSearchHistory!);
    notifyListeners();
  }

  fillFollowingList() {
    //fill List of following / unfollowing Accounts
    for (var i = 0; i < peoplesList.length; i++) {
      isFollowing.add(peoplesList[i].followed);
      //make all follow button unhovered initially
      isHoveredFollowButton.add(false);
    }
  }

  fillJoiningList() {
    //fill List of joining / unjoining Uccounts
    for (var i = 0; i < communitiesList.length; i++) {
      isJoining.add(communitiesList[i].joined);
      //make all join button unhovered initially
      isHoveredJoinButton.add(false);
    }
  }

  //when  asearch history is deleted using close button
  deleteSearchHistory(int index) async {
    //indicate that a search history item is deleted
    isSearchHistoryClicked = true;
    //remove thisitem using its index which was saved in the item widget
    restoreSearchHistory!.removeAt(index);
    notifyListeners();
    //save the new list in the shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("SearchHistory", restoreSearchHistory!);
  }

  List<SearchHistoryWidget> buildSearchHistoryColumn() {
    //to avoid nullable call in the following part of the code
    if (restoreSearchHistory == null) {
      return [];
    }
    //List f widgets that will appear
    List<SearchHistoryWidget> searchHistoryWidget = [];
    int lengthOfShowList = 0;
    //in web ==> show 5 elements at most
    //in Appp ==> show 3 elements at most
    if (isWeb && restoreSearchHistory!.length < 5 ||
        !isWeb && restoreSearchHistory!.length < 3) {
      lengthOfShowList = restoreSearchHistory!.length;
    } else {
      lengthOfShowList = isWeb ? 5 : 3;
    }
    //form a widget and add it to the list that will be shown
    //the list size is max 5 in web , max 3 in Appp
    for (int i = 0; i < lengthOfShowList; i++) {
      searchHistoryWidget.add(
        SearchHistoryWidget(
            //the indes of the widget(i) is sent to it (will be used when delete the item)
            //the text is sent from the front of the list of search hoistory
            myIndex: i,
            textToShow: restoreSearchHistory![i]),
      );
    }
    return searchHistoryWidget;
  }

  List<PeopleSearchResult> buildPeopleInSearchListWidget() {
    //initially fill the list of followed/unfollowed accounts
    fillFollowingList();
    //List of people widgets
    List<PeopleSearchResult> peopleSearchResultsWidgetList = [];
    //fill its data from the peopleList in the model class
    for (int i = 0; i < peoplesList.length; i++) {
      peopleSearchResultsWidgetList.add(
        PeopleSearchResult(
          personData: peoplesList[i],
          index: i,
        ),
      );
    }
    return peopleSearchResultsWidgetList;
  }

  List<PostsSearchResult> buildPostsInSearchListWidget() {
    //List of posts widgets
    List<PostsSearchResult> postsSearchResultsWidgetList = [];
    //fill its data from the peopleList in the model class
    for (int i = 0; i < postsList.length; i++) {
      postsSearchResultsWidgetList.add(
        PostsSearchResult(
          postData: postsList[i],
          index: i,
        ),
      );
    }
    return postsSearchResultsWidgetList;
  }

  List<CommunitiesSearchResult> buildCommunityInSearchListWidget() {
    //initially fill the list of followed/unfollowed accounts
    fillJoiningList();
    //List of community widgets
    List<CommunitiesSearchResult> communitySearchResultsWidgetList = [];
    //fill its data from the communitiesList in the model class
    for (int i = 0; i < communitiesList.length; i++) {
      communitySearchResultsWidgetList.add(
        CommunitiesSearchResult(
          communityData: communitiesList[i],
          index: i,
        ),
      );
    }
    return communitySearchResultsWidgetList;
  }

  //index of the account in the retrieved accounts list
  onPressingFollowButton(int index) {
    //1-send follow/ UnFollow request to the API
    //2-change the text of the follow button
    isFollowing[index] = !isFollowing[index];
    notifyListeners();
  }

  onPressingJoinButton(int index) {
    //1-send follow/ UnFollow request to the API
    //2-change the text of the join button
    isJoining[index] = !isJoining[index];
    notifyListeners();
  }

  onHoverFollowButton(int i) {
    isHoveredFollowButton[i] = true;
    notifyListeners();
  }

  onHoverJoinButton(int i) {
    isHoveredJoinButton[i] = true;
    notifyListeners();
  }

  //when exit hovering
  onExitFollowButton(int i) {
    isHoveredFollowButton[i] = false;
    notifyListeners();
  }

  //when exit hovering
  onExitJoinButton(int i) {
    isHoveredJoinButton[i] = false;
    notifyListeners();
  }
}
