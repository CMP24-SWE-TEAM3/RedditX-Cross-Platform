class PersonInSearch {
  String userName;
  int karma;
  String about;
  bool followed;
  String img;

  /// The date this user starts Reddit
  DateTime date;

  PersonInSearch({
    required this.userName,
    required this.karma,
    required this.about,
    required this.followed,
    required this.img,
    required this.date,
  });
}

//dummy data to test
//will be replaced with real data from the APIs
List<PersonInSearch> peoplesListData = [
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

/////////////////////////
//data of the in search results
class CommunityInSearch {
  String name;
  int membersCount;
  String img;
  String about;

  ///Whether you are joined this community or not
  bool joined;

  bool nsfw;

  CommunityInSearch({
    required this.name,
    required this.membersCount,
    required this.img,
    required this.about,
    required this.joined,
    required this.nsfw,
  });
}

//dummy data to test
//will be replaced with real data from the APIs
List<CommunityInSearch> communitiesListData = [];

class PostInSearch {
  String postText;
  String communityName;
  String userName;
  String communityIcon;
  String flairText;
  DateTime createdAt;
  int votesCount;
  int commentsCount;
  List<String> attachedMedia;
  bool nsfw;
  bool spoiler;
  PostInSearch({
    required this.postText,
    required this.communityName,
    required this.userName,
    required this.communityIcon,
    required this.flairText,
    required this.createdAt,
    required this.votesCount,
    required this.commentsCount,
    required this.attachedMedia,
    required this.nsfw,
    required this.spoiler,
  });
}

List<PostInSearch> postsListData = [];

class CommentInSearch {
  PostInSearch postData;
  String userName;
  String userAvatar;
  int commentVotesCount;
  DateTime createdAt;
  String commentText;
  CommentInSearch({
    required this.postData,
    required this.userName,
    required this.userAvatar,
    required this.commentVotesCount,
    required this.createdAt,
    required this.commentText,
  });
}

List<CommentInSearch> commentssListData = [];
