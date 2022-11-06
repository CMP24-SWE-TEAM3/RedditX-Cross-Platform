import 'package:flutter/material.dart';
import 'package:reddit/View/Screens/post_page_web.dart';
import 'package:reddit/View/Widgets/Comments.dart';
import 'package:provider/provider.dart';
import 'package:reddit/Controller/post_mobile_provider.dart';
import 'package:reddit/View/Styles/custom_icons.dart';
import 'package:reddit/View/Widgets/Comments.dart';

class post_screen extends StatefulWidget {
  const post_screen({Key? key}) : super(key: key);

  @override
  State<post_screen> createState() => _post_screenState();
}

class _post_screenState extends State<post_screen> {
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
    return Scaffold(
      appBar: AppBar(
        elevation: 1.5,
        leadingWidth: 100,
        title: Text(''),
        backgroundColor: Colors.white54,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_rounded),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert_rounded),
            color: Colors.white,
          ),
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
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_upward_rounded)),
                            Text("145"),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_downward)),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.mode_comment_outlined)),
                              Text("145"),
                            ],
                          ),
                        ),
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
                    comments(),
                    comments(),
                    comments(),
                    comments(),
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
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 100,
                                    color: Color.fromARGB(255, 238, 240, 242)),
                              ),
                              fillColor: Color.fromRGBO(242, 243, 244, 1),
                              filled: true,
                              hintText: '   Add a comment',
                              hintStyle:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_downward_rounded)),
                    ],
                  ),
                ),
              ),
            ])
          : WebPostPage(),
    );
  }
}
