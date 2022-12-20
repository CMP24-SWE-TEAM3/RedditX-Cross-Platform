///user preferences model , which holds prefs values for the user
class UserPrefsModel {
  ///the user allows inbox messaging
  bool? emailPrivateMessage;

  ///country code for user
  String? countryCode;

  ///the user allows recieving emails for comment replies
  bool? emailCommentReply;

  ///the user allows recieving emails for upvoting his comments
  bool? emailUpVoteComment;

  ///the user allows recieving emails for his post replies
  bool? emailPostReply;

  ///the user allows recieving emails for upvotes on his posts
  bool? emailUpVote;

  ///the user unsubscribes from all emails , disable recieving any emails from reddit
  bool? emailUnsubscripeAll;

  ///the user enables public to vote on his posts
  bool? publicVotes;

  ///the user allows people to follow him
  bool? enableFollowers;

  ///the user allows highlighting new comments
  bool? highLightNewcomments;

  ///the user preferred comment sort type
  String? defaultCommentSort;

  ///the user allows NSFW content for his feed
  bool? labelNSFW;

  ///the user allows marking messages as read
  bool? markMessagesRead;

  ///the user prefers to link flair to be shown
  bool? showLinkFlair;

  ///the user prefers to show Location Based Recommendations
  bool? showLocationBasedRecommendation;

  ///the user allows over 18 results to be shown in search results
  bool? searchIncludeOver18;

  ///the user allows over 18 content
  bool? over18;

  ///the app's language for current user
  String? language;

  ///the user prefers showing posts in new window
  bool? showPostInNewWindow;

  ///the user allows recieving emails for incoming messages
  bool? emailMessages;

  ///the user allows threaded messages
  bool? threadedMessages;

  ///the user preferes that trending is shown in his feed
  bool? prefShowTrending;

  ///constructor for prefs model with default initial values
  UserPrefsModel() {
    emailPrivateMessage = true;
    emailCommentReply = true;
    emailUpVoteComment = true;
    emailUnsubscripeAll = true;
    defaultCommentSort = "new";
    enableFollowers = true;
    prefShowTrending = true;
  }

  get canCreateSubreddit => null;
}

///voting model
class VoteModel {
  ///post ID
  int? postID;

  ///Vote Type up or down
  int? voteType;

  ///constructor for vote model
  VoteModel({this.postID, this.voteType});
}

///moderator model class
class ModeratorModel {
  ///id of community moderated
  String? communityId;

  ///moderation role
  String? role;

  ///constructor for moderator model
  ModeratorModel({this.communityId, this.role});
}

///Me model
class MeModel {
  ///get email upon new followers
  bool? emailUserNewFollwer;

  ///get email upon user mentions
  bool? emailUsernameMention;

  ///get email upon upvoting your post
  bool? emailUpVotePost;

  ///constructor for men model
  MeModel(
      {this.emailUserNewFollwer,
      this.emailUsernameMention,
      this.emailUpVotePost});
}

///About model class
class AboutModel {
  ///is the user whose about will be viewed be blocked or not
  bool? isBlocked;

  ///is the user whose about will be viewed mod or not
  bool? isMod;

  ///is this user will be shown on trending or not
  bool? prefShowTrending;

  /// user accepts followers or not
  bool? acceptFollowers;

  ///constructor for accept followers
  AboutModel(
      {this.isBlocked,
      this.isMod,
      this.prefShowTrending,
      this.acceptFollowers});
}

///memner model
class MemberModel {
  ///member's community's ID
  String? communityId;

  ///is this member muted?
  bool? isMuted;

  ///is this member banned?
  bool? isBanned;

  ///constructor for member model
  MemberModel({this.communityId, this.isMuted, this.isBanned});
}

///User model for current user
class UserModel {
  ///preferences of user
  UserPrefsModel userPrefs = UserPrefsModel();

  ///meModel of current user
  MeModel meReturn = MeModel();

  ///About model of current user
  AboutModel aboutReturn = AboutModel();

  ///current user's username
  String? username;

  ///current user's inbox count
  int? inboxCount;

  ///can current user create subreddit or not?
  bool? canCreateSubreddit;

  ///current user's friends count
  int? friendsCount;

  ///current user's avatar or profile picture
  String? avatar;

  ///current user's email
  String? email;

  ///current user's password reset token
  String? passwordResetToken;

  ///current user's post Karma count
  int? postKarma;

  ///current user's comment karma count
  int? commentKarma;

  ///current user's karma count
  int? karma;

  ///current user's birthday
  String? birthdate;

  ///current user's phone number
  String? phoneNumber;

  ///current user's created at data
  DateTime? createdAt;

  ///Does current user have a reddit password or not?
  bool? isPasswordSet;

  ///Date in which password Reset Expires
  DateTime? passwordResetExpires;

  ///Date in which last password change occurred
  DateTime? passwordChangedAt;

  ///does current user has verified email or not?
  bool? hasVerifiedEmail;

  ///curent user's gender
  String? gender;

  ///curent user's about
  String? about;

  ///curent user's type
  String? type;

  ///List of curent user's friend Request to him
  List<String>? friendRequestToMe;

  ///List of curent user's friend Request from him
  List<String>? friendRequestFromMe;

  ///List of curent user's friends
  List<String>? friend;

  ///List of curent user's blocked from him
  List<String>? blocksFromMe;

  ///List of curent user's blocked to him
  List<String>? blocksToMe;

  ///List of curent user's followings
  List<String>? follows;

  ///List of curent user's followers
  List<String>? followers;

  ///List of curent user's members in his subreddit
  List<MemberModel> member = [];

  ///List of curent user's moderator roles in subreddits
  List<ModeratorModel> moderators = [];

  ///List of curent user's preferred categories
  List<String>? categories;

  ///List of curent user's posts
  List<String>? hasPost;

  ///List of curent user's coments
  List<String>? hasComment;

  ///List of curent user's replies
  List<String>? hasReply;

  ///List of curent user's votes
  List<String>? hasVote;

  ///List of curent user's follow posts
  List<String>? followPost;

  ///List of curent user's saved posts
  List<String>? savedPosts;

  ///List of curent user's posts mentioned in
  List<String>? mentionedInPosts;

  ///List of curent user's notifications
  List<String>? notifications;

  ///List of curent user's voted comments
  List<String>? votedComments;

  ///List of curent user's comments mentioned in
  List<String>? mentionedInComments;

  ///constructor for current user model
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

  get over18 => null;
}

///instance of current user
UserModel? currentUser = UserModel(
    username: "guest",
    type: "not bare email",
    email: "mamdouhteachertraining@gmail.com",
    createdAt: DateTime(2022));

Map<String, dynamic> userProfileAboutMock = {
  'followerCount': 4,
  'createdAt': "2022-12-01T20:37:45.112Z",
  'linkKarma': 5,
  'commentKarma': 3,
  'totalKarma': 8,
  'about': "about",
  'avatar':
      'https://i.pinimg.com/564x/3e/17/ce/3e17ce3b0066de9192f6b01df8ceb40a.jpg',
  'userID': 'Heba'
};

Map<String, dynamic> userProfileAboutAPI = {};
Map<String, dynamic> userProfileAbout = {};

List<dynamic> userProfileCommentsMock = [
  {
    "authorId": "t2_shredan1",
    "text": "new comment1",
    "votesCount": 1,
    "createdAt": "2022-12-01T20:37:45.112Z",
    "replyingTo": "637becd563fc9ec2d423d0c0",
    "voteType": 1
  },
  {
    "authorId": "t2_shredan2",
    "text": "new comment2",
    "votesCount": 2,
    "createdAt": "2022-12-01T20:37:45.112Z",
    "replyingTo": "637becd563fc9ec2d423d0c0",
    "voteType": -1,
  },
  {
    "authorId": "t2_shredan3",
    "text": "new comment3",
    "votesCount": 3,
    "createdAt": "2022-12-01T20:37:45.112Z",
    "replyingTo": "637becd563fc9ec2d423d0c0",
    "voteType": 1,
  }
];

List<dynamic> userProfileCommentsAPI = [];
List<dynamic> userProfileComments = [];

List<dynamic> commentsPostTitles = [];
List<dynamic> commentsPostTitlesAPI = [];
List<dynamic> commentsPostTitlesMock = ['title1', 'title2', 'title3'];

List<dynamic> profilePostsCommunityAvatars = [];
List<dynamic> profilePostsCommunityAvatarsAPI = [];
List<dynamic> profilePostsCommunityMock = [
  'https://i.pinimg.com/564x/3e/17/ce/3e17ce3b0066de9192f6b01df8ceb40a.jpg',
  'https://i.pinimg.com/564x/3e/17/ce/3e17ce3b0066de9192f6b01df8ceb40a.jpg',
  'https://i.pinimg.com/564x/3e/17/ce/3e17ce3b0066de9192f6b01df8ceb40a.jpg',
  'https://i.pinimg.com/564x/3e/17/ce/3e17ce3b0066de9192f6b01df8ceb40a.jpg',
  'https://i.pinimg.com/564x/3e/17/ce/3e17ce3b0066de9192f6b01df8ceb40a.jpg'
];
List<dynamic> votersProfileMock = [];
List<dynamic> votersProfileAPI = [];
List<dynamic> votersProfile = [];

List<dynamic> votersHomeMock = [];
List<dynamic> votersHomeAPI = [];
List<dynamic> votersHome = [];

List<dynamic> votersCommunityMock = [];
List<dynamic> votersCommunityAPI = [];
List<dynamic> votersCommunity = [];

List<dynamic> profilePostsVotesType =
    List.filled(votersProfile.length, 7, growable: true);
List<dynamic> profilePostsVotesTypeMock =
    List.filled(votersProfile.length, 7, growable: true);
List<dynamic> homePostsVotesType =
    List.filled(votersHome.length, 7, growable: true);
List<dynamic> communityPostsVotesType =
    List.filled(votersCommunity.length, 7, growable: true);

List<Map<String, dynamic>> profilePostsMock = [
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
List<dynamic> profilePostsAPI = [];
List<dynamic> profilePosts = [];

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

List<dynamic> savedPostsIDs = [];

List<dynamic> upvotedPostsIDs = [];

List<dynamic> downvotedPostsIDs = [];
