import 'package:float_column/float_column.dart';
import 'package:flutter/material.dart';
import 'package:link_preview_generator/link_preview_generator.dart';
import 'package:reddit/methods/show_profile_dialog.dart';
import 'package:reddit/views/widgets/pop_up_menu_button.dart';
import 'package:reddit/views/widgets/post_bottom_widget.dart';

class PostCardWidget extends StatelessWidget {
  final String postType;
  const PostCardWidget({required this.postType, super.key});

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
                mainAxisSize: MainAxisSize.min,
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
                      const PopUpMenu(),
                    ],
                  ),
                  if (postType == "text")
                    const Text(
                      "post titleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    )
                  else
                    FloatColumn(
                      children: [
                        Floatable(
                            float: FCFloat.end,
                            padding: (postType == 'image')
                                ? const EdgeInsets.only(left: 8, right: 8)
                                : const EdgeInsets.only(left: 0),
                            child: (postType == 'link')
                                ? const SizedBox(
                                    height: 90,
                                    width: 150,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 18),
                                      child: LinkPreviewGenerator(
                                        link: "https://github.com/hebaashraf21",
                                        linkPreviewStyle:
                                            LinkPreviewStyle.small,
                                        bodyMaxLines: 1,
                                        bodyTextOverflow: TextOverflow.ellipsis,
                                        showBody: false,
                                      ),
                                    ),
                                  )
                                : (postType == 'image')
                                    ? Container(
                                        height: 90,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            image: const DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "https://img.freepik.com/free-vector/romantic-floral-background_53876-89197.jpg?w=1060&t=st=1666372949~exp=1666373549~hmac=ceb57c29aa08ce88b7f2f80aeecfefb86c8399beff83859f981e28f8bb4e6c21"))),
                                      )
                                    : const SizedBox(height: 20)),
                        const WrappableText(
                            text: TextSpan(
                                text:
                                    "post titleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuueeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"))
                      ],
                    ),
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
