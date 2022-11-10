import 'package:flutter/material.dart';
import 'package:reddit/View/Screens/post_page_web.dart';
import 'package:reddit/View/Widgets/Comments.dart';
import 'package:provider/provider.dart';
import 'package:reddit/Controller/post_mobile_provider.dart';
import 'package:reddit/View/Styles/custom_icons.dart';
import 'package:reddit/View/Widgets/Comments.dart';
import 'package:reddit/View/Widgets/popup_menu.dart';

class post_screen extends StatefulWidget {
  const post_screen({Key? key}) : super(key: key);

  @override
  State<post_screen> createState() => _post_screenState();
}

class _post_screenState extends State<post_screen> {
  List commentsText = [
    'The result of the code above will be a padding of 10% of the height of the screen from top and 10% of the width of the screen from left. That’s how you can set your padding dynamically. ( Also be aware that you cannot use const keyword if you’re using mediaQuery values as the value is not available at the compile time.',
    'What you are doing right now is that there will be a padding of 10 pixels from top and 10 pixels from left side of the screen. So that the Container might have bigger or smaller shapes on different screen sizes. You can do it dynamically by using the screenSize values and media query so that you set the padding according to the screen size:',
    'The result of the code above will be a padding of 10% of the height of the screen from top and 10% of the width of the screen from left. That’s how you can set your padding dynamically. ( Also be aware that you cannot use const keyword if you’re using mediaQuery values as the value is not available at the compile time.',
    'What you are doing right now is that there will be a padding of 10 pixels from top and 10 pixels from left side of the screen. So that the Container might have bigger or smaller shapes on different screen sizes. You can do it dynamically by using the screenSize values and media query so that you set the padding according to the screen size:',
    'The result of the code above will be a padding of 10% of the height of the screen from top and 10% of the width of the screen from left. That’s how you can set your padding dynamically. ( Also be aware that you cannot use const keyword if you’re using mediaQuery values as the value is not available at the compile time.',
    'What you are doing right now is that there will be a padding of 10 pixels from top and 10 pixels from left side of the screen. So that the Container might have bigger or smaller shapes on different screen sizes. You can do it dynamically by using the screenSize values and media query so that you set the padding according to the screen size:',
  ];

  void sort_comments(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'SORT COMMENTS BY',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
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
                    children: [
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
                    children: [
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
                    children: [
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
                    children: [
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
                    children: [
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
    var screen_width = MediaQuery.of(context).size.width;
    Icon postSubscribe = Icon(Icons.notifications_none_rounded);
    return Scaffold(
      appBar: AppBar(
        elevation: 1.5,
        leadingWidth: 100,
        title: Text(''),
        backgroundColor: Colors.white24,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                postSubscribe =
                    (postSubscribe == Icon(Icons.notifications_none_rounded))
                        ? Icon(Icons.notifications)
                        : Icon(Icons.notifications_none_rounded);
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
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.more_vert_rounded),
          //   color: Colors.white,
          // ),
          // PopupMenuButton(
          //     itemBuilder: ((context) => [
          //           PopupMenuItem(
          //               child: Text(
          //             'kareem',
          //           )),
          //           PopupMenuItem(
          //               child: Text(
          //             'ashraf',
          //           )),
          //           PopupMenuItem(
          //               child: Text(
          //             'abdo',
          //           )),
          //           PopupMenuItem(
          //               child: Text(
          //             'ali',
          //           )),
          //         ])),
          CircleAvatar(
            radius: 16.0,
            child: ClipRRect(
              child: Image.asset('assets/kareem.jpg'),
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: (screen_width < 600)
          ? Stack(alignment: AlignmentDirectional.bottomCenter, children: [
              SingleChildScrollView(
                child: Container(
                  child: Column(children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        CircleAvatar(
                          radius: 16.0,
                          child: ClipRRect(
                            child: Image.asset('assets/kareem.jpg'),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Text("r/kareem_community"),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "u/kareem_ashraf1",
                                style: TextStyle(color: Colors.black45),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        child: Text(
                            'kareem aaaaaaaaaaaaaaaaaaaasssssssssssadvsfojbndflbkjndfoj dlfkjn od lojsnl  xof n,cvm oisd  mdvoi  dfk m  wpondfkm odifn lmdg goin'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Spacer(),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  Provider.of<MobilePostProvider>(context)
                                      .likePost();
                                });
                              },
                              icon: Icon(CustomIcons.up_outline),
                            ),
                            Text('0'),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    Provider.of<MobilePostProvider>(context)
                                        .disLikePost();
                                  });
                                },
                                icon: Icon(CustomIcons.down_outline)),
                          ],
                        ),
                        Spacer(
                          flex: 2,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(CustomIcons.comment)),
                              Text("145"),
                            ],
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.share_outlined)),
                              Text("Share   "),
                            ],
                          ),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {}, icon: Icon(CustomIcons.gift)),
                      ],
                    ),
                    Container(
                        width: double.infinity,
                        height: 35,
                        color: Color.fromRGBO(242, 243, 244, 1),
                        child: InkWell(
                          onTap: () => sort_comments(context),
                          // {
                          //   showDefaultBottomSheet(
                          //     context,
                          //     "SORT POSTS BY",
                          //     5,
                          //     bottomSheetPostSortIcons_1,
                          //     ["Hot", "New", "Top", "Controversial", "Rising"],
                          //   );
                          // },
                          child: Row(children: [
                            Text('   Sort Comment'),
                          ]),
                        )),
                    // for(int i = 0; i< commentsText.length; i++ ){
                    //   comments(commentsText[i]),
                    // },
                    Column(
                      children: <Widget>[
                        for (var item in commentsText)
                          comments(
                            commentText: item,
                          )
                      ],
                    ),

                    SizedBox(
                      height: 40,
                      width: double.infinity,
                    )
                  ]),
                ),
              ),
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
                              color: Color.fromRGBO(242, 243, 244, 1),
                              borderRadius: BorderRadius.circular(6)),
                          width: screen_width * 0.82,
                          height: 40,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '  Add a comment',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      // Expanded(
                      //   child: InkWell(
                      //     onTap: () {},
                      //     child: TextFormField(
                      //       decoration: InputDecoration(
                      //         enabledBorder: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(8),
                      //           borderSide: BorderSide(
                      //               width: 100,
                      //               color: Color.fromARGB(255, 238, 240, 242)),
                      //         ),
                      //         fillColor: Color.fromRGBO(242, 243, 244, 1),
                      //         filled: true,
                      //         hintText: '   Add a comment',
                      //         hintStyle:
                      //             TextStyle(fontSize: 20, color: Colors.black),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_circle_down_sharp)),
                    ],
                  ),
                ),
              ),
            ])
          : WebPostPage(),
    );
  }
}
