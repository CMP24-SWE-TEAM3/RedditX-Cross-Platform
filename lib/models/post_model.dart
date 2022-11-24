import 'package:reddit/models/community_model.dart';
import 'package:reddit/models/user_model.dart';

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
  /// Post title
  String? title;

  /// Post text (if its type is "text")
  String? text;

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
  String? userID;

  /// List of the spammers of the post
  List<SpamModel>? spammers;

  /// List of mentioned users
  List<String>? mentionedInUsers;

  /// Count of comments
  int? commentsNum;


  /// Constructor of Post model
  PostModel(
      {required this.title,
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
      this.text});
Map<String, dynamic> toMap() {
    return {
      'title': title,
      'spoiler': spoiler,
      'nsfw': nsfw,
      'createdAt': createdAt,
      'userID': userID,
      'type': type,
      'attachments': attachments,
      'commentsNum': commentsNum,
      'mentionedInUsers': mentionedInUsers,
      'spammers': spammers,
      'communityID': communityID,
      'followers': followers,
      'flairBackGround':flairBackGround,
      'flairTextColor': flairTextColor,
      'flairText': flairText,
      'flairID': flairID,
      'votesCount': votesCount,
      'spamCount': spamCount,
      'insightCnt': insightCnt,
      'isDeleted': isDeleted,
      'text': text



    };
  }
}



/// List of posts whether API or mock
List<dynamic> postsList = [];

/// List of real posts (from API)
List<dynamic>postsListAPI=[];

/// List of post model
/// dummy data to test
/// will be replaced with real data from the APIs

List<PostModel> postsListMock = [
  PostModel(
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
    userID: "Huda Ashraf",
    type: "image",
  ),
  PostModel(
    votesCount: 50,
    communityID: communityModel1.id,
    commentsNum: 120,
    title: "",
    text:
        "“...and then, I have nature and art and poetry, and if that is not enough, what is enough?”― Vincent Willem van Gogh",
    spoiler: true,
    nsfw: false,
    createdAt: DateTime(2022, 11, 8, 10, 30),
    userID: "Doaa Mohamed",
    type: "text",
  ),
  PostModel(
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
    userID: "Mariam",
    type: "image",
  ),
  PostModel(
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
    userID: "Eman Ashraf",
    type: "link",
  ),
  PostModel(
      spoiler: true,
      nsfw: false,
      attachments: [""],
      type: "text",
      commentsNum: 50,
      communityID: communityModel1.id,
      createdAt: DateTime(2022, 10, 26),
      text:
          "Yes, anyone can learn to draw. You may think you have no talent but others may well appreciate what you draw. A natural talent may make the learning process easier, but drawing is as much of a skill as a talent. As with any other skill, this can be learned.",
      title: "",
      userID: "Zahraa",
      votesCount: 240),
  PostModel(
      spoiler: true,
      nsfw: false,
      attachments: [
        "https://i.pinimg.com/564x/c9/92/64/c9926411478ce371609e61fc76fecaf0.jpg"
      ],
      type: "image",
      commentsNum: 1000,
      communityID: communityModel1.id,
      createdAt: DateTime(2021, 10, 2),
      text: "",
      title:
          "Butterflies..They can't see how truly beautiful they are, but everyone else can. People are like that as well",
      userID: "Salma Mohamed",
      votesCount: 900),
  PostModel(
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
      userID: "Hend",
      votesCount: 400),
  PostModel(
      spoiler: true,
      nsfw: false,
      attachments: [
        "https://i.pinimg.com/564x/bf/23/a9/bf23a9053df8a9b82b6aee33cb35cafb.jpg"
      ],
      type: "image",
      commentsNum: 1003,
      communityID: communityModel1.id,
      createdAt: DateTime(2021, 5, 2),
      text: "",
      title:
          "Colored Pencil Techniques. Abstracts with purple flowers to give you ideas for coloring. #coloredpenciltechniques",
      userID: "Israa",
      votesCount: 890),
];

List postsListMock1=postsListMock.map((e) => {
          'title': e.title,
          'spoiler': e.spoiler,
          'nsfw': e.nsfw,
          'createdAt': e.createdAt,
          'userID': e. userID,
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
        }).toList();

class CommunityService {
  List<PostModel> testpostsListMock = postsListMock;
  List<UserModel> testUsersList = users;

  Future<List<PostModel>> getPosts() async {
    await Future.delayed(const Duration(seconds: 1));
    return testpostsListMock;
  }
}
