import 'community_model.dart';

/// User ID model
class UserID {
  String? userID;
  String? avatar;

  UserID({required this.userID, required this.avatar});
}

/// Spams model: represents Spams of a post.
class SpamModel {
  /// ID of spammer
  String? spammerID;

  /// Type of spam
  String? spamType;

  /// Content of spam
  String? spamText;

  /// Spam constructor
  SpamModel({required spammerID, required spamType, required spamText});
}

/// Vote model: contains vote type and vote id.
class VoteModel {
  /// ID of the post which contains this vote
  String? postID;

  /// Vote type:  up/down
  int? voteType;

  /// Vote constructor
  VoteModel({this.postID, this.voteType});
}

/// Post model: represents the post.
class PostModel {
  String? id;

  /// Post title
  String? title;

  /// Post text
  String? text;
  String? textHTML;

  String? textJSON;

  /// Indicates whether the post is deleted or not
  bool? isDeleted;

  /// determines the post type: "image","text" or "link"
  String? type;

  /// attachments if the post type is image or link
  List<String>? attachments;

  /// Indicates if the post is spoiler or not
  bool? spoiler;

  /// Indicates if the post is nsfw or not
  bool? nsfw;

  /// Insight count of the post
  int? insightCnt;

  /// Count of spams of the post
  int? spamCount;

  /// Count of votes on the post
  int? votesCount;

  /// ID of post flair
  String? flairID;

  /// Text of flair
  String? flairText;

  /// Color of flair text
  String? flairTextColor;

  /// Color of flair background
  String? flairBackGround;

  /// Date & Time at which the post created
  DateTime? createdAt;

  /// List of the post followers
  List<String>? followers;

  /// Community name if the post posted in community
  String? communityID;

  /// User name of the user who posted the post
  UserID? userID;

  /// List of the spammers of the post
  List<SpamModel>? spammers;

  /// List of mentioned users
  List<String>? mentionedInUsers;

  /// Count of comments
  int? commentsNum;

  /// Constructor of Post model
  PostModel(
      {required this.id,
      required this.title,
      required this.spoiler,
      required this.nsfw,
      required this.createdAt,
      required this.userID,
      required this.type,
      this.attachments,
      this.commentsNum = 0,
      this.mentionedInUsers,
      this.spammers,
      this.communityID,
      this.followers,
      this.flairBackGround,
      this.flairTextColor,
      this.flairText,
      this.flairID,
      this.votesCount = 1,
      this.spamCount = 0,
      this.insightCnt,
      this.isDeleted = false,
      this.textHTML,
      this.text});
}

/// List of posts whether API or mock
List<dynamic> communityPostsList = [];

/// List of real posts (from API)
List<dynamic> communityPostsListAPI = [];

/// List of post model
/// dummy data to test
/// will be replaced with real data from the APIs

List<Map<String, dynamic>> communityPostsListMock = [
  {
    'id': "639ab04cd0388bee70b25ee3",
    'votesCount': 7500,
    'communityID': communityModel1.id,
    'commentsNum': 3400,
    'attachments': [
      "https://i.pinimg.com/originals/0d/22/ae/0d22ae6fe219f106395c2901968e167e.gif",
      "https://i.pinimg.com/originals/0d/22/ae/0d22ae6fe219f106395c2901968e167e.gif",
      "https://i.pinimg.com/originals/0d/22/ae/0d22ae6fe219f106395c2901968e167e.gif"
    ],
    'title':
        "“I dream my painting and I paint my dream.”― Vincent Willem van Gogh",
    'spoiler': true,
    'nsfw': false,
    'createdAt': DateTime(2022, 11, 8, 12, 30),
    'userID': {
      '_id': "t2_Huda Ashraf",
      'avatar':
          "https://i.pinimg.com/564x/07/6b/62/076b62cf375a4d1a009d7e501fd8f451.jpg",
    },
    'type': "image",
  },
  {
    'id': "639ab04cd0388bee70b25ee1",
    'votesCount': 50,
    'communityID': communityModel1.id,
    'commentsNum': 300,
    'textHTML':
        "“...and then, I have nature and art and poetry, and if that is not enough, what is enough?”― Vincent Willem van Gogh",
    'title':
        "“...and then, I have nature and art and poetry, and if that is not enough, what is enough?”― Vincent Willem van Gogh",
    'spoiler': true,
    'nsfw': false,
    'createdAt': DateTime(2022, 11, 8, 12, 30),
    'userID': {
      '_id': "t2_Doaa Mohamed",
      'avatar':
          "https://i.pinimg.com/564x/bf/ce/68/bfce68d80c7f012f15b46e2e6ecc4a8a.jpg",
    },
    'type': "text",
  },
  {
    'id': "639ab04cd0388bee70b25ee2",
    'votesCount': 150,
    'communityID': communityModel1.id,
    'commentsNum': 100,
    'attachments': [
      "https://i.pinimg.com/564x/60/9d/04/609d04f9f059aa65a99955bf9a8b348e.jpg"
    ],
    'textHTML':
        "<p>...and then, I have nature and art and poetry, and if that is not enough, what is enough?”― Vincent Willem van Gogh</p>",
    'title':
        "Japanese artist and art university graduate Gotte have turned their creative skills towards a very cool subject. Their light-hearted watercolor animal drawings depict a typical day in their adorable pet's life - a cute hamster named Sukeroku.",
    'spoiler': true,
    'nsfw': false,
    'createdAt': DateTime(2022, 11, 8, 12, 30),
    'userID': {
      '_id': "t2_Mariam",
      'avatar':
          "https://i.pinimg.com/564x/aa/ba/7a/aaba7ada0085c9ec7d275baaa84405a6.jpg",
    },
    'type': "image",
  },
  {
    'id': "639ab04cd0388bee70b25ee4",
    'votesCount': 1500,
    'communityID': communityModel1.id,
    'commentsNum': 1000,
    'attachments': [
      "https://www.nevuefineartmarketing.com/4-amazing-artist-websites-you-should-see/?utm_source=pinterest&utm_medium=social&utm_campaign=SocialWarfare"
    ],
    'textHTML':
        "Professional artist websites are essential to the success of any aspiring artist selling art online or locally.Building an online presence goes a long way in getting an artist’s name out there.It is crucial to have a well-designed website that will separate your art business from all of the other artists selling art online",
    'title':
        "Professional artist websites are essential to the success of any aspiring artist selling art online or locally.Building an online presence goes a long way in getting an artist’s name out there.It is crucial to have a well-designed website that will separate your art business from all of the other artists selling art online",
    'spoiler': true,
    'nsfw': false,
    'createdAt': DateTime(2022, 11, 3),
    'userID': {
      '_id': "t2_Eman Ashraf",
      'avatar':
          "https://i.pinimg.com/564x/f0/a2/a4/f0a2a413909960c4bc3dd29b4e1d69ee.jpg",
    },
    'type': "link",
  },
  {
    'id': "639ab04cd0388bee70b25ee5",
    'votesCount': 50,
    'communityID': communityModel1.id,
    'commentsNum': 140,
    'attachments': [
      "https://www.nevuefineartmarketing.com/4-amazing-artist-websites-you-should-see/?utm_source=pinterest&utm_medium=social&utm_campaign=SocialWarfare"
    ],
    'textHTML':
        "Professional artist websites are essential to the success of any aspiring artist selling art online or locally.Building an online presence goes a long way in getting an artist’s name out there.It is crucial to have a well-designed website that will separate your art business from all of the other artists selling art online",
    'title':
        "Professional artist websites are essential to the success of any aspiring artist selling art online or locally.Building an online presence goes a long way in getting an artist’s name out there.It is crucial to have a well-designed website that will separate your art business from all of the other artists selling art online",
    'spoiler': true,
    'nsfw': false,
    'createdAt': DateTime(2022, 10, 26),
    'userID': {
      '_id': "t2_Zahraa",
      'avatar':
          "https://i.pinimg.com/564x/d8/3e/24/d83e2410c042538202fb8c9bce9a3f01.jpg",
    },
    'type': "text",
  },
  {
    'id': "639ab04cd0388bee70b25ee6",
    'votesCount': 80,
    'communityID': communityModel1.id,
    'commentsNum': 900,
    'attachments': [
      "https://i.pinimg.com/564x/c9/92/64/c9926411478ce371609e61fc76fecaf0.jpg"
    ],
    'textHTML':
        "Professional artist websites are essential to the success of any aspiring artist selling art online or locally.Building an online presence goes a long way in getting an artist’s name out there.It is crucial to have a well-designed website that will separate your art business from all of the other artists selling art online",
    'title':
        "Professional artist websites are essential to the success of any aspiring artist selling art online or locally.Building an online presence goes a long way in getting an artist’s name out there.It is crucial to have a well-designed website that will separate your art business from all of the other artists selling art online",
    'spoiler': true,
    'nsfw': false,
    'createdAt': DateTime(2021, 10, 2),
    'userID': {
      '_id': "t2_Salma Mohamed",
      'avatar':
          "https://i.pinimg.com/564x/1e/39/8d/1e398d1ef51258540cc600438594b343.jpg",
    },
    'type': "image",
  },
  {
    'id': "639ab04cd0388bee70b25ee7",
    'votesCount': 200,
    'communityID': communityModel1.id,
    'commentsNum': 40,
    'attachments': [
      "https://www.creativefounders.com/art-websites-aspiring-artist/"
    ],
    'textHTML': "10 Art Websites Every Aspiring Artist Should Know",
    'title': "10 Art Websites Every Aspiring Artist Should Know",
    'spoiler': true,
    'nsfw': false,
    'createdAt': DateTime(2022, 10, 22),
    'userID': {
      '_id': "t2_Hend",
      'avatar':
          "https://i.pinimg.com/564x/dc/6b/7d/dc6b7da2bb455dd400fc986e34dfa2f7.jpg",
    },
    'type': "link",
  },
  {
    'id': "639ab04cd0388bee70b25ee7",
    'votesCount': 200,
    'communityID': communityModel1.id,
    'commentsNum': 40,
    'attachments': [
      "https://i.pinimg.com/564x/bf/23/a9/bf23a9053df8a9b82b6aee33cb35cafb.jpg"
    ],
    'textHTML':
        "<p>...and then, I have nature and art and poetry, and if that is not enough, what is enough?”― Vincent Willem van Gogh</p>",
    'title':
        "Colored Pencil Techniques. Abstracts with purple flowers to give you ideas for coloring. #coloredpenciltechniques",
    'spoiler': true,
    'nsfw': false,
    'createdAt': DateTime(2021, 5, 2),
    'userID': {
      '_id': "t2_Israa",
      'avatar':
          "https://i.pinimg.com/564x/dc/6b/7d/dc6b7da2bb455dd400fc986e34dfa2f7.jpg",
    },
    'type': "image",
  },
];

/// User model
class UserModelMock {
  final String avatar;

  /// User model constructor
  UserModelMock({required this.avatar});
}

List<PostModel> postsListMock = [
  PostModel(
    id: "639ab04cd0388bee70b25ee3",
    votesCount: 7500,
    communityID: communityModel1.id,
    commentsNum: 3400,
    attachments: [
      "https://i.pinimg.com/originals/0d/22/ae/0d22ae6fe219f106395c2901968e167e.gif",
      "https://i.pinimg.com/originals/0d/22/ae/0d22ae6fe219f106395c2901968e167e.gif",
      "https://i.pinimg.com/originals/0d/22/ae/0d22ae6fe219f106395c2901968e167e.gif"
    ],
    title:
        "“I dream my painting and I paint my dream.”― Vincent Willem van Gogh",
    spoiler: true,
    nsfw: false,
    createdAt: DateTime(2022, 11, 8, 12, 30),
    userID: UserID(
        userID: "t2_Huda Ashraf",
        avatar:
            "https://i.pinimg.com/564x/07/6b/62/076b62cf375a4d1a009d7e501fd8f451.jpg"),
    type: "img",
  ),
  PostModel(
    id: "639ab04cd0388bee70b25ee1",
    votesCount: 50,
    communityID: communityModel1.id,
    commentsNum: 120,
    title:
        "“...and then, I have nature and art and poetry, and if that is not enough, what is enough?”― Vincent Willem van Gogh",
    text:
        "“...and then, I have nature and art and poetry, and if that is not enough, what is enough?”― Vincent Willem van Gogh",
    spoiler: true,
    nsfw: false,
    createdAt: DateTime(2022, 11, 8, 10, 30),
    userID: UserID(
        userID: "t2_Doaa Mohamed",
        avatar:
            "https://i.pinimg.com/564x/bf/ce/68/bfce68d80c7f012f15b46e2e6ecc4a8a.jpg"),
    type: "text",
  ),
  PostModel(
    id: "639ab04cd0388bee70b25ee2",
    votesCount: 150,
    communityID: communityModel1.id,
    commentsNum: 100,
    attachments: [
      "https://i.pinimg.com/564x/60/9d/04/609d04f9f059aa65a99955bf9a8b348e.jpg"
    ],
    title:
        "Japanese artist and art university graduate Gotte have turned their creative skills towards a very cool subject. Their light-hearted watercolor animal drawings depict a typical day in their adorable pet's life - a cute hamster named Sukeroku.",
    spoiler: true,
    nsfw: false,
    createdAt: DateTime(2022, 11, 7, 11, 30),
    userID: UserID(
        userID: "t2_Mariam",
        avatar:
            "https://i.pinimg.com/564x/aa/ba/7a/aaba7ada0085c9ec7d275baaa84405a6.jpg"),
    type: "img",
  ),
  PostModel(
    id: "639ab04cd0388bee70b25ee4",
    votesCount: 1500,
    communityID: communityModel1.id,
    commentsNum: 1000,
    attachments: [
      "https://www.nevuefineartmarketing.com/4-amazing-artist-websites-you-should-see/?utm_source=pinterest&utm_medium=social&utm_campaign=SocialWarfare"
    ],
    title:
        "Professional artist websites are essential to the success of any aspiring artist selling art online or locally.Building an online presence goes a long way in getting an artist’s name out there.It is crucial to have a well-designed website that will separate your art business from all of the other artists selling art online",
    spoiler: true,
    nsfw: false,
    createdAt: DateTime(2022, 11, 3),
    userID: UserID(
        userID: "t2_Eman Ashraf",
        avatar:
            "https://i.pinimg.com/564x/f0/a2/a4/f0a2a413909960c4bc3dd29b4e1d69ee.jpg"),
    type: "link",
  ),
  PostModel(
      id: "639ab04cd0388bee70b25ee5",
      spoiler: true,
      nsfw: false,
      attachments: [""],
      type: "text",
      commentsNum: 50,
      communityID: communityModel1.id,
      createdAt: DateTime(2022, 10, 26),
      text:
          "Yes, anyone can learn to draw. You may think you have no talent but others may well appreciate what you draw. A natural talent may make the learning process easier, but drawing is as much of a skill as a talent. As with any other skill, this can be learned.",
      title:
          "Yes, anyone can learn to draw. You may think you have no talent but others may well appreciate what you draw. A natural talent may make the learning process easier, but drawing is as much of a skill as a talent. As with any other skill, this can be learned.",
      userID: UserID(
          userID: "t2_Zahraa",
          avatar:
              "https://i.pinimg.com/564x/d8/3e/24/d83e2410c042538202fb8c9bce9a3f01.jpg"),
      votesCount: 240),
  PostModel(
      id: "639ab04cd0388bee70b25ee6",
      spoiler: true,
      nsfw: false,
      attachments: [
        "https://i.pinimg.com/564x/c9/92/64/c9926411478ce371609e61fc76fecaf0.jpg"
      ],
      type: "img",
      commentsNum: 1000,
      communityID: communityModel1.id,
      createdAt: DateTime(2021, 10, 2),
      text: "",
      title:
          "Butterflies..They can't see how truly beautiful they are, but everyone else can. People are like that as well",
      userID: UserID(
          userID: "t2_Salma Mohamed",
          avatar:
              "https://i.pinimg.com/564x/1e/39/8d/1e398d1ef51258540cc600438594b343.jpg"),
      votesCount: 900),
  PostModel(
      id: "639ab04cd0388bee70b25ee7",
      spoiler: true,
      nsfw: false,
      attachments: [
        "https://www.creativefounders.com/art-websites-aspiring-artist/"
      ],
      type: "link",
      commentsNum: 39,
      communityID: communityModel1.id,
      createdAt: DateTime(2022, 10, 22),
      text: "",
      title: "10 Art Websites Every Aspiring Artist Should Know",
      userID: UserID(
          userID: "t2_Hend",
          avatar:
              "https://i.pinimg.com/564x/dc/6b/7d/dc6b7da2bb455dd400fc986e34dfa2f7.jpg"),
      votesCount: 400),
  PostModel(
      id: "639ab04cd0388bee70b25ee8",
      spoiler: true,
      nsfw: false,
      attachments: [
        "https://i.pinimg.com/564x/bf/23/a9/bf23a9053df8a9b82b6aee33cb35cafb.jpg"
      ],
      type: "img",
      commentsNum: 1003,
      communityID: communityModel1.id,
      createdAt: DateTime(2021, 5, 2),
      textHTML: "",
      title:
          "Colored Pencil Techniques. Abstracts with purple flowers to give you ideas for coloring. #coloredpenciltechniques",
      userID: UserID(
          userID: "t2_Israa",
          avatar:
              "https://i.pinimg.com/564x/dc/6b/7d/dc6b7da2bb455dd400fc986e34dfa2f7.jpg"),
      votesCount: 890),
];

List postsListMock1 = postsListMock
    .map((e) => {
          '_id': e.id,
          'title': e.title,
          'spoiler': e.spoiler,
          'nsfw': e.nsfw,
          'createdAt': e.createdAt,
          'userID': e.userID,
          'type': e.type,
          'attachments': e.attachments,
          'commentsNum': e.commentsNum,
          'mentionedInUsers': e.mentionedInUsers,
          'spammers': e.spammers,
          'communityID': e.communityID,
          'followers': e.followers,
          'flairBackGround': e.flairBackGround,
          'flairTextColor': e.flairTextColor,
          'flairText': e.flairText,
          'flairID': e.flairID,
          'votesCount': e.votesCount,
          'spamCount': e.spamCount,
          'insightCnt': e.insightCnt,
          'isDeleted': e.isDeleted,
          'text': e.text
        })
    .toList();

class CommunityService {
  List<PostModel> testpostsListMock = postsListMock;
  Future<List<PostModel>> getPosts() async {
    await Future.delayed(const Duration(seconds: 1));
    return testpostsListMock;
  }
}
