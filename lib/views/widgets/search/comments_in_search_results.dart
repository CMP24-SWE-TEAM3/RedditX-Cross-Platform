import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../methods/circular_omage_widget.dart';
import 'community_icon_and_2lines_app.dart';
import 'community_icon_and_2lines_web.dart';
import 'upvotes_and_comments.dart';

import '../../../controllers/search_controller.dart';
import '../../../models/search_model.dart';

///Comment Widget in search results comments tab
class CommentsSearchResult extends StatelessWidget {
  final CommentInSearch commentData;

  ///Detects which item this widget represents
  final int index;
  const CommentsSearchResult({
    Key? key,
    required this.commentData,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///Age of the post
    String postShownDate = Provider.of<SearchController>(context)
        .calculateAge(commentData.postData.createdAt);

    ///Age of the comment
    String commentShownDate = Provider.of<SearchController>(context)
        .calculateAge(commentData.createdAt);

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          Provider.of<SearchController>(context).isWeb
              ////////////////////WEB////////////////////
              ? Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),

                    ///community icon and the line next to it in web
                    Expanded(
                      child: CommIconAndNextLinesWeb(
                        postData: commentData.postData,
                        shownDate: postShownDate,
                      ),
                    ),
                  ],
                )
              ////////////////////APP////////////////////
              : Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),

                    ///Community icon and the two lines next to it in App
                    CommIconAndTwoLinesApp(
                      postData: commentData.postData,
                      shownDate: postShownDate,
                    ),
                  ],
                ),
          const SizedBox(
            height: 5,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Text(
              textAlign: TextAlign.start,
              commentData.postData.postText,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),

          ///Colored container of the comment
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            padding: const EdgeInsets.all(10),
            color: Provider.of<SearchController>(context).isWeb
                ? const Color.fromRGBO(173, 216, 230, 0.4)
                : const Color.fromRGBO(135, 138, 140, 0.2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircularImageWidget(
                      img: commentData.userAvatar,
                      radius: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${commentData.userName} . ',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Provider.of<SearchController>(context).isWeb
                            ? Colors.black
                            : const Color.fromRGBO(124, 124, 124, 1),
                      ),
                    ),
                    Text(
                      commentShownDate,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color.fromRGBO(124, 124, 124, 1),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Provider.of<SearchController>(context).isWeb ? 10 : 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width:
                          Provider.of<SearchController>(context).isWeb ? 25 : 0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            key: const Key('comment_content'),
                            maxLines:
                                Provider.of<SearchController>(context).isWeb
                                    ? null
                                    : 9,
                            overflow:
                                Provider.of<SearchController>(context).isWeb
                                    ? null
                                    : TextOverflow.fade,
                            textAlign: TextAlign.start,
                            commentData.commentText,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: Provider.of<SearchController>(context).isWeb
                                ? 10
                                : 5,
                          ),
                          Text(
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color.fromRGBO(124, 124, 124, 1),
                            ),

                            ///Formatting number of votes
                            commentData.commentVotesCount > 0
                                ? commentData.commentVotesCount > 1000000
                                    ? '${double.parse((commentData.commentVotesCount / 1000000.0).toStringAsFixed(3))}m upvotes'
                                    : commentData.commentVotesCount > 1000
                                        ? '${commentData.commentVotesCount / 1000.0}k upvotes'
                                        : '${commentData.commentVotesCount} upvotes'
                                : //negative voteCount
                                commentData.commentVotesCount < -1000000
                                    ? '${double.parse((commentData.commentVotesCount / -1000000.0).toStringAsFixed(3))}m downvotes'
                                    : commentData.commentVotesCount < -1000
                                        ? '${commentData.commentVotesCount / -1000.0}k downvotes'
                                        : '${commentData.commentVotesCount} downvotes',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Go to thread / Go to Comment text
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          return Colors.white;
                        },
                      ),
                    ),
                    child: Text(
                      Provider.of<SearchController>(context).isWeb
                          ? 'Go to thread'
                          : 'Go to Comment',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  UpVotesAndComments(
                    postData: commentData.postData,
                    isPost: false,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          //horizontal line
          const Divider(
            color: Color.fromRGBO(135, 138, 140, 0.2),
          ),
        ],
      ),
    );
  }
}
