import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/search_model.dart';
import '../../controllers/search_controller.dart';

//the row that view the number of comments and upvotes
class UpVotesAndComments extends StatelessWidget {
  const UpVotesAndComments({
    Key? key,
    required this.postData,
    required this.isPost,
  }) : super(key: key);

  final PostInSearch postData;
  //to detect whether post or comment
  final bool isPost;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          textAlign: TextAlign.start,
          !Provider.of<SearchController>(context).isWeb && isPost
              //////////App in post////////
              //formatting comments appearance
              ? postData.votesCount > 0
                  ? '  ${postData.votesCount} upvotes'
                  : '${postData.votesCount * -1} downvotes'
              ////////////WEB in post and comment and App in comment only/////////
              //formatting votesCount appearance
              : postData.votesCount > 0
                  ? //positive voteCount
                  postData.votesCount > 1000000
                      ? '  ${double.parse((postData.votesCount / 1000000.0).toStringAsFixed(3))}m upvotes'
                      : postData.votesCount > 1000
                          ? '  ${postData.votesCount / 1000.0}k upvotes'
                          : '  ${postData.votesCount} upvotes'
                  : //negative voteCount
                  postData.votesCount < -1000000
                      ? '  ${double.parse((postData.votesCount / -1000000.0).toStringAsFixed(3))}m downvotes'
                      : postData.votesCount < -1000
                          ? '  ${postData.votesCount / -1000.0}k downvotes'
                          : '  ${postData.votesCount} downvotes',
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color.fromRGBO(124, 124, 124, 1),
          ),
        ),
        Text(
          textAlign: TextAlign.start,
          !Provider.of<SearchController>(context).isWeb && isPost
              ? //////////App in post////////
              //formatting comments appearance
              '  ${postData.commentsCount} comments'
              ////////////WEB in post and comment and Ap in comment only/////////
              /////formatting votesCount appearance
              : postData.commentsCount > 1000000
                  ? '  ${double.parse((postData.commentsCount / 1000000.0).toStringAsFixed(3))}m comments'
                  : postData.commentsCount > 1000
                      ? '  ${postData.commentsCount / 1000.0}k comments'
                      : '  ${postData.commentsCount} comments',
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color.fromRGBO(124, 124, 124, 1),
          ),
        ),
      ],
    );
  }
}
