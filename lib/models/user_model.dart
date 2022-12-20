class UserPrefsModel {
  bool? emailPrivateMessage;
  String? countryCode;
  bool? emailCommentReply;
  bool? emailUpVoteComment;
  bool? emailPostReply;
  bool? emailUpVote;
  bool? emailUnsubscripeAll;
  bool? publicVotes;
  bool? enableFollowers;
  bool? highLightNewcomments;
  String? defaultCommentSort;
  bool? labelNSFW;
  bool? markMessagesRead;
  bool? liveOrangereds;
  bool? showLinkFlair;
  bool? showLocationBasedRecommendation;
  bool? searchIncludeOver18;
  bool? over18;
  String? language;
  bool? showPostInNewWindow;
  bool? emailMessages;
  bool? threadedMessages;
  bool? prefShowTrending;

  UserPrefsModel() {
    emailPrivateMessage = true;
    emailCommentReply = true;
    emailUpVoteComment = true;
    emailUnsubscripeAll = true;
    defaultCommentSort = "new";
    enableFollowers = true;
    prefShowTrending = true;
  }
}

class VoteModel {
  int? postID;
  int? voteType;
  VoteModel({this.postID, this.voteType});
}

class ModeratorModel {
  String? communityId;
  String? role;
  ModeratorModel({this.communityId, this.role});
}

class MeModel {
  bool? emailUserNewFollwer;
  bool? emailUsernameMention;
  bool? emailUpVotePost;
  MeModel(
      {this.emailUserNewFollwer,
      this.emailUsernameMention,
      this.emailUpVotePost});
}

class AboutModel {
  bool? isBlocked;
  bool? isMod;
  bool? prefShowTrending;
  bool? acceptFollowers;
  AboutModel(
      {this.isBlocked,
      this.isMod,
      this.prefShowTrending,
      this.acceptFollowers});
}

class MemberModel {
  bool? communityId;
  bool? isMuted;
  bool? isBanned;
  MemberModel({this.communityId, this.isMuted, this.isBanned});
}

class UserModel {
  UserPrefsModel? userPrefs;
  MeModel? meReturn;
  AboutModel? aboutReturn;
  String? username;
  int? inboxCount;
  bool? canCreateSubreddit;
  int? friendsCount;
  String? avatar;
  String? email;
  String? passwordResetToken;
  int? postKarma;
  int? commentKarma;
  int? karma;
  String? birthdate;
  String? phoneNumber;
  DateTime? createdAt;
  bool? isPasswordSet;
  DateTime? passwordResetExpires;
  DateTime? passwordChangedAt;
  bool? hasVerifiedEmail;
  String? gender;
  String? about;
  String? type;
  List<String>? friendRequestToMe;
  List<String>? friendRequestFromMe;
  List<String>? friend;
  List<String>? blocksFromMe;
  List<String>? blocksToMe;
  List<String>? follows;
  List<String>? followers;
  List<MemberModel>? member;
  List<ModeratorModel>? moderators;
  List<String>? categories;
  List<String>? hasPost;
  List<String>? hasComment;
  List<String>? hasReply;
  List<String>? hasVote;
  List<String>? followPost;
  List<String>? savedPosts;
  List<String>? mentionedInPosts;
  List<String>? notifications;
  List<String>? votedComments;
  List<String>? mentionedInComments;
  UserModel(
      {required this.username,
      required this.email,
      required this.type,
      required this.createdAt}) {
    isPasswordSet = (type == 'bare email') ? true : false;
    friendsCount = 0;
    friendRequestToMe = [];
    friendRequestFromMe = [];
    friend = [];
    blocksFromMe = [];
    blocksToMe = [];
    follows = [];
    followers = [];
    member = [];
    moderators = [];
    categories = [];
    hasPost = [];
    hasComment = [];
    hasReply = [];
    hasVote = [];
    followPost = [];
    savedPosts = [];
    mentionedInPosts = [];
    notifications = [];
    votedComments = [];
    mentionedInComments = [];
  }
}

UserModel currentUser = UserModel(
    username: "_3mona",
    type: "not bare email",
    email: "mamdouhteachertraining@gmail.com",
    createdAt: DateTime(2022));


Map<String,dynamic>userProfileAboutMock={
  'followerCount':4,
  'createdAt':"2022-12-01T20:37:45.112Z",
  'linkKarma':5,
  'commentKarma':3,
  'totalKarma':8,
  'about':"about",
  'avatar':'https://i.pinimg.com/564x/3e/17/ce/3e17ce3b0066de9192f6b01df8ceb40a.jpg',
  'userID':'Heba'
};

Map<String,dynamic>userProfileAboutAPI={};
Map<String,dynamic>userProfileAbout={};


List<dynamic>userProfileCommentsMock=[
  {
    "authorId": "t2_shredan1",
    "text": "new comment1",
    "votesCount": 1,
    "createdAt": "2022-12-01T20:37:45.112Z",
    "replyingTo": "637becd563fc9ec2d423d0c0",
    "voteType":1
  },{
    "authorId": "t2_shredan2",
    "text": "new comment2",
    "votesCount": 2,
    "createdAt": "2022-12-01T20:37:45.112Z",
    "replyingTo": "637becd563fc9ec2d423d0c0",
    "voteType": -1,
  },{
    "authorId": "t2_shredan3",
    "text": "new comment3",
    "votesCount": 3,
    "createdAt": "2022-12-01T20:37:45.112Z",
    "replyingTo": "637becd563fc9ec2d423d0c0",
    "voteType": 1,
  }
];

List<dynamic>userProfileCommentsAPI=[];
List<dynamic>userProfileComments=[];

List<dynamic>commentsPostTitles=[];
List<dynamic> commentsPostTitlesAPI = [];
List<dynamic> commentsPostTitlesMock = ['title1','title2','title3'];

List<dynamic>profilePostsCommunityAvatars=[];
List<dynamic> profilePostsCommunityAvatarsAPI = [];
List<dynamic> profilePostsCommunityMock = [
  'https://i.pinimg.com/564x/3e/17/ce/3e17ce3b0066de9192f6b01df8ceb40a.jpg',
  'https://i.pinimg.com/564x/3e/17/ce/3e17ce3b0066de9192f6b01df8ceb40a.jpg',
  'https://i.pinimg.com/564x/3e/17/ce/3e17ce3b0066de9192f6b01df8ceb40a.jpg',
  'https://i.pinimg.com/564x/3e/17/ce/3e17ce3b0066de9192f6b01df8ceb40a.jpg',
  'https://i.pinimg.com/564x/3e/17/ce/3e17ce3b0066de9192f6b01df8ceb40a.jpg'

];
List<dynamic> votersProfileMock = [];
List<dynamic>votersProfileAPI=[];
List<dynamic>votersProfile =[];

List<dynamic> votersHomeMock = [];
List<dynamic> votersHomeAPI = [];
List<dynamic> votersHome = [];

List<dynamic> votersCommunityMock = [];
List<dynamic> votersCommunityAPI = [];
List<dynamic> votersCommunity = [];

List<dynamic>profilePostsVotesType=List.filled(votersProfile.length, 7, growable: true);
List<dynamic> profilePostsVotesTypeMock =
    List.filled(votersProfile.length, 7, growable: true);
List<dynamic> homePostsVotesType = List.filled(votersHome.length, 7, growable: true);
List<dynamic> communityPostsVotesType = List.filled(votersCommunity.length, 7, growable: true);





List<Map<String, dynamic>>profilePostsMock= [
  {
    "locked": false,
    "postComments": [],
    "_id": "637e57153b02dbf1e1d98009",
    "title": "Post Mock 1",
    "text":
        "post text mock",
    "isDeleted": false,
    "attachments": [],
    "spoiler": false,
    "nsfw": true,
    "insightCnt": 6400,
    "spamCount": 0,
    "votesCount": 1,
    "flairID": "25ed",
    "flairText": "hero",
    "flairTextColor": "#5511ff",
    "flairBackGround": "#552244",
    "createdAt": "2022-11-23T17:22:30.574Z",
    "followers": [],
    "communityID": {
      '_id':"t5_imagePro235",
      'icon':
          'https://i.pinimg.com/564x/3e/17/ce/3e17ce3b0066de9192f6b01df8ceb40a.jpg'
    },
    "userID": {
      "_id": "t2_hamada",
      "avatar": "user-t2_hamada-1668263597432.jpg"
    },
    "voters": [
      {"userID": "t2_hamada", "voteType": 1, "_id": "637e57153b02dbf1e1d9800a"}
    ],
    "mintionedInUsers": [],
    "spammers": [],
    "__v": 0,
    "commentsNum": 1,
    "type": "text",
    "textHTML": "text html mock1 "
  },
  {
    "locked": false,
    "_id": "6390fa5ac53c03c7766940b8",
    "title": "Post mock 2",
    "text":
        "post text 1",
    "isDeleted": false,
    "attachments": [],
    "spoiler": false,
    "type": "image",
    "nsfw": true,
    "insightCnt": 4176,
    "spamCount": 0,
    "votesCount": 1,
    "flairID": "25ed",
    "flairText": "hero",
    "flairTextColor": "#5511ff",
    "flairBackGround": "#552244",
    "createdAt": "2022-12-07T20:37:13.802Z",
    "followers": [],
    "userID": {
      "_id": "t2_hamada",
      "avatar": "user-t2_hamada-1668263597432.jpg"
    },
       "communityID": {
      '_id': "t5_imagePro235",
      'icon':
          'https://i.pinimg.com/564x/3e/17/ce/3e17ce3b0066de9192f6b01df8ceb40a.jpg'
    },
    "voters": [
      {"userID": "t2_hamada", "voteType": 1, "_id": "6390fa5ac53c03c7766940b9"}
    ],
    "mintionedInUsers": [],
    "postComments": [],
    "spammers": [],
    "__v": 0,
    "textHTML": "text html mock2"
  }
];
List<dynamic> profilePostsAPI=[];
List<dynamic> profilePosts=[];



List<Map<String, dynamic>> savedPostsMock = [
  {
    "locked": false,
    "postComments": [],
    "_id": "637e57153b02dbf1e1d98009",
    "title": "Post Mock 1",
    "text": "post text mock",
    "isDeleted": false,
    "attachments": [],
    "spoiler": false,
    "nsfw": true,
    "insightCnt": 6400,
    "spamCount": 0,
    "votesCount": 1,
    "flairID": "25ed",
    "flairText": "hero",
    "flairTextColor": "#5511ff",
    "flairBackGround": "#552244",
    "createdAt": "2022-11-23T17:22:30.574Z",
    "followers": [],
    "communityID": {
      '_id': "t5_imagePro235",
      'icon':
          'https://i.pinimg.com/564x/3e/17/ce/3e17ce3b0066de9192f6b01df8ceb40a.jpg'
    },
    "userID": {
      "_id": "t2_hamada",
      "avatar": "user-t2_hamada-1668263597432.jpg"
    },
    "voters": [
      {"userID": "t2_hamada", "voteType": 1, "_id": "637e57153b02dbf1e1d9800a"}
    ],
    "mintionedInUsers": [],
    "spammers": [],
    "__v": 0,
    "commentsNum": 1,
    "type": "text",
    "textHTML": "text html mock1 "
  },
  {
    "locked": false,
    "_id": "6390fa5ac53c03c7766940b8",
    "title": "Post mock 2",
    "text": "post text 1",
    "isDeleted": false,
    "attachments": [],
    "spoiler": false,
    "type": "image",
    "nsfw": true,
    "insightCnt": 4176,
    "spamCount": 0,
    "votesCount": 1,
    "flairID": "25ed",
    "flairText": "hero",
    "flairTextColor": "#5511ff",
    "flairBackGround": "#552244",
    "createdAt": "2022-12-07T20:37:13.802Z",
    "followers": [],
    "userID": {
      "_id": "t2_hamada",
      "avatar": "user-t2_hamada-1668263597432.jpg"
    },
    "communityID": {
      '_id': "t5_imagePro235",
      'icon':
          'https://i.pinimg.com/564x/3e/17/ce/3e17ce3b0066de9192f6b01df8ceb40a.jpg'
    },
    "voters": [
      {"userID": "t2_hamada", "voteType": 1, "_id": "6390fa5ac53c03c7766940b9"}
    ],
    "mintionedInUsers": [],
    "postComments": [],
    "spammers": [],
    "__v": 0,
    "textHTML": "text html mock2"
  }
];
List<dynamic> savedPostsAPI = [];
List<dynamic> savedPosts = [];



List<Map<String, dynamic>> upvotedPostsMock = [
  {
    "locked": false,
    "postComments": [],
    "_id": "637e57153b02dbf1e1d98009",
    "title": "Post Mock 1",
    "text": "post text mock",
    "isDeleted": false,
    "attachments": [],
    "spoiler": false,
    "nsfw": true,
    "insightCnt": 6400,
    "spamCount": 0,
    "votesCount": 1,
    "flairID": "25ed",
    "flairText": "hero",
    "flairTextColor": "#5511ff",
    "flairBackGround": "#552244",
    "createdAt": "2022-11-23T17:22:30.574Z",
    "followers": [],
    "communityID": {
      '_id': "t5_imagePro235",
      'icon':
          'https://i.pinimg.com/564x/3e/17/ce/3e17ce3b0066de9192f6b01df8ceb40a.jpg'
    },
    "userID": {
      "_id": "t2_hamada",
      "avatar": "user-t2_hamada-1668263597432.jpg"
    },
    "voters": [
      {"userID": "t2_hamada", "voteType": 1, "_id": "637e57153b02dbf1e1d9800a"}
    ],
    "mintionedInUsers": [],
    "spammers": [],
    "__v": 0,
    "commentsNum": 1,
    "type": "text",
    "textHTML": "text html mock1 "
  },
  {
    "locked": false,
    "_id": "6390fa5ac53c03c7766940b8",
    "title": "Post mock 2",
    "text": "post text 1",
    "isDeleted": false,
    "attachments": [],
    "spoiler": false,
    "type": "image",
    "nsfw": true,
    "insightCnt": 4176,
    "spamCount": 0,
    "votesCount": 1,
    "flairID": "25ed",
    "flairText": "hero",
    "flairTextColor": "#5511ff",
    "flairBackGround": "#552244",
    "createdAt": "2022-12-07T20:37:13.802Z",
    "followers": [],
    "userID": {
      "_id": "t2_hamada",
      "avatar": "user-t2_hamada-1668263597432.jpg"
    },
    "communityID": {
      '_id': "t5_imagePro235",
      'icon':
          'https://i.pinimg.com/564x/3e/17/ce/3e17ce3b0066de9192f6b01df8ceb40a.jpg'
    },
    "voters": [
      {"userID": "t2_hamada", "voteType": 1, "_id": "6390fa5ac53c03c7766940b9"}
    ],
    "mintionedInUsers": [],
    "postComments": [],
    "spammers": [],
    "__v": 0,
    "textHTML": "text html mock2"
  }
];
List<dynamic> upvotedPostsAPI = [];
List<dynamic> upvotedPosts = [];


List<Map<String, dynamic>> downvotedPostsMock = [
  {
    "locked": false,
    "postComments": [],
    "_id": "637e57153b02dbf1e1d98009",
    "title": "Post Mock 1",
    "text": "post text mock",
    "isDeleted": false,
    "attachments": [],
    "spoiler": false,
    "nsfw": true,
    "insightCnt": 6400,
    "spamCount": 0,
    "votesCount": 1,
    "flairID": "25ed",
    "flairText": "hero",
    "flairTextColor": "#5511ff",
    "flairBackGround": "#552244",
    "createdAt": "2022-11-23T17:22:30.574Z",
    "followers": [],
    "communityID": {
      '_id': "t5_imagePro235",
      'icon':
          'https://i.pinimg.com/564x/3e/17/ce/3e17ce3b0066de9192f6b01df8ceb40a.jpg'
    },
    "userID": {
      "_id": "t2_hamada",
      "avatar": "user-t2_hamada-1668263597432.jpg"
    },
    "voters": [
      {"userID": "t2_hamada", "voteType": 1, "_id": "637e57153b02dbf1e1d9800a"}
    ],
    "mintionedInUsers": [],
    "spammers": [],
    "__v": 0,
    "commentsNum": 1,
    "type": "text",
    "textHTML": "text html mock1 "
  },
  {
    "locked": false,
    "_id": "6390fa5ac53c03c7766940b8",
    "title": "Post mock 2",
    "text": "post text 1",
    "isDeleted": false,
    "attachments": [],
    "spoiler": false,
    "type": "image",
    "nsfw": true,
    "insightCnt": 4176,
    "spamCount": 0,
    "votesCount": 1,
    "flairID": "25ed",
    "flairText": "hero",
    "flairTextColor": "#5511ff",
    "flairBackGround": "#552244",
    "createdAt": "2022-12-07T20:37:13.802Z",
    "followers": [],
    "userID": {
      "_id": "t2_hamada",
      "avatar": "user-t2_hamada-1668263597432.jpg"
    },
    "communityID": {
      '_id': "t5_imagePro235",
      'icon':
          'https://i.pinimg.com/564x/3e/17/ce/3e17ce3b0066de9192f6b01df8ceb40a.jpg'
    },
    "voters": [
      {"userID": "t2_hamada", "voteType": 1, "_id": "6390fa5ac53c03c7766940b9"}
    ],
    "mintionedInUsers": [],
    "postComments": [],
    "spammers": [],
    "__v": 0,
    "textHTML": "text html mock2"
  }
];
List<dynamic> downvotedPostsAPI = [];
List<dynamic> downvotedPosts = [];


List<dynamic>savedPostsIDs=[];


