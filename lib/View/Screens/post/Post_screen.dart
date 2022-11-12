import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


import '../../../controllers/community_controller.dart';

import '../../../models/post/post_model.dart';
import '../../widgets/post/Comments.dart';
import '../../widgets/post/Styles/custom_icons.dart';
import '../../widgets/post/popup_menu.dart';
import 'post_page_web.dart';

/// Mobile post Screen
class PostScreen extends StatefulWidget {
  final int index;
  const PostScreen({super.key, required this.index});

  // PostModel postsList;

  @override
  State<PostScreen> createState() => _post_screenState();
}

class _post_screenState extends State<PostScreen> {
  /// List of strings for comments
  List commentsText = [
    'What you are doing right now is that there will be a padding of 10 pixels from top and 10 pixels from left side of the screen. So that the Container might have bigger or smaller shapes on different screen sizes. You can do it dynamically by using the screenSize values and media query so that you set the padding according to the screen size:',
    'The result of the code above will be a padding of 10% of the height of the screen from top and 10% of the width of the screen from left. That’s how you can set your padding dynamically. ( Also be aware that you cannot use const keyword if you’re using mediaQuery values as the value is not available at the compile time.',
    'What you are doing right now is that there will be a padding of 10 pixels from top and 10 pixels from left side of the screen. So that the Container might have bigger or smaller shapes on different screen sizes. You can do it dynamically by using the screenSize values and media query so that you set the padding according to the screen size:',
    'The result of the code above will be a padding of 10% of the height of the screen from top and 10% of the width of the screen from left. That’s how you can set your padding dynamically. ( Also be aware that you cannot use const keyword if you’re using mediaQuery values as the value is not available at the compile time.',
    'What you are doing right now is that there will be a padding of 10 pixels from top and 10 pixels from left side of the screen. So that the Container might have bigger or smaller shapes on different screen sizes. You can do it dynamically by using the screenSize values and media query so that you set the padding according to the screen size:',
  ];

  void sortComments(BuildContext ctx) {
    /// Sorting bottom sheet
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return SingleChildScrollView(
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'SORT COMMENTS BY',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: const [
                      Icon(Icons.home),
                      Text(
                        '  Best',
                        style: TextStyle(fontSize: 22),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: const [
                      Icon(Icons.home),
                      Text(
                        '  Top',
                        style: TextStyle(fontSize: 22),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: const [
                      Icon(Icons.home),
                      Text(
                        '  New',
                        style: TextStyle(fontSize: 22),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: const [
                      Icon(Icons.home),
                      Text(
                        '  Controversial',
                        style: TextStyle(fontSize: 22),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: const [
                      Icon(Icons.home),
                      Text(
                        '  Old',
                        style: TextStyle(fontSize: 22),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: const [
                      Icon(Icons.home),
                      Text(
                        '  Q&A',
                        style: TextStyle(fontSize: 22),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    Icon postSubscribe = const Icon(Icons.notifications_none_rounded);
    return Scaffold(
      appBar: AppBar(
        elevation: 1.5,
        leadingWidth: 100,
        title: const Text(''),
        backgroundColor: Colors.black26,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                postSubscribe = (postSubscribe ==
                        const Icon(Icons.notifications_none_rounded))
                    ? const Icon(Icons.notifications)
                    : const Icon(Icons.notifications_none_rounded);
              });
            },
            icon: postSubscribe,
            color: Colors.white,
          ),
          const PopupMen(MenuList: [
            PopupMenuItem(
                child: ListTile(
              leading: Icon(Icons.share_outlined),
              title: Text("Share"),
            )),
            PopupMenuItem(
                child: ListTile(
              leading: Icon(Icons.bookmark_border_rounded),
              title: Text("Save"),
            )),
            PopupMenuItem(
                child: ListTile(
              leading: Icon(Icons.content_copy_rounded),
              title: Text("Copy text"),
            )),
            PopupMenuItem(
                child: ListTile(
              leading: Icon(Icons.remove_red_eye),
              title: Text("Hide"),
            )),
            PopupMenuItem(
                child: ListTile(
              leading: Icon(Icons.block_outlined),
              title: Text("Block account"),
            )),
            PopupMenuItem(
                child: ListTile(
              leading: Icon(Icons.flag),
              title: Text("Report"),
            )),
          ], icon: Icon(Icons.more_vert_rounded)),
          CircleAvatar(
            radius: 16.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset('assets/kareem.jpg'),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),

      /// view mobile or web depending on width of the device
      body: (screenWidth < 600)
          ? Stack(alignment: AlignmentDirectional.bottomCenter, children: [
              /// Main screen for mobile post
              SingleChildScrollView(
                child: Column(children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      CircleAvatar(
                        radius: 16.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.asset('assets/kareem.jpg'),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Text(
                                    "r/${postsList[widget.index].communityName}"),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "u/${postsList[widget.index].username} . ",
                                  style: const TextStyle(color: Colors.black45),
                                ),
                              ),
                              Text(
                                "${postsList[widget.index].createdAt}",
                                style: const TextStyle(color: Colors.black45),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        // title
                        Row(
                          children: [
                            SizedBox(
                              width: screenWidth * 0.9,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  postsList[widget.index].title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  // overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (postsList[widget.index].type == "image")
                          Image.asset(
                            "${postsList[widget.index].attachments[0]}",
                            fit: BoxFit.cover,
                          )
                        else
                          Text(
                            postsList[widget.index].text,
                            style: const TextStyle(fontSize: 14),
                          ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                Provider.of<CommunityProvider>(context)
                                    .likePost(widget.index);
                              });
                            },
                            icon: (Provider.of<CommunityProvider>(context)
                                    .isPostLiked[widget.index])
                                ? const Icon(
                                    CustomIcons.up_bold,
                                    color: Colors.deepOrange,
                                  )
                                : const Icon(CustomIcons.up_outline),
                          ),
                          Text('${postsList[widget.index].votesCount}'),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  Provider.of<CommunityProvider>(context)
                                      .disLikePost(widget.index);
                                });
                              },
                              icon: (Provider.of<CommunityProvider>(context)
                                      .isPostDisliked[widget.index])
                                  ? const Icon(
                                      CustomIcons.down_bold,
                                      color: Colors.blue,
                                    )
                                  : const Icon(CustomIcons.down_outline)),
                        ],
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(CustomIcons.comment)),
                            Text("${postsList[widget.index].commentsNumber}"),
                          ],
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.share_outlined)),
                            const Text("Share   "),
                          ],
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {}, icon: const Icon(CustomIcons.gift)),
                    ],
                  ),
                  Container(
                      width: double.infinity,
                      height: 35,
                      color: Color.fromRGBO(242, 243, 244, 1),
                      child: InkWell(
                        onTap: () => sortComments(context),
                        child: Row(children: const [
                          Text('   Sort Comment'),
                        ]),
                      )),

                  /// Comments area
                  Column(
                    children: <Widget>[
                      for (var item in commentsText)
                        comments(
                          commentsText: item,
                        )
                    ],
                  ),

                  const SizedBox(
                    height: 40,
                    width: double.infinity,
                  )
                ]),
              ),

              /// Add new comment area
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(242, 243, 244, 1),
                              borderRadius: BorderRadius.circular(6)),
                          width: screenWidth * 0.82,
                          height: 40,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '  Add a comment',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_circle_down_sharp)),
                    ],
                  ),
                ),
              ),
            ])

          /// Web post view
          :  WebPostPage(),
    );
  }
}
