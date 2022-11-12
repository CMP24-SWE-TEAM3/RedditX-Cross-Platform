import 'dart:math' as math;

import 'package:float_column/float_column.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'community_icon_and_2lines_app.dart';
import 'community_icon_and_2lines_web.dart';
import 'upvotes_and_comments.dart';

import '../../../controllers/search_controller.dart';
import '../../../models/search_model.dart';

class PostsSearchResult extends StatelessWidget {
  final PostInSearch postData;

  ///Random number to get Random Color to the flair container if exists
  ///  Defined here to take only one value and not change when scroll(ListView rebuild the widget when scroll)
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
    ///Post age
    String shownDate =
        Provider.of<SearchController>(context).calculateAge(postData.createdAt);
    return !Provider.of<SearchController>(context).isWeb
        /////////////////////////////APP////////////////////////////
        ? Container(
            color: Colors.white,
            //[FloatColumn] arrange widgets if there is a picture to show
            //to make text wrap it
            child: FloatColumn(
              children: [
                const SizedBox(
                  height: 10,
                ),

                ///Item of Float Column that will be float in the column
                Floatable(
                  ///Aalignment
                  float: FCFloat.start,
                  child: SizedBox(
                    //MediaQuery.of(context).size.width is screen width
                    width: postData.attachedMedia
                            .isNotEmpty //is there a picture to show or not
                        ? MediaQuery.of(context).size.width *
                            0.69 //to free space for the picture
                        : MediaQuery.of(context).size.width * 1,

                    ///Community icon and the 2 lines next to it
                    child: CommIconAndTwoLinesApp(
                      postData: postData,
                      shownDate: shownDate,
                    ),
                  ),
                ),
                postData.attachedMedia.isNotEmpty
                    //if there is picture to show
                    ? Floatable(
                        ///Alignment
                        float: FCFloat.right,
                        padding: EdgeInsets.symmetric(
                            //make the horizontal padding according to the screen width
                            //MediaQuery.of(context).size.width is screen width
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03),

                        ///ClipRRect to clip the picture top borders to be little rounded
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                          ),
                          child: Image(
                            fit: BoxFit.fill,
                            alignment: Alignment.topRight,
                            width: MediaQuery.of(context).size.width * 0.24,
                            height: MediaQuery.of(context).size.width * 0.24,
                            image: NetworkImage(
                              postData.attachedMedia[0],
                            ),
                          ),
                        ),
                      )
                    : Container(),

                ///[WrappableText]
                ///Makes the post text wrap the image
                WrappableText(
                  key: const Key('post_content'),
                  padding: const EdgeInsets.all(10),
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    ///Post content
                    text: postData.postText,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
                //just space
                const SizedBox(
                  height: 10,
                ),

                ///Upvotes and comments
                UpVotesAndComments(
                  postData: postData,
                  isPost: true,
                ),

                ///Horizontal line
                const Divider(
                  color: Color.fromRGBO(135, 138, 140, 0.2),
                ),
              ],
            ),
          )
        /////////////////////////////WEB////////////////////////////
        : Container(
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),

                ///Community data
                CommIconAndNextLinesWeb(
                    postData: postData, shownDate: shownDate),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: postData.attachedMedia.isEmpty
                      //if there is no picture to show
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
                      //if there are pictures ==> Show the first one
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
                              width: 150,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    postData.attachedMedia[0],
                                  ),

                                  ///Fits the photo inside the curcular box
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

                ///Upvotes and comments
                UpVotesAndComments(
                  postData: postData,
                  isPost: true,
                ),

                ///Horizontal line
                const Divider(
                  color: Color.fromRGBO(135, 138, 140, 0.2),
                ),
              ],
            ),
          );
  }
}

class PostTextWidget extends StatelessWidget {
  final PostInSearch postData;

  ///Random number that gets a value to a random color
  final double randomNumForColor;
  const PostTextWidget(
      {super.key, required this.postData, required this.randomNumForColor});

  @override
  Widget build(BuildContext context) {
    //if there is a flair we will wrap a text and a container
    //else==> just text
    return postData.flairText == ''
        ? Text(
            ///Post content
            key: const Key('post_content'),
            postData.postText,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          )

        ///RichText that wrap text with widgets to wrap post text with flair text container
        : RichText(
            key: const Key('post_content'),
            text: TextSpan(
              children: [
                ///Post content
                TextSpan(
                  text: postData.postText,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),

                ///Container of the flair text
                WidgetSpan(
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 5,
                    ),
                    padding: const EdgeInsets.all(
                      2,
                    ),
                    decoration: BoxDecoration(
                      ///Random color
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
                      ///Flair text
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
