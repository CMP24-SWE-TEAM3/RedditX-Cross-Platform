import 'package:flutter/material.dart';
import 'package:link_preview_generator/link_preview_generator.dart';
import 'package:reddit/methods/show_profile_dialog.dart';
import 'package:reddit/views/widgets/post_bottom_widget.dart';

class PostClassic extends StatelessWidget {
  final String postType;
  const PostClassic({required this.postType, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          showeProfileDialog(context);
                        },
                        child: Text(
                          "u/coolkid",
                          style:
                              TextStyle(color: Colors.grey[800], fontSize: 15),
                        ),
                      ),
                      Text(
                        "  15h",
                        style: TextStyle(color: Colors.grey[800], fontSize: 15),
                      ),
                      if (postType == 'image')
                        InkWell(
                          onTap: () {},
                          child: Text(
                            " · i.redd.it",
                            style: TextStyle(
                                color: Colors.grey[800], fontSize: 15),
                          ),
                        ),
                      if (postType == "text") const Spacer(),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.more_vert))
                    ],
                  ),
                  if (postType == "text")
                    const Text(
                      "post titleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    )
                  else
                    Row(
                      children: [
                        const Expanded(
                            flex: 5,
                            child: Text(
                              "post titleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            flex: 3,
                            child: (postType == 'link')
                                ? const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 18),
                                    child: LinkPreviewGenerator(
                                      link: "https://github.com/hebaashraf21",
                                      linkPreviewStyle: LinkPreviewStyle.small,
                                      bodyMaxLines: 1,
                                      bodyTextOverflow: TextOverflow.ellipsis,
                                      showBody: false,
                                    ),
                                  )
                                : (postType == 'image')
                                    ? Container(
                                        height: 100,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "https://img.freepik.com/free-vector/romantic-floral-background_53876-89197.jpg?w=1060&t=st=1666372949~exp=1666373549~hmac=ceb57c29aa08ce88b7f2f80aeecfefb86c8399beff83859f981e28f8bb4e6c21"))),
                                      )
                                    : const SizedBox(height: 20))
                      ],
                    )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: PostBottomWidget(),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
