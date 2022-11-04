import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import '../../models/search_model.dart';
import '../../controllers/search_controller.dart';
import 'circular_image_widget.dart';
import 'package:float_column/float_column.dart';

class PostsSearchResult extends StatelessWidget {
  final PostInSearch postData;
  //the color of the flair container if exixt
  //defined here to take only one value and not change when scroll(ListView rebuild the widget when scroll)
  //random colors
  final randomNumForColor = math.Random().nextDouble();
  //to select which item this widget represents
  final int index;
  PostsSearchResult({
    Key? key,
    required this.postData,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dateToShow() {
      //calculate the number of days,months and years the person has been in Reddit
      int years = DateTime.now().year - postData.createdAt.year;
      int months = DateTime.now().month - postData.createdAt.month;
      int days = DateTime.now().day - postData.createdAt.day;
      int hours = DateTime.now().hour - postData.createdAt.hour;
      int minutes = DateTime.now().minute - postData.createdAt.minute;
      int seconds = DateTime.now().second - postData.createdAt.second;
      //negative value means the current second/minute/day/month is less than the DateTime of the post
      //so it means we are in a minute/day/month/year after that one but not a full minute/day/month/year have passed
      //so we subtract it
      //Ex:3/11/2022-5/12/2022
      if (months < 0) {
        months = (12 - postData.createdAt.month) + DateTime.now().month;
        years -= 1;
      }
      if (days < 0) {
        int daysCount = postData.createdAt.month == 2
            ? 28
            : (postData.createdAt.month == 1 ||
                    postData.createdAt.month == 3 ||
                    postData.createdAt.month == 5 ||
                    postData.createdAt.month == 7 ||
                    postData.createdAt.month == 8 ||
                    postData.createdAt.month == 10 ||
                    postData.createdAt.month == 12)
                ? 31
                : 30;
        days = (daysCount - postData.createdAt.day) + DateTime.now().day;
        months -= 1;
      }
      if (hours < 0) {
        hours = (24 - postData.createdAt.hour) + DateTime.now().hour;
        days -= 1;
      }
      if (minutes < 0) {
        minutes = (60 - postData.createdAt.minute) + DateTime.now().minute;
        hours -= 1;
      }
      if (seconds < 0) {
        hours = (60 - postData.createdAt.second) + DateTime.now().second;
        minutes -= 1;
      }
      //format the shown period according to the values of days,months and years
      String shownDate = '';
      if (years != 0) {
        shownDate = Provider.of<SearchController>(context).isWeb
            ? '$years years'
            : '${years}y';
      } else if (months != 0) {
        shownDate = shownDate = Provider.of<SearchController>(context).isWeb
            ? '$months months'
            : '${months}mo';
      } else if (days != 0) {
        shownDate = shownDate = Provider.of<SearchController>(context).isWeb
            ? '$days days'
            : '${days}d';
      } else if (minutes != 0) {
        shownDate = shownDate = Provider.of<SearchController>(context).isWeb
            ? '$minutes minutes'
            : '${minutes}m';
      } else if (seconds != 0) {
        shownDate = shownDate = Provider.of<SearchController>(context).isWeb
            ? '$seconds seconds'
            : '${seconds}s';
      } else {
        shownDate = 'now';
      }
      return shownDate;
    }

    return !Provider.of<SearchController>(context).isWeb
        /////////////////////////////APP////////////////////////////
        ? Container(
            color: Colors.white,
            //to arrange widgets if there is a picture to show
            //to make text wrap it
            child: FloatColumn(
              children: [
                const SizedBox(
                  height: 10,
                ),
                //item of FloatColumn that will be float in the column
                Floatable(
                  //alignment
                  float: FCFloat.start,
                  child: SizedBox(
                    //MediaQuery.of(context).size.width is screen width
                    width: postData.attachedMedia
                            .isNotEmpty //is there a picture to show or not
                        ? MediaQuery.of(context).size.width *
                            0.7 //to free space for the picture
                        : MediaQuery.of(context).size.width * 1,
                    //community icon + the 2 lines next to it
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        CircularImageWidget(
                          img: postData.communityIcon,
                          radius: 30,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              textAlign: TextAlign.right,
                              postData.communityName,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              textAlign: TextAlign.right,
                              '${postData.userName} . ${dateToShow()}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color.fromRGBO(124, 124, 124, 1),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                postData.attachedMedia.isNotEmpty
                    //if there is picture to show
                    ? Floatable(
                        //alignment
                        float: FCFloat.right,
                        padding: EdgeInsets.symmetric(
                            //make the horizontal padding according to the screen width
                            //MediaQuery.of(context).size.width is screen width
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03),
                        //ClipRRect to clip the picture top borders to be little rounded
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                          ),
                          child: Image(
                            fit: BoxFit.fill,
                            alignment: Alignment.topRight,
                            //MediaQuery.of(context).size.width is screen width
                            width: MediaQuery.of(context).size.width * 0.24,
                            height: MediaQuery.of(context).size.width * 0.24,
                            image: NetworkImage(
                              postData.attachedMedia[0],
                            ),
                          ),
                        ),
                      )
                    : Container(),
                //to make the poxt text wrap the image
                WrappableText(
                  padding: const EdgeInsets.all(10),
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: postData.postText,
                  ),
                ),
                //just space
                const SizedBox(
                  height: 10,
                ),
                //upvotes and comments
                UpVotesAndComments(postData: postData),
                //horizontal line
                const Divider(
                  color: Color.fromRGBO(135, 138, 140, 0.2),
                ),
              ],
            ),
          )
        : Container(
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    CircularImageWidget(
                      img: postData.communityIcon,
                      radius: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${postData.communityName} . ',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Posted by ${postData.userName} ${dateToShow()} ago',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color.fromRGBO(124, 124, 124, 1),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: postData.attachedMedia.isEmpty
                      //if there is not picture to show
                      ? [
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: PostTextWidget(
                              postData: postData,
                              randomNumForColor: randomNumForColor,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                        ]
                      : [
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 3,
                            child: PostTextWidget(
                              postData: postData,
                              randomNumForColor: randomNumForColor,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    postData.attachedMedia[0],
                                  ),
                                  //fit the photo inside the curcular box
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                ),
                //just space
                const SizedBox(
                  height: 10,
                ),
                //upvotes and comments
                UpVotesAndComments(postData: postData),
                //horizontal line
                const Divider(
                  color: Color.fromRGBO(135, 138, 140, 0.2),
                ),
              ],
            ),
          );
  }
}

//the row that view the number of comments and upvotes
class UpVotesAndComments extends StatelessWidget {
  const UpVotesAndComments({
    super.key,
    required this.postData,
  });

  final PostInSearch postData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          textAlign: TextAlign.start,
          Provider.of<SearchController>(context).isWeb
              ////////////WEB/////////
              //formatting votesCount appearance
              ? postData.votesCount > 0
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
                          : '  ${postData.votesCount} downvotes'
              : //////////App////////
              //formatting comments appearance
              postData.votesCount > 0
                  ? '  ${postData.votesCount} upvotes'
                  : '${postData.votesCount * -1} downvotes',
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color.fromRGBO(124, 124, 124, 1),
          ),
        ),
        Text(
          textAlign: TextAlign.start,
          Provider.of<SearchController>(context).isWeb
              ////////////WEB/////////
              /////formatting votesCount appearance
              ? postData.commentsCount > 1000000
                  ? '  ${double.parse((postData.commentsCount / 1000000.0).toStringAsFixed(3))}m comments'
                  : postData.commentsCount > 1000
                      ? '  ${postData.commentsCount / 1000.0}k comments'
                      : '  ${postData.commentsCount} comments'
              : //////////App////////
              //formatting comments appearance
              '  ${postData.commentsCount} comments',
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

class PostTextWidget extends StatelessWidget {
  final PostInSearch postData;
  final double randomNumForColor;
  const PostTextWidget(
      {super.key, required this.postData, required this.randomNumForColor});

  @override
  Widget build(BuildContext context) {
    //if there is a flair we will wrap a text and a container
    //else==> just text
    return postData.flairText == ''
        ? Text(
            postData.postText,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          )
        //RichText that wrap text with widgets to wrap post text with flait text container
        : RichText(
            text: TextSpan(
              children: [
                //post text
                TextSpan(
                  text: postData.postText,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                //container of the flait text
                WidgetSpan(
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 5,
                    ),
                    padding: const EdgeInsets.all(
                      2,
                    ),
                    decoration: BoxDecoration(
                      //random color
                      color: Color(
                        (randomNumForColor * 0xFFFFFF).toInt(),
                      ).withOpacity(
                        1,
                      ),
                      //rounded rectangle shape
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      '  ${postData.flairText}  ',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
