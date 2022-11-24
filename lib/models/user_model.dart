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
