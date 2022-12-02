import '../config/constants.dart';
import '../services/search_service.dart';
import '../models/search_model.dart';

///Function that uses the returned data from API to fill List of posts
fillPostsList(String searchPhrase, String sort, String tab, int page) async {
  if (iSMOCK) {
    postsListData = [
      PostInSearch(
        postText:
            'World War II or the Second Worl all of the great powers—forming two opposing military alliances: the Allies and the Axis powers. World War II was a total war that directly involved more than 100 million personnel from more than 30 countries. The major participants in the war threw their entire economic, industrial, and scientific capabilities behind the war effort, blurring the distinction between civilian and military resources. Aircraft played a major role in the conflict, enabling the strategic bombing of population centres and deploying the only two nuclear weapons ever used in war. World War II was by far the deadliest conflict in human history; it resulted in 70 to 85 million fatalities, mostly among civilians. Tens of millions died due to genocides (including the Holocaust), starvation, massacres, and disease. In the wake of the Axis defeat, Germany and Japan were occupied, and war crimes tribunals were conducted against German and Japanese leaders.',
        communityName: 'u/communityName1',
        userName: 'u/userName1',
        communityIcon:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2C8Z76bai2hfofGkaRDN2E_WAozCYOLL7ONbCgmSEQg&s',
        flairText: 'News',
        createdAt: DateTime(2021, 10, 30),
        votesCount: 125,
        commentsCount: 0,
        attachedMedia: [],
        nsfw: false,
        spoiler: true,
      ),
      PostInSearch(
        postText:
            'World War II or the Second World War, often abbreviated as WWII or WW2, was a global war that lasted from 1937 to 1945. It involved the vast majority of the worlds countries—including all of the great powers—forming two opposing military alliances: the Allies and the Axis powers. World War II was a total war that directly involved more than 100 million personnel from more than 30 countries. The major participants in the war threw their entire economic, industrial, and scientific capabilities behind the war effort, blurring the distinction between civilian and military resources. Aircraft played a major role in the conflict, enabling the strategic bombing of population centres and deploying the only two nuclear weapons ever used in war. World War II was by far the deadliest conflict in human history; it resulted in 70 to 85 million fatalities, mostly among civilians. Tens of millions died due to genocides (including the Holocaust), starvation, massacres, and disease. In the wake of the Axis defeat, Germany and Japan were occupied, and war crimes tribunals were conducted against German and Japanese leaders.',
        communityName: 'u/communityName2',
        userName: 'u/userName2',
        communityIcon:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFU7U2h0umyF0P6E_yhTX45sGgPEQAbGaJ4g&usqp=CAU',
        flairText: 'Politics',
        createdAt: DateTime(2021, 11, 7),
        votesCount: -1555,
        commentsCount: 123,
        attachedMedia: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2C8Z76bai2hfofGkaRDN2E_WAozCYOLL7ONbCgmSEQg&s',
        ],
        nsfw: true,
        spoiler: true,
      ),
      PostInSearch(
        postText:
            'World War II or the Second World War, often abbreviated as WWII or WW2, was a global war that lasted from 1937 to 1945. It involved the vast majority of the worlds countries—including all of the great powers—forming two opposing military alliances: the Allies and the Axis powers. World War II was a total war that directly involved more than 100 million personnel from more than 30 countries. The major participants in the war threw their entire economic, industrial, and scientific capabilities behind the war effort, blurring the distinction between civilian and military resources. Aircraft played a major role in the conflict, enabling the strategic bombing of population centres and deploying the only two nuclear weapons ever used in war. World War II was by far the deadliest conflict in human history; it resulted in 70 to 85 million fatalities, mostly among civilians. Tens of millions died due to genocides (including the Holocaust), starvation, massacres, and disease. In the wake of the Axis defeat, Germany and Japan were occupied, and war crimes tribunals were conducted against German and Japanese leaders.',
        communityName: 'u/communityName3',
        userName: 'u/userName3',
        communityIcon:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOd256TcC6vcaQ99TYzoP0pBbch9_Q-bbrmw&usqp=CAU',
        flairText: '',
        createdAt: DateTime(2021, 12, 5),
        votesCount: 1002,
        commentsCount: 25,
        attachedMedia: [],
        nsfw: false,
        spoiler: true,
      ),
      PostInSearch(
        postText:
            'World War II or the Second World War, often abbreviated as WWII or WW2, was a global war that lasted from 1937 to 1945. It involved the vast majority of the worlds countries—including all of the great powers—forming two opposing military alliances: the Allies and the Axis powers. World War II was a total war that directly involved more than 100 million personnel from more than 30 countries. The major participants in the war threw their entire economic, industrial, and scientific capabilities behind the war effort, blurring the distinction between civilian and military resources. Aircraft played a major role in the conflict, enabling the strategic bombing of population centres and deploying the only two nuclear weapons ever used in war. World War II was by far the deadliest conflict in human history; it resulted in 70 to 85 million fatalities, mostly among civilians. Tens of millions died due to genocides (including the Holocaust), starvation, massacres, and disease. In the wake of the Axis defeat, Germany and Japan were occupied, and war crimes tribunals were conducted against German and Japanese leaders.',
        communityName: 'u/communityName4',
        userName: 'u/userName4',
        communityIcon:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvQRXWBKMqCQ4zssn7Ik5PI7IY0gZwih_i_g&usqp=CAU',
        flairText: '',
        createdAt: DateTime(2022, 11, 2),
        votesCount: 2102233,
        commentsCount: 123456,
        attachedMedia: [],
        nsfw: true,
        spoiler: true,
      ),
    ];
  } else {
    ///The response of the API as map
    final postRes = await fetchSearchPosts(searchPhrase, sort, tab, page);
    for (int i = 0; i < postRes['results']!.length; i++) {
      postsListData.add(
        PostInSearch(
          communityIcon: 'https://i.redd.it/amfv7gtqkzr81.png',
          commentsCount: postRes['results']![i].containsKey('commentsNum')
              ? postRes['results']![i]['commentsNum']
              : postRes['results']![i]['insightCnt'],
          attachedMedia: (postRes['results']![i]['attachments'].length != 0)
              ? [
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2C8Z76bai2hfofGkaRDN2E_WAozCYOLL7ONbCgmSEQg&s'
                ]
              : [],
          spoiler: postRes['results']![i]['spoiler'],
          votesCount: postRes['results']![i]['votesCount'],
          postText: postRes['results']![i]['text'],
          userName: postRes['results']![i]['userID'],
          nsfw: postRes['results']![i]['nsfw'],
          createdAt: DateTime.parse(postRes['results']![i]['createdAt']),
          flairText: !postRes['results']![i].containsKey('flairText')
              ? ''
              : postRes['results']![i]['flairText'],
          communityName: postRes['results']![i].containsKey('communityID')
              ? postRes['results']![i]['communityID']
              : 'community_22',
        ),
      );
    }
  }
}

///Function that uses the returned data from API to fill List of comments
fillCommentsList(String searchPhrase, String sort, String tab, int page) async {
  if (iSMOCK) {
    commentssListData = [
      CommentInSearch(
        postData: postsListData[0],
        userName: 'userName1',
        userAvatar: 'https://i.redd.it/amfv7gtqkzr81.png',
        commentVotesCount: 90,
        createdAt: DateTime(2021, 10, 30),
        commentText:
            'It is the comment text It is the comment text It is the comment text It is the comment text',
      ),
      CommentInSearch(
        postData: postsListData[3],
        userName: 'userName2',
        userAvatar: 'https://i.redd.it/amfv7gtqkzr81.png',
        commentVotesCount: 0,
        createdAt: DateTime(2021, 11, 7),
        commentText:
            'It is the comment2 text It is the comment2 text It is the comment2 text It is the comment2 text',
      ),
      CommentInSearch(
        postData: postsListData[1],
        userName: 'userName3',
        userAvatar:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbGAMLuWQcxug2Gvm-1f1fIZLG-zSVcTTQxQ&usqp=CAU',
        commentVotesCount: 1002255,
        createdAt: DateTime(2022, 11, 5, 6),
        commentText:
            'It is the comment3 text It is the comment3 text It iscomment3',
      ),
      CommentInSearch(
        postData: postsListData[1],
        userName: 'userName4',
        userAvatar: 'https://i.redd.it/pk65imsi8vo81.png',
        commentVotesCount: 1002255,
        createdAt: DateTime(2022, 11, 4, 15),
        commentText: 'test comment test test comment',
      ),
      CommentInSearch(
        postData: postsListData[2],
        userName: 'userName5',
        userAvatar:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbGAMLuWQcxug2Gvm-1f1fIZLG-zSVcTTQxQ&usqp=CAU',
        commentVotesCount: 211,
        createdAt: DateTime(2021, 12, 5),
        commentText: 'comment discussing Russia occupation ',
      ),
      CommentInSearch(
        postData: postsListData[0],
        userName: 'userName6',
        userAvatar:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSACDL-cvlRyR0Q9IQ6C9CBw6FFzruMC_-I4A&usqp=CAU',
        commentVotesCount: 1002,
        createdAt: DateTime(2022, 11, 2),
        commentText: 'Elon Mask bought Twitter!',
      ),
    ];
  } else {
    ///The response of the API as map
    final commentsRes =
        await fetchSearchComments(searchPhrase, sort, tab, page);
    for (int i = 0; i < commentsRes['results']!.length; i++) {
      commentssListData.add(CommentInSearch(
        postData: postsListData[0],
        userAvatar: 'https://i.redd.it/pk65imsi8vo81.png',
        userName: commentsRes['results']![i]['authorId'],
        commentVotesCount: commentsRes['results']![i]['votesCount'],
        createdAt: DateTime.parse(commentsRes['results']![i]['createdAt']),
        commentText: commentsRes['results']![i]['text'],
      ));
    }
  }
}

///Function that uses the returned data from API to fill List of communities
fillCommunitiesList(
    String searchPhrase, String sort, String tab, int page) async {
  if (iSMOCK) {
    communitiesListData = [
      CommunityInSearch(
        nsfw: true,
        name: 'CommunityName1',
        img:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2C8Z76bai2hfofGkaRDN2E_WAozCYOLL7ONbCgmSEQg&s',
        about: 'Reddit community for test purpose',
        membersCount: 1220,
        joined: true,
      ),
      CommunityInSearch(
        nsfw: false,
        name: 'CommunityName2',
        img:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFU7U2h0umyF0P6E_yhTX45sGgPEQAbGaJ4g&usqp=CAU',
        about: 'CommunityName2 is a community for memes',
        membersCount: 152,
        joined: false,
      ),
      CommunityInSearch(
        nsfw: false,
        name: 'CommunityName3',
        img:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvQRXWBKMqCQ4zssn7Ik5PI7IY0gZwih_i_g&usqp=CAU',
        about: 'Ablut text About Text',
        membersCount: 37,
        joined: false,
      ),
      CommunityInSearch(
        nsfw: false,
        name: 'CommunityName4',
        img:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnTo6TDNKkt5BW4MzI3YMaB9fEap7PneWulj2oE2JSC4tYaHEkN5q86ybgF7v8HGnlxD4&usqp=CAU',
        about: 'Islamic history community',
        membersCount: 11586,
        joined: false,
      ),
      CommunityInSearch(
        nsfw: false,
        name: 'CommunityName5',
        img:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOd256TcC6vcaQ99TYzoP0pBbch9_Q-bbrmw&usqp=CAU',
        about: 'world news community',
        membersCount: 111222333,
        joined: true,
      ),
      CommunityInSearch(
        nsfw: false,
        name: 'CommunityName6',
        img:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFU7U2h0umyF0P6E_yhTX45sGgPEQAbGaJ4g&usqp=CAU',
        about: '',
        membersCount: 113,
        joined: false,
      ),
    ];
  } else {
    communitiesListData = [
      CommunityInSearch(
        nsfw: true,
        name: 'CommunityName1',
        img:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2C8Z76bai2hfofGkaRDN2E_WAozCYOLL7ONbCgmSEQg&s',
        about: 'Reddit community for test purpose',
        membersCount: 1220,
        joined: true,
      ),
      CommunityInSearch(
        nsfw: false,
        name: 'CommunityName2',
        img:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFU7U2h0umyF0P6E_yhTX45sGgPEQAbGaJ4g&usqp=CAU',
        about: 'CommunityName2 is a community for memes',
        membersCount: 152,
        joined: false,
      ),
      CommunityInSearch(
        nsfw: false,
        name: 'CommunityName3',
        img:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvQRXWBKMqCQ4zssn7Ik5PI7IY0gZwih_i_g&usqp=CAU',
        about: 'Ablut text About Text',
        membersCount: 37,
        joined: false,
      ),
      CommunityInSearch(
        nsfw: false,
        name: 'CommunityName4',
        img:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnTo6TDNKkt5BW4MzI3YMaB9fEap7PneWulj2oE2JSC4tYaHEkN5q86ybgF7v8HGnlxD4&usqp=CAU',
        about: 'Islamic history community',
        membersCount: 11586,
        joined: false,
      ),
      CommunityInSearch(
        nsfw: false,
        name: 'CommunityName5',
        img:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOd256TcC6vcaQ99TYzoP0pBbch9_Q-bbrmw&usqp=CAU',
        about: 'world news community',
        membersCount: 111222333,
        joined: true,
      ),
      CommunityInSearch(
        nsfw: false,
        name: 'CommunityName6',
        img:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFU7U2h0umyF0P6E_yhTX45sGgPEQAbGaJ4g&usqp=CAU',
        about: '',
        membersCount: 113,
        joined: false,
      ),
    ];
  }
}

///Function that uses the returned data from API to fill List of users
fillUsersList(String searchPhrase, String sort, String tab, int page) async {
  if (iSMOCK) {
    peoplesListData = [
      PersonInSearch(
        userName: 'UserName1',
        karma: 2500,
        about: '',
        followed: true,
        img: 'https://i.redd.it/amfv7gtqkzr81.png',
        date: DateTime(2021, 10, 2),
      ),
      PersonInSearch(
        userName: 'UserName2',
        karma: 36,
        about: '',
        followed: true,
        img: 'https://i.redd.it/amfv7gtqkzr81.png',
        date: DateTime(2021, 10, 2),
      ),
      PersonInSearch(
        userName: 'UserName3',
        karma: 3255,
        about: 'This is about UserName3 info',
        followed: true,
        img:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbGAMLuWQcxug2Gvm-1f1fIZLG-zSVcTTQxQ&usqp=CAU',
        date: DateTime(2021, 10, 2),
      ),
      PersonInSearch(
        userName: 'UserName4',
        karma: 11223,
        about: '',
        followed: true,
        img: 'https://i.redd.it/pk65imsi8vo81.png',
        date: DateTime(2021, 10, 2),
      ),
      PersonInSearch(
        userName: 'UserName5',
        karma: 2334,
        about: '',
        followed: true,
        img:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbGAMLuWQcxug2Gvm-1f1fIZLG-zSVcTTQxQ&usqp=CAU',
        date: DateTime(2021, 10, 2),
      ),
      PersonInSearch(
        userName: 'UserName6',
        karma: 252112,
        about: 'UserName6 UserName6 UserName6 UserName6 about text',
        followed: false,
        img:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSACDL-cvlRyR0Q9IQ6C9CBw6FFzruMC_-I4A&usqp=CAU',
        date: DateTime(2022, 3, 2),
      ),
      PersonInSearch(
        userName: 'UserName7',
        karma: 25123456,
        about: 'About text of UserName7',
        followed: false,
        img: 'https://i.redd.it/ym0nsl4yrgq71.jpg',
        date: DateTime(2022, 10, 20),
      ),
      PersonInSearch(
        userName: 'UserName8',
        karma: 7123456,
        about: 'UserName8 information ',
        followed: false,
        img: 'https://i.redd.it/ym0nsl4yrgq71.jpg',
        date: DateTime(2021, 12, 20),
      ),
    ];
  } else {
    peoplesListData = [
      PersonInSearch(
        userName: 'UserName1',
        karma: 2500,
        about: '',
        followed: true,
        img: 'https://i.redd.it/amfv7gtqkzr81.png',
        date: DateTime(2021, 10, 2),
      ),
      PersonInSearch(
        userName: 'UserName2',
        karma: 36,
        about: '',
        followed: true,
        img: 'https://i.redd.it/amfv7gtqkzr81.png',
        date: DateTime(2021, 10, 2),
      ),
      PersonInSearch(
        userName: 'UserName3',
        karma: 3255,
        about: 'This is about UserName3 info',
        followed: true,
        img:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbGAMLuWQcxug2Gvm-1f1fIZLG-zSVcTTQxQ&usqp=CAU',
        date: DateTime(2021, 10, 2),
      ),
      PersonInSearch(
        userName: 'UserName4',
        karma: 11223,
        about: '',
        followed: true,
        img: 'https://i.redd.it/pk65imsi8vo81.png',
        date: DateTime(2021, 10, 2),
      ),
      PersonInSearch(
        userName: 'UserName5',
        karma: 2334,
        about: '',
        followed: true,
        img:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbGAMLuWQcxug2Gvm-1f1fIZLG-zSVcTTQxQ&usqp=CAU',
        date: DateTime(2021, 10, 2),
      ),
      PersonInSearch(
        userName: 'UserName6',
        karma: 252112,
        about: 'UserName6 UserName6 UserName6 UserName6 about text',
        followed: false,
        img:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSACDL-cvlRyR0Q9IQ6C9CBw6FFzruMC_-I4A&usqp=CAU',
        date: DateTime(2022, 3, 2),
      ),
      PersonInSearch(
        userName: 'UserName7',
        karma: 25123456,
        about: 'About text of UserName7',
        followed: false,
        img: 'https://i.redd.it/ym0nsl4yrgq71.jpg',
        date: DateTime(2022, 10, 20),
      ),
      PersonInSearch(
        userName: 'UserName8',
        karma: 7123456,
        about: 'UserName8 information ',
        followed: false,
        img: 'https://i.redd.it/ym0nsl4yrgq71.jpg',
        date: DateTime(2021, 12, 20),
      ),
    ];
  }
}
