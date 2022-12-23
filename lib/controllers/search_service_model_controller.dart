import '../config/constants.dart';
import '../services/search_service.dart';
import '../models/search_model.dart';

///Function that uses the returned data from API or mock data to fill List of posts
fillPostsList(String searchPhrase, String sort, String tab, int page) async {
  if (iSMOCK) {
    ///if [iSMOCK] is true ==> fill the list with the mock data
    postsListData = postsListDataMock;
  } else {
    //////if [iSMOCK] is false ==> fill the list with the response data from the API
    ///The response of the API as list of results
    final res = await fetchSearchPosts(searchPhrase, sort, tab, page);
    for (int i = 0; i < res['results']!.length; i++) {
      postsListData.add(
        PostInSearch(
          attachedMedia: [],
          commentsCount: res['results']![i]['postComments'].length,
          communityIcon: res['results']![i]['communityID'] != null
              ? res['results']![i]['communityID']['icon']
              : 'default-icon.jpg',
          communityName: res['results']![i]['communityID'] != null
              ? res['results']![i]['communityID']['_id']
              : 'community1',
          createdAt: DateTime.parse(res['results']![i]['createdAt']),
          flairText: res['results']![i]['flairText'] ?? '',
          nsfw: res['results']![i]['nsfw'],
          postText: res['results']![i]['textHTML'],
          spoiler: res['results']![i]['spoiler'],
          userName: res['results']![i]['userID']['_id'],
          votesCount: res['results']![i]['votesCount'],
          textHTML: res['results']![i]['textHTML'],
          postType: res['results']![i]['type'],
        ),
      );
    }
  }
}

///Function that uses the returned data from API or mock data to fill List of comments
fillCommentsList(String searchPhrase, String sort, String tab, int page) async {
  if (iSMOCK) {
    ///if [iSMOCK] is true ==> fill the list with the mock data
    commentssListData = commentssListDataMock;
  } else {
    //////if [iSMOCK] is false ==> fill the list with the response data from the API
    ///The response of the API as list of results
    final res = await fetchSearchComments(searchPhrase, sort, tab, page);
    for (int i = 0; i < res.length; i++) {
      commentssListData.add(
        CommentInSearch(
          postData: PostInSearch(
            textHTML: '',
            postType: 'link',
            postText: res[i]['postID']['title'],
            communityName: 'u/communityName4',
            userName: res[i]['postID']['userID'],
            communityIcon: 'default-icon.jpg',
            flairText: '',
            createdAt: DateTime.parse(res[i]['postID']['createdAt']),
            votesCount: res[i]['postID']['votesCount'],
            commentsCount: res[i]['postID']['commentsNum'] ?? 1,
            attachedMedia: [],
            nsfw: true,
            spoiler: true,
          ),
          userAvatar: 'default-icon.jpg',
          userName: res[i]['authorId']['_id'],
          commentVotesCount: res[i]['votesCount'],
          createdAt: DateTime.parse(res[i]['createdAt']),
          commentText: res[i]['textJSON'],
        ),
      );
    }
  }
}

///Function that uses the returned data from API or mock data to fill List of communities
fillCommunitiesList(
    String searchPhrase, String sort, String tab, int page) async {
  if (iSMOCK) {
    ///if [iSMOCK] is true ==> fill the list with the mock data
    communitiesListData = communitiesListDataMock;
  } else {
    //////if [iSMOCK] is false ==> fill the list with the response data from the API
    ///The response of the API as list of results
    final res = await fetchSearchSR(searchPhrase, sort, tab, page);
    for (int i = 0; i < res.length; i++) {
      bool isJoined = false;
      final membersList = res[i]['membersCnt'];
      for (int j = 0; j < membersList.length; j++) {
        if (membersList[j]['userID'] == userName) {
          isJoined = true;
        }
      }
      communitiesListData.add(
        CommunityInSearch(
          about: res[i]['description'] ? res[i]['description'] : '',
          img: res[i]['icon'],
          joined: isJoined,
          membersCount: int.parse(res[i]['membersCnt']),
          name: res[i]['_id'],
          nsfw: res[i]['communityOptions']['nsfw'],
        ),
      );
    }
  }
}

///Function that uses the returned data from API or mock data to fill List of users
fillUsersList(String searchPhrase, String sort, String tab, int page) async {
  if (iSMOCK) {
    ///if [iSMOCK] is true ==> fill the list with the mock data
    peoplesListData = peoplesListDataMock;
  } else {
    //////if [iSMOCK] is false ==> fill the list with the response data from the API
    ///The response of the API as list of results
    final res = await fetchSearchusers(searchPhrase, sort, tab, page);
    for (int i = 0; i < res.lenght; i++) {
      peoplesListData.add(
        PersonInSearch(
          about: res[i]['about'],
          date: DateTime.parse(res[i]['createdAt']),
          followed: res[i]['followers'].contains(userName),
          img: res[i]['avatar'],
          karma: res[i]['karma'],
          userName: res[i]['_id'],
        ),
      );
    }
  }
}
