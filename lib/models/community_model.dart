class CommunityModel {
  // String communityID;
  String description;
  String name;
  String banner;
  String icon;
  String welcomeMessage;
  String region;
  String privacyType;
  bool nfsw;
  bool allowImgAndLinksUploads;
  bool allowMultipleImagePerPost;
  int suggestedCommentSort;
  DateTime createdAt;
  String category;
  List<Map<String, String>> fAQs;
  List<Map<String, String>> communityRules;

  CommunityModel(
      {required this.description,
      required this.name,
      required this.banner,
      required this.icon,
      required this.welcomeMessage,
      required this.allowImgAndLinksUploads,
      required this.allowMultipleImagePerPost,
      required this.category,
      required this.communityRules,
      required this.createdAt,
      required this.fAQs,
      required this.nfsw,
      required this.privacyType,
      required this.region,
      required this.suggestedCommentSort});
}
