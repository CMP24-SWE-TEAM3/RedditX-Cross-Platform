import 'package:flutter/material.dart';
import 'package:link_preview_generator/link_preview_generator.dart';
import 'package:reddit/models/post_model.dart';
import 'package:reddit/views/widgets/web_post_bottom.dart';
import 'post_top_widget.dart';

class WebPostTemp extends StatelessWidget {
  final String postType;
  final BuildContext context;
  final String postPlace;
  final int index;
  final String userName;
  final DateTime dateTime;

  const WebPostTemp(
      {super.key,
      required this.postType,
      required this.context,
      required this.postPlace,
      required this.dateTime,
      required this.index,
      required this.userName});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Container(width: 20, child: Text("lkjhgf")),
                    Column(
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
                                dateTime: dateTime,
                                userName: userName,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              if (postType == 'image' || postType == 'text')
                                Text(
                                  (postType == 'image')
                                      ? postsList[index].title
                                      : postsList[index].text,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (postType == "image")
                          Container(
                            height: 250,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        postsList[index].attachments[0]))),
                          ),
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
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18),
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
                        WebPostBottomWidget(
                          index: index,
                        ),
                        Container(
                          height: 10,
                          width: double.infinity,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        )
                      ],
                    ),
                  ],
                ))));
  }
}
