/// Community Rule model: represents data of community rules
class CommunityRuleModel {
  /// Title of community rule
  String? title;

  /// Description of community rule
  String? description;

  /// Constructor of community rule
  CommunityRuleModel({required this.title, required this.description});
}

/// Flair model: represents data of flairs
class FlairModel {
  /// ID of flair
  String? flairID;

  /// Text of flair
  String? flairText;

  /// Color of flair text
  String? flairTextColor;

  /// Flair background
  String? flairBackGround;

  /// Determine whether the users can add flairs or not
  bool? flairModOnly;

  /// Determine whether the user can edit flairs or not
  bool? flairAllowUserEdits;

  /// Constructor of flair model
  FlairModel(
      {required this.flairID,
      required this.flairText,
      required this.flairTextColor,
      required this.flairBackGround,
      required this.flairModOnly,
      required this.flairAllowUserEdits});
}

/// Moderator Model
class ModeratorModel {
  /// User name of moderator
  String? userID;

  /// Indicates if the moderator is a creator or only moderator
  String? role;

  /// Constructor of Moderator model
  ModeratorModel({this.userID, this.role});
}

/// Community options model
class CommunityOptionsModel {
  /// Determines if users can mention an email
  bool? emailUsernameMention;

  /// Welcome message to new users
  String? welcomeMessage;

  /// Determines if users can upload images & links or not
  bool? allowImgAndLinksUploads;

  /// Determines if users can upload multiple images in a post
  bool? allowMultipleImagePerPost;

  /// Type of comment sort
  String? suggestedCommentSort;

  /// Type of post : text,image or link
  int? postType;

  /// Region of community
  String? region;

  /// Indicates the number of spams that make a post deleted
  int? spamsNumBeforeRemove;

  /// Constructor of Community options
  CommunityOptionsModel(
      {required this.emailUsernameMention,
      required this.welcomeMessage,
      required this.allowImgAndLinksUploads,
      required this.allowMultipleImagePerPost,
      required this.suggestedCommentSort,
      required this.postType,
      required this.region,
      required this.spamsNumBeforeRemove});
}

/// Community model
class CommunityModel {
  /// Community name
  String? id;

  /// Determines if the community content is adult content(+18) or not
  bool? nsfw;

  /// List of community rules
  List<CommunityRuleModel>? communityRules;

  /// Community options
  CommunityOptionsModel? communityOp;

  /// Description of community
  String? description;

  /// Background image of community
  late String? banner;

  /// Image of community
  late String? icon;

  /// Count of community members
  int? membersCnt;

  /// Indicates if the community is deleted or not
  bool? isDeleted;

  /// The date & time at which the community created
  DateTime? createdAt;

  /// Rank of community
  int? rank;

  /// Count of trend points
  int? trendPoints;

  /// List of flairs
  List<FlairModel>? flairList;

  /// List of moderators
  List<ModeratorModel?>? moderators;

  /// List of categories
  List<String>? categories;

  /// Type of privacy: private, public..
  String? privacyType;

  /// Constructor of Community model
  CommunityModel(
      {this.isDeleted = false,
      this.trendPoints,
      this.moderators,
      this.rank,
      this.communityRules,
      this.banner,
      this.categories,
      this.communityOp,
      this.description,
      this.flairList,
      this.icon,
      this.membersCnt = 1,
      required this.id,
      required this.privacyType,
      required this.nsfw,
      required this.createdAt,
      ModeratorModel? userMod //instance of ModeratorModel,

      }) {
    // membersCnt = 1;
    // isDeleted = false;
    // flairList = [];
    // moderators = [];
    // //moderators.append(userMod!);
    // communityRules = [];
  }
}

/// Instantiation from community model
/// dummy data to test
/// will be replaced with real data from the APIs

CommunityRuleModel communityRuleModel1 =
    CommunityRuleModel(title: "", description: "");

FlairModel flairModel1 = FlairModel(
    flairAllowUserEdits: true,
    flairBackGround: "",
    flairID: "",
    flairModOnly: true,
    flairText: "",
    flairTextColor: "");

ModeratorModel moderatorModel1 = ModeratorModel(role: "", userID: "");

CommunityOptionsModel communityOptionsModel = CommunityOptionsModel(
    allowImgAndLinksUploads: true,
    allowMultipleImagePerPost: true,
    welcomeMessage: "",
    emailUsernameMention: true,
    suggestedCommentSort: "",
    spamsNumBeforeRemove: 10,
    postType: 0,
    region: "");

List<dynamic> communityRules = [];
List<dynamic> communityRulesAPI = [];
List<dynamic> communityRulesMock = [
  CommunityRuleModel(
      title: "No sad content",
      description:
          "No sadcontent, such as pics of animals that have passed away (try /r/petloss), animals that have been injured/abused, or sob stories (e.g. found him in a dumpster, finding abandoned animals, sick/survived cancer)."),
  CommunityRuleModel(
      title: "No captioned pictures/videos",
      description:
          "No comics, captioned pictures/videos (try /r/lolcats, r/cute, or /r/animaltextgifs), or photos of just text. No memes or snapchat captions."),
  CommunityRuleModel(
      title: "No asking for upvotes or approval",
      description:
          "No post titles asking for upvotes or approval, such as (any love for...), (what does /r/aww think of...), or (this didn't get much love on...), or (karma machine), (sort by new), (don't scroll past), (not your typical aww), (r/aww needs more [X] animals,"
          "name my pet."),
  CommunityRuleModel(
      title: "No harassment",
      description:
          "This includes racial slurs, sexually inappropriate comments, and personal attacks on users or their animals.Examples include: pitbull statistics, reduction of animals to food items (e.g. calling a cow a burger/steak, calling a pig a bacon, anything about Asian people eating cats/dogs), advocating animal abuse, etc."),
  CommunityRuleModel(
      title: "No sad content",
      description:
          "No sadcontent, such as pics of animals that have passed away (try /r/petloss), animals that have been injured/abused, or sob stories (e.g. found him in a dumpster, finding abandoned animals, sick/survived cancer)."),
  CommunityRuleModel(
      title: "No captioned pictures/videos",
      description:
          "No comics, captioned pictures/videos (try /r/lolcats, r/cute, or /r/animaltextgifs), or photos of just text. No memes or snapchat captions."),
  CommunityRuleModel(
      title: "No asking for upvotes or approval",
      description:
          "No post titles asking for upvotes or approval, such as (any love for...), (what does /r/aww think of...), or (this didn't get much love on...), or (karma machine), (sort by new), (don't scroll past), (not your typical aww), (r/aww needs more [X] animals,"
          "name my pet."),
  CommunityRuleModel(
      title: "No harassment",
      description:
          "This includes racial slurs, sexually inappropriate comments, and personal attacks on users or their animals.Examples include: pitbull statistics, reduction of animals to food items (e.g. calling a cow a burger/steak, calling a pig a bacon, anything about Asian people eating cats/dogs), advocating animal abuse, etc."),
  CommunityRuleModel(
      title: "No sad content",
      description:
          "No sadcontent, such as pics of animals that have passed away (try /r/petloss), animals that have been injured/abused, or sob stories (e.g. found him in a dumpster, finding abandoned animals, sick/survived cancer)."),
  CommunityRuleModel(
      title: "No captioned pictures/videos",
      description:
          "No comics, captioned pictures/videos (try /r/lolcats, r/cute, or /r/animaltextgifs), or photos of just text. No memes or snapchat captions."),
  CommunityRuleModel(
      title: "No asking for upvotes or approval",
      description:
          "No post titles asking for upvotes or approval, such as (any love for...), (what does /r/aww think of...), or (this didn't get much love on...), or (karma machine), (sort by new), (don't scroll past), (not your typical aww), (r/aww needs more [X] animals,"
          "name my pet."),
  CommunityRuleModel(
      title: "No sad content",
      description:
          "No sadcontent, such as pics of animals that have passed away (try /r/petloss), animals that have been injured/abused, or sob stories (e.g. found him in a dumpster, finding abandoned animals, sick/survived cancer)."),
  CommunityRuleModel(
      title: "No captioned pictures/videos",
      description:
          "No comics, captioned pictures/videos (try /r/lolcats, r/cute, or /r/animaltextgifs), or photos of just text. No memes or snapchat captions."),
  CommunityRuleModel(
      title: "No asking for upvotes or approval",
      description:
          "No post titles asking for upvotes or approval, such as (any love for...), (what does /r/aww think of...), or (this didn't get much love on...), or (karma machine), (sort by new), (don't scroll past), (not your typical aww), (r/aww needs more [X] animals,"
          "name my pet."),
];
List communityRulesMock1 = communityRulesMock
    .map((e) => {'title': e.title, 'description': e.description})
    .toList();

List<dynamic> moderatorsAPI = [];
List<dynamic> moderators = [];
List<dynamic> moderatorsMock = [
  ModeratorModel(userID: "t2_Huda Ashraf", role: ""),
  ModeratorModel(userID: "t2_Huda Ashraf", role: ""),
  ModeratorModel(userID: "t2_Huda Ashraf", role: ""),
  ModeratorModel(userID: "t2_Huda Ashraf", role: ""),
  ModeratorModel(userID: "t2_Huda Ashraf", role: ""),
  ModeratorModel(userID: "t2_Huda Ashraf", role: ""),
  ModeratorModel(userID: "t2_Huda Ashraf", role: ""),
];
List moderatorsMock1 =
    moderatorsMock.map((e) => {'userID': e.userID, 'role': e.role}).toList();

CommunityModel communityModel1 = CommunityModel(
  membersCnt: 1720030,
  icon:
      "https://i.pinimg.com/564x/6f/29/00/6f290029bc26b8ead13bf3ad311acc03.jpg",
  banner:
      "https://i.pinimg.com/564x/3e/17/ce/3e17ce3b0066de9192f6b01df8ceb40a.jpg",
  createdAt: DateTime.now(),
  id: "Art",
  description:
      "This is a subreddit about art, where we are serious about art and artists, and discussing art in a mature, substantive way. READ THE RULES AND LOOK AT THE OTHER POSTS BEFORE POSTING. Be on your best behavior and do not comment unless you have something meaningful and mature to say. We are STRICTLY MODERATED and DO NOT give out warnings.",
  privacyType: "",
  nsfw: false,
);

Map<String, dynamic> communityInfoAPI = {};
Map<String, dynamic> communityInfo = {};
Map<String, dynamic> communityInfoMock = {
  'membersCnt': 1720030,
  'icon':
      "https://i.pinimg.com/564x/6f/29/00/6f290029bc26b8ead13bf3ad311acc03.jpg",
  'banner':
      "https://i.pinimg.com/564x/3e/17/ce/3e17ce3b0066de9192f6b01df8ceb40a.jpg",
  'createdAt': DateTime.now(),
  '_id': "Art",
  'description':
      "This is a subreddit about art, where we are serious about art and artists, and discussing art in a mature, substantive way. READ THE RULES AND LOOK AT THE OTHER POSTS BEFORE POSTING. Be on your best behavior and do not comment unless you have something meaningful and mature to say. We are STRICTLY MODERATED and DO NOT give out warnings.",
  'privacyType': "",
  'nsfw': false,
};

List<dynamic> communityFlairsAPI = [];
List<dynamic> communityFlairs = [];
List<dynamic> communityFlairsMock = [
  {
    'flairText': "flair1",
    'flairTextColor': "",
    'flairBackGround': "",
    'flairModOnly': false,
    'flairAllowUserEdit': "",
    '_id': ""
  },
  {
    'flairText': "flair2",
    'flairTextColor': "",
    'flairBackGround': "",
    'flairModOnly': false,
    'flairAllowUserEdit': "",
    '_id': ""
  },
  {
    'flairText': "flair3",
    'flairTextColor': "",
    'flairBackGround': "",
    'flairModOnly': false,
    'flairAllowUserEdit': "",
    '_id': ""
  }
];
