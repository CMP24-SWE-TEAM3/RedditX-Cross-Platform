import 'package:flutter/material.dart';
import 'package:link_preview_generator/link_preview_generator.dart';
import 'package:reddit/views/widgets/web_post_bottom.dart';
import 'post_top_widget.dart';

class WebPostTemp extends StatelessWidget {
  final String postType;
  final BuildContext context;
  final String postPlace;

  const WebPostTemp(
      {super.key,
      required this.postType,
      required this.context,
      required this.postPlace});
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
                            context: context),
                        const SizedBox(
                          height: 10,
                        ),
                        if (postType == 'image' || postType == 'text')
                          const Text(
                            "Inspired by camping and being outdoors with friends kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (postType == "image")
                    Container(
                      height: 250,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://img.freepik.com/free-vector/romantic-floral-background_53876-89197.jpg?w=1060&t=st=1666372949~exp=1666373549~hmac=ceb57c29aa08ce88b7f2f80aeecfefb86c8399beff83859f981e28f8bb4e6c21"))),
                    ),
                  if (postType == "text")
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "Inspired by camping and being outdoors with friends kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              runSpacing: 5,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsetsDirectional.only(end: 8),
                                  child: Container(
                                    height: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.blue,
                                    ),
                                    child: MaterialButton(
                                      onPressed: () {},
                                      height: 25,
                                      minWidth: 1,
                                      padding: EdgeInsets.zero,
                                      child: Text("art",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(color: Colors.white)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  if (postType == 'link')
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: const [
                              Text(
                                "Inspired by camping and being outdoors with friends kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18),
                              child: LinkPreviewGenerator(
                                link: "https://github.com/hebaashraf21",
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
                  const WebPostBottomWidget(),
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
