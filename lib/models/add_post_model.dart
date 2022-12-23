class Flair {
  final String flairID;
  final String flairText;
  final String flairBackGround;
  final String flairTextColor;

  Flair({
    required this.flairID,
    required this.flairText,
    required this.flairBackGround,
    required this.flairTextColor,
  });
}

class CommunityInAddPost {
  final String communityName;
  final String communityIcon;
  final int membersCount;
  final bool nsfw;
  CommunityInAddPost({
    required this.communityName,
    required this.communityIcon,
    required this.membersCount,
    required this.nsfw,
  });
}

class CommunityRuleModel {
  /// Title of community rule
  String? title;

  /// Description of community rule
  String? description;

  /// Constructor of community rule
  CommunityRuleModel({required this.title, required this.description});
}

List<CommunityInAddPost> communitiesInAddPost = [];

List<CommunityRuleModel> communityRules = [];

List<Flair> flairs = [];

List<Flair> communityFlairsMock = [
  Flair(
    flairBackGround: '#009900',
    flairID: '',
    flairText: 'flair1',
    flairTextColor: '#ff4d4d',
  ),
  Flair(
    flairBackGround: '#00802b',
    flairID: '',
    flairText: 'flair2',
    flairTextColor: '#bf8040',
  ),
  Flair(
    flairBackGround: '#8585ad',
    flairID: '',
    flairText: 'flair3',
    flairTextColor: '#000000',
  ),
  Flair(
    flairBackGround: '#cc33ff',
    flairID: '',
    flairText: 'flair4',
    flairTextColor: '#ffffff',
  ),
];

List<CommunityRuleModel> communityRulesMock = [
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

List<CommunityInAddPost> communitiesInAddPostMock = [
  CommunityInAddPost(
    communityIcon: 'default-icon.jpg',
    communityName: 'r/Palastine',
    membersCount: 1002,
    nsfw: true,
  ),
  CommunityInAddPost(
    communityIcon: 'default-icon.jpg',
    communityName: 'r/Arabs',
    membersCount: 102,
    nsfw: false,
  )
];
