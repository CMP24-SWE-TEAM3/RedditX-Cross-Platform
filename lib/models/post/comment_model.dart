class CommentModel {
  String username;
  String createdAt;
  String text;
  var userPhoto;
  int votesCount;

  CommentModel(
      {required this.votesCount,
      required this.text,
      required this.createdAt,
      required this.username,
      required this.userPhoto});

  /// List of comment model
  /// dummy data to test
  /// will be replaced with real data from the APIs

  List<CommentModel> CommentsList = [
    CommentModel(
        votesCount: 215,
        text:
            'The result of the code above will be a padding of 10% of the height of the screen from top and 10% of the width of the screen from left. That’s how you can set your padding dynamically. ( Also be aware that you cannot use const keyword if you’re using mediaQuery values as the value is not available at the compile time.',
        createdAt: "13h",
        username: "Alfonso Alcapony",
        userPhoto: ["assets/kareem.jpg"]),
    CommentModel(
        votesCount: 458,
        text:
            'What you are doing right now is that there will be a padding of 10 pixels from top and 10 pixels from left side of the screen. So that the Container might have bigger or smaller shapes on different screen sizes. You can do it dynamically by using the screenSize values and media query so that you set the padding according to the screen size:',
        createdAt: "2h",
        username: "Paolo valenteno",
        userPhoto: ["assets/kareem.jpg"]),
    CommentModel(
        votesCount: 581,
        text:
            'The result of the code above will be a padding of 10% of the height of the screen from top and 10% of the width of the screen from left. That’s how you can set your padding dynamically. ( Also be aware that you cannot use const keyword if you’re using mediaQuery values as the value is not available at the compile time.',
        createdAt: "17h",
        username: "Mohammed Ali",
        userPhoto: ["assets/kareem.jpg"]),
    CommentModel(
        votesCount: 482,
        text:
            'What you are doing right now is that there will be a padding of 10 pixels from top and 10 pixels from left side of the screen. So that the Container might have bigger or smaller shapes on different screen sizes. You can do it dynamically by using the screenSize values and media query so that you set the padding according to the screen size:',
        createdAt: "23h",
        username: "Maria john",
        userPhoto: ["assets/kareem.jpg"]),
    CommentModel(
        votesCount: 9584,
        text:
            'The result of the code above will be a padding of 10% of the height of the screen from top and 10% of the width of the screen from left. That’s how you can set your padding dynamically. ( Also be aware that you cannot use const keyword if you’re using mediaQuery values as the value is not available at the compile time.',
        createdAt: "7h",
        username: "Kareem Ashraf",
        userPhoto: ["assets/kareem.jpg"]),
  ];
}
