import 'package:flutter/material.dart';
import 'package:link_preview_generator/link_preview_generator.dart';
import 'package:reddit/config/constants.dart';
import 'package:reddit/models/post_model.dart';
import 'package:reddit/views/widgets/community/mobile_post_bottom.dart';
import 'mobile_post_top.dart';

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
                          userName: iSMOCK
                              ? postsList[index].userID
                              : postsList[index]['userID'],
                          dateTime: postsListMock[index].createdAt!,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (postType == 'text' || postType == 'image')
                          Text(
                            (postType == 'text')
                                ? !iSMOCK
                                    ? postsList[index]['text']
                                    : postsList[index].text
                                : !iSMOCK
                                    ? postsList[index]['title']
                                    : postsList[index].title,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
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
                              image: NetworkImage(
                                  postsList[index].attachments![0]))),
                    ),
                  if (postType == 'link')
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                !iSMOCK
                                    ? postsList[index]['title']
                                    : postsList[index].title!,
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
                                link: postsList[index].attachments![0],
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
                  BottomPostMobile(
                    index: index,
                  ),
                  Container(
                    height: 10,
                    width: double.infinity,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  )
                ],
              ),
            )));
  }
}
