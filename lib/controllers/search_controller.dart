import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as international;
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/search_model.dart';
import '../config/constants.dart';
import '../views/widgets/search/comments_in_search_results.dart';
import '../views/widgets/search/communities_in_search_results.dart';
import '../views/widgets/search/people_in_search_results.dart';
import '../views/widgets/search/posts_in_search_results.dart';
import '../views/widgets/search/search_history_widget.dart';
import 'search_service_model_controller.dart';

class SearchController with ChangeNotifier {
  ///Whether this user allows NSFW content or not
  bool allowNsfw = nsfw;

  ///Current tab in dearch results [Posts , Comments , Communities, People]
  String tab = 'post';

  ///Controller that stores the search input text
  var searchTextFieldcontroller = TextEditingController();

  ///Whether the platform is web or android
  //web==> true , App==> false
  bool isWeb = false; //!(defaultTargetPlatform == TargetPlatform.android);

  ///Whether the text direction is RTL or LTR
  bool isRTLText = false;
  //the icon that appears in the end of the text field to delete the input text
  Widget closeIcon = const Icon(Icons.close, color: Colors.grey);

  ///Whether the serach text field focused or not
  bool isFocused = false;

  ///Whether the search text field hovered with the mouse or not
  bool isHoveredTextField = false;
  //to detect when the search text field is tapped
  bool isTapped = false;
  //Whether the border is circular or rectangular depending on the platform
  double borderRadius = 0;

  ///List to store  and restore the search history
  List<String>? restoreSearchHistory = [];

  ///Index of search history clicked item if an is clicked
  int clickedItemIndex = 0;
  //to detect the radius of the search inpt text field
  double bottomborderRadius = 0;
  //to store in it useres from the search result of people are followed and which are not
  //I will fill it during reading data in the model class
  ///List of people in search results detects whether each user is followed or not
  List<bool> isFollowing = [];
  //to store in it subreddits from the search result of communities are joined and which are not
  //I will fill it during reading data in the model class
  ///List of communities in search results detects whether each community is joined or not
  List<bool> isJoining = [];

  ///Whether this follow button in search result is hovered with mouse or not
  List<bool> isHoveredFollowButton = [];

  ///Whether this join button in search result is hovered with mouse or not
  List<bool> isHoveredJoinButton = [];

  ///Type of sort of posts in search results
  String sortDropDownValue = 'relevance';

  ///Search input
  String searchInput = '';

  ///Whether sensetive content will not appear or not
  bool safeSearch = false;

  ///Whether the search results is loading now or not
  bool isLoading = false;

  SearchController() {
    ///web==> circular
    ///App==> rectangular
    borderRadius = isWeb ? 20.0 : 0.0;
    ///Initially ==> the icon is does not appear in we nut the close icon appears in App
    closeIcon =
        isWeb ? const Icon(null) : const Icon(Icons.close, color: Colors.grey);
  }

  ///Detects when hover the field with the mouse
  onHoverTextField() {
    ///Whether the text field is tapped or not
    isHoveredTextField = true;
    notifyListeners();
  }

  ///Detects when move the mouse away from the text field
  onExitTextField() {
    ///Whether the text field is hovered or not
    isHoveredTextField = false;
    notifyListeners();
  }

  ///Detects when tap the text field
  onTapTextField() {
    ///Whether the text field is tapped or not
    isTapped = true;

    ///change the shape of the text field when tapped
    bottomborderRadius = 0;
    notifyListeners();
  }

  ///Detects when tap outside the text field
  onExitTapTextField() {
    ///Whether the text field is tapped or not
    isTapped = false;
    //to change make the bottom circular in web
    //rect in App
    bottomborderRadius = isWeb ? 20 : 0;
    notifyListeners();
  }

  ///Press clear button in the end of the text field
  textFieldSuffixOnPressed() {
    ///Clear the content of the text field
    searchTextFieldcontroller.clear();

    ///in web ==> when clear the text ==> the clear button diappear
    if (isWeb) {
      closeIcon = const Icon(null);
    }
    notifyListeners();
  }

  ///When click on a serach history item
  searchHistoryClicked(String textClicked, int itemIndex) async {
    ///1-Clears the current written text in the text field by calling [clear()] function;
    searchTextFieldcontroller.clear();

    ///2-Makes the text in the text field = the text of the clicked item
    searchTextFieldcontroller.text = textClicked;
    clickedItemIndex = itemIndex;

    ///3-Makes the search input = the text of thi clicked search history
    searchInput = textClicked;
    notifyListeners();

    ///4-Makes the cursor in the end of the new text
    searchTextFieldcontroller.selection = TextSelection.fromPosition(
      TextPosition(offset: searchTextFieldcontroller.text.length),
    );

    ///5-every change in text this function is called
    onChangeTextField();

    ///6-sends the search request to the BE
    await sendSearchRequest(sortDropDownValue, tab, 1);

    notifyListeners();
  }

  Color fillColorTextField() {
    ///if App ==> the color is always grey
    ///if web==>
    ///===if the text field is hovered ==> the color is white
    ///===else ==> the color is grey
    Color fillColor = (isWeb && (isHoveredTextField || isTapped))
        ? Colors.white
        : const Color.fromRGBO(230, 230, 230, 1);

    return fillColor;
  }
  ///detects the hover color of the search test field
  Color hoverColorTextField() {
    Color hovorColor =
        isWeb ? Colors.white : const Color.fromRGBO(230, 230, 230, 1); //grey
    return hovorColor;
  }

  ///detects the border color of the search test field when it is focused
  Color focusBorderColorTextField() {
    Color focusBorderColor =
        isWeb ? Colors.blue : const Color.fromRGBO(230, 230, 230, 1); //grey
    return focusBorderColor;
  }

  ///detects the border color of the search test field when it is enabled
  Color enabledBorderColor() {
    Color enableBorderColor = isWeb
        ? (isHoveredTextField)
            ? Colors.blue
            : Colors.white
        : const Color.fromRGBO(230, 230, 230, 1); //grey
    return enableBorderColor;
  }

  ///Detects whether the text will be written LTR or RTL
  isRTLTextField() {
    ///In web, the text is always LTR
    isRTLText = isWeb
        ? false

        ///In App, detects RTL or LTR using [international.Bidi.detectRtlDirectionality] function
        : international.Bidi.detectRtlDirectionality(

                ///[international.Bidi.detectRtlDirectionality] function from [intl.dart]
                searchTextFieldcontroller.text //input text
                )
            ? true
            : false;
    notifyListeners();
  }
  ///detects whether [X] icon will appear or not
  closeIconAppearOrDisappear() {
    ///if the text is empty ==> close button disappear
    ///else it appears
    ///this func is called every change
    closeIcon = searchTextFieldcontroller.text.isEmpty
        ? const Icon(null)
        : const Icon(Icons.close, color: Colors.grey);
    notifyListeners();
  }

  ///Gets the List of stored search History
  getSearchHistory() async {
    ///shared preferences for cached data
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList("SearchHistory") != null) {
      ///Gets the saved data
      restoreSearchHistory = prefs.getStringList("SearchHistory")!;
    } else {
      //to avoid nullable call runtime error
      ///Gets empty list if the saved data is empty
      restoreSearchHistory = [];
    }
    notifyListeners();
  }
  ///Execures every change in the search text field
  onChangeTextField() {
    ///Detects the text direction according to the written text
    isRTLTextField();
    ///to detect whether to show the icon of delete or no ==>
    ///if the text in web is deleted ==> it will not be icon
    ///if a text is empty ==> make the close icon appear
    closeIconAppearOrDisappear();
  }

  ///Submits search input
  onSubmittingTextField(String searchinput) async {
    searchInput = searchinput;
    notifyListeners();

    ///1-sends the search request to the BE
    await sendSearchRequest(sortDropDownValue, tab, 1);

    ///2-Saves search history in the front of the list
    restoreSearchHistory!.insert(0, searchTextFieldcontroller.text);

    ///3-Saves the new list in the shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("SearchHistory", restoreSearchHistory!);
    notifyListeners();
  }

  ///Fills List of following / unfollowing Accounts
  fillFollowingList() {
    for (var i = 0; i < peoplesListData.length; i++) {
      isFollowing.add(peoplesListData[i].followed);

      ///Makes all follow button unhovered initially
      isHoveredFollowButton.add(false);
    }
  }

  ///Fills List of joining / unjoining accounts
  fillJoiningList() {
    for (var i = 0; i < communitiesListData.length; i++) {
      isJoining.add(communitiesListData[i].joined);

      ///Makes all join button unhovered initially
      isHoveredJoinButton.add(false);
    }
  }

  ///Detects when a search history is deleted using delete button
  deleteSearchHistory(int index) async {
    ///Removes this item from the search history list
    restoreSearchHistory!.removeAt(index);
    notifyListeners();

    ///Saves the updated list in the shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("SearchHistory", restoreSearchHistory!);
  }

  ///Returns List of widgets to search results
  List<SearchHistoryWidget> buildSearchHistoryColumn() {
    //to avoid nullable call in the following part of the code
    if (restoreSearchHistory == null) {
      return [];
    }

    ///Returns List of widgets that will appear
    List<SearchHistoryWidget> searchHistoryWidget = [];
    int lengthOfShowList = 0;

    ///In web, shows 5 elements at most
    ///In App, shows 3 elements at most
    if (isWeb && restoreSearchHistory!.length < 5 ||
        !isWeb && restoreSearchHistory!.length < 3) {
      lengthOfShowList = restoreSearchHistory!.length;
    } else {
      lengthOfShowList = isWeb ? 5 : 3;
    }
    ///form a widget and add it to the list that will be shown
    ///the list size is max 5 in web , max 3 in Appp
    for (int i = 0; i < lengthOfShowList; i++) {
      searchHistoryWidget.add(
        SearchHistoryWidget(
            ///the index of the widget(i) is sent to it (will be used when delete the item)
            ///the text is sent from the front of the list of search hoistory
            myIndex: i,
            textToShow: restoreSearchHistory![i]),
      );
    }
    return searchHistoryWidget;
  }

  ///Returns List of widgets to communities search results
  List<dynamic> buildPeopleInSearchListWidget() {
    ///If the data is still loading, show CircularProgressIndicator
    if (isLoading) {
      return [
        const Center(
          child: CircularProgressIndicator(),
        ),
      ];
    } else {
      ///Fills the list of followed/unfollowed accounts
      fillFollowingList();

      ///List of people widgets
      List<PeopleSearchResult> peopleSearchResultsWidgetList = [];

      ///Fills its data from the peopleList in the model class
      for (int i = 0; i < peoplesListData.length; i++) {
        peopleSearchResultsWidgetList.add(
          PeopleSearchResult(
            personData: peoplesListData[i],
            index: i,
          ),
        );
      }
      return peopleSearchResultsWidgetList;
    }
  }

  ///Returns List of widgets to posts search results
  List<dynamic> buildPostsInSearchListWidget() {
    ///If the data is still loading, show CircularProgressIndicator
    if (isLoading) {
      return [
        const Center(
          child: CircularProgressIndicator(),
        ),
      ];
    } else {
      ///List of posts widgets
      List<PostsSearchResult> postsSearchResultsWidgetList = [];

      ///Fills its data from the postsList in the model class
      for (int i = 0; i < postsListData.length; i++) {
        ///If the user is alowed to see NSFW content and [Safe Search] is disabled ,see all the posts
        if (!safeSearch && allowNsfw) {
          postsSearchResultsWidgetList.add(
            PostsSearchResult(
              postData: postsListData[i],
              index: i,
            ),
          );
        }

        ///If safe search is enabled or this user disabled NSFW ,Only safe posts will be shown
        else if (!postsListData[i].nsfw) {
          postsSearchResultsWidgetList.add(
            PostsSearchResult(
              postData: postsListData[i],
              index: i,
            ),
          );
        }
      }
      return postsSearchResultsWidgetList;
    }
  }

  ///Returns List of widgets to comments search results
  List<dynamic> buildCommentsInSearchListWidget() {
    ///If the data is still loading, show CircularProgressIndicator
    if (isLoading) {
      return [
        const Center(
          child: CircularProgressIndicator(),
        ),
      ];
    } else {
      ///List of comments widgets
      List<CommentsSearchResult> commentsSearchResultsWidgetList = [];

      ///Fills its data from the commentsList in the model class
      for (int i = 0; i < commentssListData.length; i++) {
        ///If the user is alowed to see NSFW content and [Safe Search] is disabled ,see all the comments
        if (!safeSearch && allowNsfw) {
          commentsSearchResultsWidgetList.add(
            CommentsSearchResult(
              commentData: commentssListData[i],
              index: i,
            ),
          );
        }

        ///If safe search is enabled or this user disabled NSFW ,Only comments on safe communities will be shown
        else if (!commentssListData[i].postData.nsfw) {
          commentsSearchResultsWidgetList.add(
            CommentsSearchResult(
              commentData: commentssListData[i],
              index: i,
            ),
          );
        }
      }
      return commentsSearchResultsWidgetList;
    }
  }

  ///Returns List of widgets to communities search results
  List<dynamic> buildCommunityInSearchListWidget() {
    ///If the data is still loading, show CircularProgressIndicator
    if (isLoading) {
      return [
        const Center(
          child: CircularProgressIndicator(),
        ),
      ];
    } else {
      ///Fills the list of joined/unjoined communities
      fillJoiningList();

      ///List of community widgets
      List<CommunitiesSearchResult> communitySearchResultsWidgetList = [];

      ///Fills its data from the communitiesList in the model class
      for (int i = 0; i < communitiesListData.length; i++) {
        ///If the user is alowed to see NSFW content and [Safe Search] is disabled ,see all the communities
        if (!safeSearch && allowNsfw) {
          communitySearchResultsWidgetList.add(
            CommunitiesSearchResult(
              communityData: communitiesListData[i],
              index: i,
            ),
          );
        }

        ///If safe search is enabled or this user disabled NSFW ,Only safe communities will be shown
        else if (!communitiesListData[i].nsfw) {
          communitySearchResultsWidgetList.add(
            CommunitiesSearchResult(
              communityData: communitiesListData[i],
              index: i,
            ),
          );
        }
      }
      return communitySearchResultsWidgetList;
    }
  }

  onPressingFollowButton(int index) {
    ///1-Sends follow/ UnFollow request to the API
    ///2-Changes the text of the follow button
    isFollowing[index] = !isFollowing[index];
    notifyListeners();
  }

  onPressingJoinButton(int index) {
    ///1-Sends join/ UnJoin request to the API
    ///2-Changes the text of the join button
    isJoining[index] = !isJoining[index];
    notifyListeners();
  }

  ///Detects when hover this follow button
  onHoverFollowButton(int i) {
    ///Whether this follow button is hovered or not
    isHoveredFollowButton[i] = true;
    notifyListeners();
  }

  ///Detects when hover this join button
  onHoverJoinButton(int i) {
    ///Whether this join button is hovered or not
    isHoveredJoinButton[i] = true;
    notifyListeners();
  }

  ///Detects when exit hovering this follow button
  onExitFollowButton(int i) {
    ///Whether this follow button is hovered or not
    isHoveredFollowButton[i] = false;
    notifyListeners();
  }

  ///Detects when exit hovering this join button
  onExitJoinButton(int i) {
    ///Whether this join button is hovered or not
    isHoveredJoinButton[i] = false;
    notifyListeners();
  }

  ///Calculates the number of days,months and years the person,post has been in Reddit
  ///Returns a formatted string
  calculateAge(DateTime createdAt) {
    String shownDate = '';
    int years = DateTime.now().year - createdAt.year;
    int months = DateTime.now().month - createdAt.month;
    int days = DateTime.now().day - createdAt.day;
    int hours = DateTime.now().hour - createdAt.hour;
    int minutes = DateTime.now().minute - createdAt.minute;
    int seconds = DateTime.now().second - createdAt.second;

    ///Negative value means the current second/minute/day/month is less than the DateTime of the post
    ///So we are in a minute/day/month/year after that one but not a full minute/day/month/year have passed
    ///So we subtract it
    ///   Ex:3/11/2022-5/12/2022
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

    ///Formats the shown period according to the Date and platform
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

  ///Stores sort type in [sortDropDownValue]
  changSortType(newValue) async {
    sortDropDownValue = newValue;

    ///Get the search results of the selected sort type
    await sendSearchRequest(sortDropDownValue, tab, 1);
    notifyListeners();
  }

  ///Changes safe search state
  toggleSafeSearchState() async {
    safeSearch = !safeSearch;
    notifyListeners();
  }

  ///changes the tab in the search resykts screen [posts,comments,users,comunities]
  changeTab(String thisTab) async {
    tab = thisTab;

    ///Get the search results of the selected type[tab]
    await sendSearchRequest(sortDropDownValue, tab, 1);
    notifyListeners();
  }

  ///Selects which request will be sent to the BE
  sendSearchRequest(String sort, String tab, int page) async {
    isLoading = true;
    notifyListeners();
    ///if the user selevts [posts](which is the default tab when we search)==>get posts
    if (tab == 'post') {
      await fillPostsList(searchInput, sortDropDownValue, tab, page);
    }
    ///if the user selevts [comments]==>get comments
    else if (tab == 'comment') {
      await fillCommentsList(searchInput, sortDropDownValue, tab, page);
    }
    ///if the user selevts [communities]==>get subreddits
    else if (tab == 'sr') {
      await fillCommunitiesList(searchInput, sortDropDownValue, tab, page);
    }
    ///if the user selevts [people]=>get usere
    else if (tab == 'user') {
      await fillUsersList(searchInput, sortDropDownValue, tab, page);
    }
    isLoading = false;
    notifyListeners();
  }
}
