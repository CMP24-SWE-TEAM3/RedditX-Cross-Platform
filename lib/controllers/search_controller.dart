import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as international;
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/search_model.dart';

import '../views/widgets/comments_in_search_results.dart';
import '../views/widgets/communities_in_search_results.dart';
import '../views/widgets/people_in_search_results.dart';
import '../views/widgets/posts_in_search_results.dart';
import '../views/widgets/search_history_widget.dart';

class SearchController with ChangeNotifier {
  final SearchService searchService;

  ///controller that stores the input text
  var searchTextFieldcontroller = TextEditingController();
  //detect the platform
  //web==> true , App==> false
  bool isWeb = !Platform.isAndroid;

  ///text appears from RTL ==> true, from LTR ==< false
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
  //to store  and restore the search history
  List<String>? restoreSearchHistory = [];
  //to detect which item was clicked
  int clickedItemIndex = 0;
  //to detect the radius
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

  SearchController({
    required this.searchService,
  }) {
    //web==> circular
    //App==> rectangular
    borderRadius = isWeb ? 20.0 : 0.0;
    //Initially ==> the icon is does not appear in we nut the close icon appears in App
    closeIcon =
        isWeb ? const Icon(null) : const Icon(Icons.close, color: Colors.grey);
  }

  ///when hover the field with the mouse
  onHoverTextField() {
    ///a flag to detect it is hovered
    isHoveredTextField = true;
    notifyListeners();
  }

  ///when move the mouse away from the text field the region
  onExitTextField() {
    ///a flag to detect it is not hovered now
    isHoveredTextField = false;
    notifyListeners();
  }

  ///when tap the text field
  onTapTextField() {
    ///a flag to detect it is tapped
    isTapped = true;

    ///change the shape of the text field when tapped
    bottomborderRadius = 0;
    notifyListeners();
  }

  ///when tap outside the text field
  onExitTapTextField() {
    ///a flag to detect it is no longer tapped
    isTapped = false;
    //to change make the bottom circular in web
    //rect in App
    bottomborderRadius = isWeb ? 20 : 0;
    notifyListeners();
  }

  ///clear button in the end of the text field
  textFieldSuffixOnPressed() {
    ///clear the content of the text field by calling searchTextFieldcontroller.clear();
    searchTextFieldcontroller.clear();

    ///in web ==> when clear the text ==> the clear button diappear
    if (isWeb) {
      closeIcon = const Icon(null);
    }
    notifyListeners();
  }

  ///when click on a serach history item
  searchHistoryClicked(String textClicked, int itemIndex) {
    ///1-clear the current written text in the text field by calling searchTextFieldcontroller.clear();
    searchTextFieldcontroller.clear();
    clickedItemIndex = itemIndex;

    ///2-make the text in the text field = the text of the clicked item
    searchTextFieldcontroller.text = textClicked;

    ///3-to make the cursor in the end of the new text
    searchTextFieldcontroller.selection = TextSelection.fromPosition(
      TextPosition(offset: searchTextFieldcontroller.text.length),
    );
    //5-every change in text this function is called
    onChangeTextField();
    notifyListeners();
  }

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

  ///to detect whether the text will be written LTR or RTL
  isRTLTextField() {
    ///if web ==>the text is always LTR
    isRTLText = isWeb
        ? false

        ///if App ==> detect RTL or LTR using international.Bidi.detectRtlDirectionality function
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

  ///Get the List of stored search History
  getSearchHistory() async {
    ///shared preferences for chached data
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList("SearchHistory") != null) {
      ///get the saved data
      restoreSearchHistory = prefs.getStringList("SearchHistory")!;
    } else {
      //to avoid nullable call runtime error
      /// we get empty list if the saved data is empty
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

  ///when search input is submitted
  onSubmittingTextField() async {
    ///send the search request to the API
    //will be implemented later
    sendSearchRequestToServer();

    ///Save search history in the front of the list
    restoreSearchHistory!.insert(0, searchTextFieldcontroller.text);

    ///save the new list in the shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("SearchHistory", restoreSearchHistory!);
    notifyListeners();
  }

  fillFollowingList() {
    //fill List of following / unfollowing Accounts
    for (var i = 0; i < searchService.peoplesList.length; i++) {
      isFollowing.add(searchService.peoplesList[i].followed);
      //make all follow button unhovered initially
      isHoveredFollowButton.add(false);
    }
  }

  fillJoiningList() {
    //fill List of joining / unjoining Uccounts
    for (var i = 0; i < searchService.communitiesList.length; i++) {
      isJoining.add(searchService.communitiesList[i].joined);
      //make all join button unhovered initially
      isHoveredJoinButton.add(false);
    }
  }

  ///when  asearch history is deleted using delete button
  deleteSearchHistory(int index) async {
    ///remove this item from the search history list
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
    for (int i = 0; i < searchService.peoplesList.length; i++) {
      peopleSearchResultsWidgetList.add(
        PeopleSearchResult(
          personData: searchService.peoplesList[i],
          index: i,
        ),
      );
    }
    return peopleSearchResultsWidgetList;
  }

  List<PostsSearchResult> buildPostsInSearchListWidget() {
    //List of posts widgets
    List<PostsSearchResult> postsSearchResultsWidgetList = [];
    //fill its data from the postsList in the model class
    for (int i = 0; i < searchService.postsList.length; i++) {
      postsSearchResultsWidgetList.add(
        PostsSearchResult(
          postData: searchService.postsList[i],
          index: i,
        ),
      );
    }
    return postsSearchResultsWidgetList;
  }

  List<CommentsSearchResult> buildCommentsInSearchListWidget() {
    //List of comments widgets
    List<CommentsSearchResult> commentsSearchResultsWidgetList = [];
    //fill its data from the commentsList in the model class
    for (int i = 0; i < searchService.commentssList.length; i++) {
      commentsSearchResultsWidgetList.add(
        CommentsSearchResult(
          commentData: searchService.commentssList[i],
          index: i,
        ),
      );
    }
    return commentsSearchResultsWidgetList;
  }

  List<CommunitiesSearchResult> buildCommunityInSearchListWidget() {
    //initially fill the list of joined/unjoined communities
    fillJoiningList();
    //List of community widgets
    List<CommunitiesSearchResult> communitySearchResultsWidgetList = [];
    //fill its data from the communitiesList in the model class
    for (int i = 0; i < searchService.communitiesList.length; i++) {
      communitySearchResultsWidgetList.add(
        CommunitiesSearchResult(
          communityData: searchService.communitiesList[i],
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
    //1-send join/ UnJoin request to the API
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

  //when exit hovering follow button
  onExitFollowButton(int i) {
    isHoveredFollowButton[i] = false;
    notifyListeners();
  }

  //when exit hovering join button
  onExitJoinButton(int i) {
    isHoveredJoinButton[i] = false;
    notifyListeners();
  }

  ///calculate the number of days,months and years the person,post has been in Reddit
  calculateAge(DateTime createdAt) {
    String shownDate = '';
    int years = DateTime.now().year - createdAt.year;
    int months = DateTime.now().month - createdAt.month;
    int days = DateTime.now().day - createdAt.day;
    int hours = DateTime.now().hour - createdAt.hour;
    int minutes = DateTime.now().minute - createdAt.minute;
    int seconds = DateTime.now().second - createdAt.second;

    ///negative value means the current second/minute/day/month is less than the DateTime of the post
    ///so it means we are in a minute/day/month/year after that one but not a full minute/day/month/year have passed
    ///so we subtract it
    ///Ex:3/11/2022-5/12/2022
    if (months < 0) {
      months = (12 - createdAt.month) + DateTime.now().month;
      years -= 1;
    }
    if (days < 0) {
      int daysCount = createdAt.month == 2
          ? 28
          : (createdAt.month == 1 ||
                  createdAt.month == 3 ||
                  createdAt.month == 5 ||
                  createdAt.month == 7 ||
                  createdAt.month == 8 ||
                  createdAt.month == 10 ||
                  createdAt.month == 12)
              ? 31
              : 30;
      days = (daysCount - createdAt.day) + DateTime.now().day;
      months -= 1;
    }
    if (hours < 0) {
      hours = (24 - createdAt.hour) + DateTime.now().hour;
      days -= 1;
    }
    if (minutes < 0) {
      minutes = (60 - createdAt.minute) + DateTime.now().minute;
      hours -= 1;
    }
    if (seconds < 0) {
      hours = (60 - createdAt.second) + DateTime.now().second;
      minutes -= 1;
    }

    ///format the shown period according to the values of days,months and years
    if (years != 0) {
      shownDate = isWeb ? '$years years ago' : '${years}y';
    } else if (months != 0) {
      shownDate = shownDate = isWeb ? '$months months ago' : '${months}mo';
    } else if (days != 0) {
      shownDate = shownDate = isWeb ? '$days days ago' : '${days}d';
    } else if (hours != 0) {
      shownDate = shownDate = isWeb ? '$hours hours ago' : '${hours}h';
    } else if (minutes != 0) {
      shownDate = shownDate = isWeb ? '$minutes minutes ago' : '${minutes}m';
    } else if (seconds != 0) {
      shownDate = shownDate = isWeb ? '$seconds seconds ago' : '${seconds}s';
    } else {
      shownDate = 'now';
    }

    return shownDate;
  }
}
