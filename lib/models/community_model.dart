class CommunityModel {
  // String communityID;
  String description;
  String name;
  String banner;
  String icon;
  int membersCount;

  CommunityModel(
      {required this.description,
      required this.name,
      required this.banner,
      required this.icon,
      required this.membersCount});
}

CommunityModel communityModel1 = CommunityModel(
    description:
        "This is a subreddit about art, where we are serious about art and artists, and discussing art in a mature, substantive way. READ THE RULES AND LOOK AT THE OTHER POSTS BEFORE POSTING. Be on your best behavior and do not comment unless you have something meaningful and mature to say. We are STRICTLY MODERATED and DO NOT give out warnings.",
    name: "Art",
    banner:
        "https://i.pinimg.com/564x/3e/17/ce/3e17ce3b0066de9192f6b01df8ceb40a.jpg",
    icon:
        "https://i.pinimg.com/564x/6f/29/00/6f290029bc26b8ead13bf3ad311acc03.jpg",
    membersCount: 1720030);
