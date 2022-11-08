import 'package:reddit/models/community_model.dart';

class PostModel {
  String type;
  int votesCount;
  String username;
  String communityName;
  var createdAt;
  String text;
  String title;
  int commentsNumber;
  var attachments;

  PostModel(
      {required this.attachments,
      required this.type,
      required this.commentsNumber,
      required this.communityName,
      required this.createdAt,
      required this.text,
      required this.title,
      required this.username,
      required this.votesCount});
}

List<PostModel> postsList = [
  PostModel(
      attachments: [
        "https://i.pinimg.com/564x/60/9d/04/609d04f9f059aa65a99955bf9a8b348e.jpg"
      ],
      type: "image",
      commentsNumber: 83,
      communityName: communityModel1.name,
      createdAt: DateTime.now(),
      text: "",
      title:
          "Japanese artist and art university graduate Gotte have turned their creative skills towards a very cool subject. Their light-hearted watercolor animal drawings depict a typical day in their adorable pet's life - a cute hamster named Sukeroku.",
      username: "Doaa mohamed",
      votesCount: 320),
  PostModel(
      attachments: [
        "https://www.nevuefineartmarketing.com/4-amazing-artist-websites-you-should-see/?utm_source=pinterest&utm_medium=social&utm_campaign=SocialWarfare"
      ],
      type: "link",
      commentsNumber: 46,
      communityName: communityModel1.name,
      createdAt: DateTime(2022, 11, 3),
      text: "",
      title:
          "Professional artist websites are essential to the success of any aspiring artist selling art online or locally.Building an online presence goes a long way in getting an artist’s name out there.It is crucial to have a well-designed website that will separate your art business from all of the other artists selling art online",
      username: "Youmna tarek",
      votesCount: 390),
  PostModel(
      attachments: [""],
      type: "text",
      commentsNumber: 50,
      communityName: communityModel1.name,
      createdAt: DateTime.now(),
      text:
          "Yes, anyone can learn to draw. You may think you have no talent but others may well appreciate what you draw. A natural talent may make the learning process easier, but drawing is as much of a skill as a talent. As with any other skill, this can be learned.",
      title: "",
      username: "Salma mohamed",
      votesCount: 240),
  PostModel(
      attachments: [
        "https://www.creativefounders.com/art-websites-aspiring-artist/"
      ],
      type: "link",
      commentsNumber: 5550,
      communityName: communityModel1.name,
      createdAt: DateTime.now(),
      text: "",
      title: "10 Art Websites Every Aspiring Artist Should Know",
      username: "Heba Ashraf",
      votesCount: 1900),
  PostModel(
      attachments: [
        "https://i.pinimg.com/564x/c9/92/64/c9926411478ce371609e61fc76fecaf0.jpg"
      ],
      type: "image",
      commentsNumber: 1000,
      communityName: communityModel1.name,
      createdAt: DateTime.now(),
      text: "",
      title: "Do you know that butterflies can't see their wings?",
      username: "Eman Ashraf",
      votesCount: 900),
];
