import 'package:flutter/material.dart';

class voteModel {
  voteModel({required this.userID, required this.voteType});

  String? userID;
  int? voteType;
}

class spamModel {
  String? userID;
  String? text;
  String? type;

  spamModel({required this.userID, required this.text, required this.type});
}

class commentModel {
  commentModel(
      {required this.authorId,
      required this.isRoot,
      required this.text,
      required this.createdAt,
      required this.votesCount,
      required this.replyingTo,
      required this.replies,
      required this.spamCount,
      required this.voters});

  String? authorId;
  String? text;
  DateTime? createdAt;
  bool? isDeleted;
  bool? isLocked;
  DateTime? editedAt;
  String? isCollapsed;
  bool? isRoot;
  String?
      replyingTo; // if root IS TRUE then it has the post ID, it return ID as string
  List<String>? replies;
  int? votesCount;
  List<voteModel>? voters;
  List<spamModel>? spams;
  int? spamCount;
}

voteModel v1 = voteModel(userID: "t2_${6516495}", voteType: 1);
voteModel v2 = voteModel(userID: "t2_${7851}", voteType: 1);
voteModel v3 = voteModel(userID: "t2_${5858}", voteType: 2);

List<voteModel> votersList = [
  voteModel(userID: "t2_${9901124}", voteType: 1),
  voteModel(userID: "t2_${6516465}", voteType: 2),
  voteModel(userID: "t2_${656545}", voteType: 0),
  voteModel(userID: "t2_${54515}", voteType: -1),
  voteModel(userID: "t2_${6516495}", voteType: 1),
  voteModel(userID: "t2_${69651984}", voteType: 0),
  voteModel(userID: "t2_${954984}", voteType: 1),
  voteModel(userID: "t2_${95494978}", voteType: 0),
  voteModel(userID: "t2_${65978584}", voteType: 2),
  voteModel(userID: "t2_${65494}", voteType: 1),
];

List<voteModel> votersList2 = [
  voteModel(userID: "t2_${5818}", voteType: 1),
  voteModel(userID: "t2_${6516465}", voteType: 2),
  voteModel(userID: "t2_${415184}", voteType: 0),
  voteModel(userID: "t2_${84581}", voteType: -1),
  voteModel(userID: "t2_${54515}", voteType: -1),
];

List<voteModel> votersList3 = [
  voteModel(userID: "t2_${55558}", voteType: 1),
  voteModel(userID: "t2_${5151818}", voteType: 2),
  voteModel(userID: "t2_${656545}", voteType: 0),
  voteModel(userID: "t2_${8488}", voteType: -1),
  voteModel(userID: "t2_${5848558}", voteType: 1),
  voteModel(userID: "t2_${4154848}", voteType: 0),
];

List<commentModel> commentsList = [
  commentModel(
      authorId: "t2_${9901124}",
      isRoot: true,
      text: 'the first comment',
      createdAt: DateTime(2020),
      votesCount: 12,
      replyingTo: "t2_${9901124}",
      replies: ["106541", "213547"],
      spamCount: 3,
      voters: votersList),
  commentModel(
      authorId: "t2_${106541}",
      isRoot: false,
      text: 'the first reply',
      createdAt: DateTime(2020),
      votesCount: 2,
      replyingTo: "t2_${9901124}",
      replies: [],
      spamCount: 1,
      voters: votersList2),
  commentModel(
      authorId: "t2_${213547}",
      isRoot: false,
      text: 'the second comment',
      createdAt: DateTime(2020),
      votesCount: 5,
      replyingTo: "t2_${9901124}",
      replies: ["55184"],
      spamCount: 0,
      voters: votersList3),
  commentModel(
      authorId: "t2_${55184}",
      isRoot: false,
      text: 'the first reply on the second reply of the first comment',
      createdAt: DateTime(2020),
      votesCount: 3,
      replyingTo: "t2_${213547}",
      replies: [],
      spamCount: 0,
      voters: [v1, v2, v3]),
  commentModel(
      authorId: "t2_${158451845}",
      isRoot: true,
      text: 'the second comment',
      createdAt: DateTime(2020),
      votesCount: 96,
      replyingTo: "t2_${158451845}",
      replies: [],
      spamCount: 8,
      voters: votersList + votersList2 + votersList3),
];
