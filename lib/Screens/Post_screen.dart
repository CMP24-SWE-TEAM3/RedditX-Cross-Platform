import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
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
                        onPressed: () {}, icon: Icon(Icons.arrow_downward)),
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
                          onPressed: () {}, icon: Icon(Icons.share_outlined)),
                      Text("Share   "),
                    ],
                  ),
                ),
              ],
            ),
            Container(
                width: double.infinity,
                height: 35,
                color: Color.fromRGBO(218, 224, 230, 1),
                child: InkWell(
                  onTap: () => sort_comments(context),
                  child: Row(children: [
                    Text('   Sort Comment'),
                  ]),
                ))
          ]),
        ),
      ),
    );
  }
}
