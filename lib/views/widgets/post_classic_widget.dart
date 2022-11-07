import 'package:flutter/material.dart';
import 'package:link_preview_generator/link_preview_generator.dart';
import 'package:reddit/models/post_model.dart';
import 'package:reddit/views/widgets/post_bottom_widget.dart';
import 'post_top_widget.dart';

class PostClassicWidget extends StatelessWidget {
  final String postType;
  final BuildContext context;
  final String postPlace;
  final int index;

  const PostClassicWidget(
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
                        PostTopWidget(
                          postPlace: postPlace,
                          postType: postType,
                          context: context,
                          index: index,
                          userName: postsList[index].username,
                          dateTime: postsList[index].createdAt,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (postType == 'text' || postType == 'image')
                          Text(
                            (postType == 'text')
                                ? postsList[index].text
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
                                  postsList[index].attachments[0]))),
                    ),
                  // if (postType == "text")
                  //   Row(
                  //     children: [
                  //       Wrap(
                  //         runSpacing: 5,
                  //         crossAxisAlignment: WrapCrossAlignment.start,
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsetsDirectional.only(end: 8),
                  //             child: Container(
                  //               height: 20,
                  //               decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(10),
                  //                 color: Colors.blue,
                  //               ),
                  //               child: MaterialButton(
                  //                 onPressed: () {},
                  //                 height: 25,
                  //                 minWidth: 1,
                  //                 padding: EdgeInsets.zero,
                  //                 child: Text(postsList[index].communityName,
                  //                     style: Theme.of(context)
                  //                         .textTheme
                  //                         .bodyMedium!
                  //                         .copyWith(color: Colors.white)),
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  if (postType == 'link')
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                postsList[index].title,
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
                                link: postsList[index].attachments[0],
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
                  PostBottomWidget(index: index,),
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
