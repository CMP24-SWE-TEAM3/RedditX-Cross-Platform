import '../config/constants.dart';
import '../services/search_service.dart';
import '../models/search_model.dart';

///Function that uses the returned data from API to fill List of posts
fillPostsList(String searchPhrase, String sort, String tab, int page) async {
  if (iSMOCK) {
    postsListData = postsListDataMock;
  } else {
    ///The response of the API as map
    final res = await fetchSearchPosts(searchPhrase, sort, tab, page);
    for (int i = 0; i < res.lenght; i++) {
      postsListData.add(
        PostInSearch(
          attachedMedia: [],
          commentsCount: res[i]['membersCnt'](res[i]['postComments'].length),
          communityIcon: res[i]['communityID']['icon'],
          communityName: res[i]['communityID']['_id'],
          createdAt: DateTime.parse(res[i]['createdAt']),
          flairText: res[i]['flairText'],
          nsfw: res[i]['nsfw'],
          postText: '',
          spoiler: res[i]['spoiler'],
          userName: res[i]['userID']['_id'],
          votesCount: res[i]['membersCnt'](res[i]['votesCount']),
          textHTML: res[i]['textHTML'],
          postType: res[i]['type'],
        ),
      );
    }
  }
}

///Function that uses the returned data from API to fill List of comments
fillCommentsList(String searchPhrase, String sort, String tab, int page) async {
  if (iSMOCK) {
    commentssListData = commentssListDataMock;
  } else {
    ///The response of the API as map
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
            commentsCount: res[i]['postID']['commentsNum'],
            attachedMedia: [],
            nsfw: true,
            spoiler: true,
          ),
          userAvatar: res[i]['authorId']['avatar'],
          userName: res[i]['authorId']['_id'],
          commentVotesCount: int.parse(res[i]['votesCount']),
          createdAt: DateTime.parse(res[i]['createdAt']),
          commentText: res[i]['textJSON'],
        ),
      );
    }
  }
}

///Function that uses the returned data from API to fill List of communities
fillCommunitiesList(
    String searchPhrase, String sort, String tab, int page) async {
  if (iSMOCK) {
    communitiesListData = communitiesListDataMock;
  } else {
    final res = await fetchSearchSR(searchPhrase, sort, tab, page);
    for (int i = 0; i < res.lenght; i++) {
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

///Function that uses the returned data from API to fill List of users
fillUsersList(String searchPhrase, String sort, String tab, int page) async {
  if (iSMOCK) {
    peoplesListData = peoplesListDataMock;
  } else {
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
