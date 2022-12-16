import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:link_preview_generator/link_preview_generator.dart';
import '../../../config/constants.dart';
import '../../../models/post_model.dart';
import 'mobile_post_bottom.dart';
import 'mobile_post_top.dart';
import 'dart:math' as math;

/// Shows the card post view
class MobilePostClassic extends StatelessWidget {
  /// To indicate post type: text, image or link
  final String postType;

  /// To show bottom sheets & pop up menus
  final BuildContext context;

  /// To determine the view of the top part of the post
  /// As it has different views in home, community and profile
  final String postPlace;

  /// Index of the post
  final int index;

  /// Mobile classic post constructor
  const MobilePostClassic(
      {super.key,
      required this.postType,
      required this.context,
      required this.postPlace,
      required this.index});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      children: [
                        TopMobilePost(
                            postPlace: postPlace,
                            postType: postType,
                            context: context,
                            index: index,
                            userName:
                                "u/${communityPostsList[index]['userID']['_id']}"
                                    .replaceFirst("t2_", ""),
                            dateTime: !iSMOCK
                                ? "${communityPostsList[index]['createdAt']}"
                                : "${communityPostsListMock[index]['createdAt']}"),
                        const SizedBox(
                          height: 10,
                        ),
                        if (postType == 'text' ||
                            postType == 'image' ||
                            postType == 'linkWithImage')
                          Text(
                            communityPostsList[index]['title'],
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          (communityPostsList[index]['flairText']!=null)?
                        const SizedBox(
                          height: 5,
                        ):const SizedBox(
                          height: 0,),
                        (communityPostsList[index]['flairText']!=null)?
                        InkWell(
                          onTap: () {},
                          child: RichText(
                            key: const Key('post_content'),
                            text: TextSpan(
                              children: [
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
                                        (math.Random().nextDouble() * 0xFFFFFF)
                                            .toInt(),
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
                                      '${communityPostsList[index]['flairText']}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ):const SizedBox(
                          height: 0,),
                      ],
                    ),
                  ),
                  if (postType == "image") const SizedBox(height: 8),
                  if (postType == "image")
                    Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage((communityPostsList[index]
                                              ['attachments']
                                          .length ==
                                      0)
                                  ? "https://i.pinimg.com/564x/07/6b/62/076b62cf375a4d1a009d7e501fd8f451.jpg"
                                  : communityPostsList[index]['attachments']
                                      [0]))),
                    ),
                  if (postType == 'link')
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                communityPostsList[index]['title'],
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              child: LinkPreviewGenerator(
                                link: (communityPostsList[index]['attachments']
                                            .length ==
                                        0)
                                    ? "https://i.pinimg.com/564x/07/6b/62/076b62cf375a4d1a009d7e501fd8f451.jpg"
                                    : communityPostsList[index]['attachments']
                                        [0],
                                linkPreviewStyle: LinkPreviewStyle.small,
                                bodyMaxLines: 1,
                                bodyTextOverflow: TextOverflow.ellipsis,
                                showBody: false,
                              ),
                            ),
                          ],
                        ))
                      ],
                    ),
                  if (postType == 'linkWithImage')
                    Html(
                      data: communityPostsList[index]['textHTML'] ?? '',
                      shrinkWrap: true,
                      style: {
                        '#': Style(
                            maxLines: 3, textOverflow: TextOverflow.ellipsis)
                      },
                    ),
                  BottomPostMobile(
                    index: index,
                  ),
                  Container(
                    height: 10,
                    width: double.infinity,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  const Divider()
                ],
              ),
            )));
  }
}
