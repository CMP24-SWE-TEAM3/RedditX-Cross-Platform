import 'package:flutter/material.dart';
import 'package:reddit/View/Styles/custom_icons.dart';
import 'package:reddit/View/Widgets/popup_menu.dart';

/// Mobile comment widget used in mobile post page
class comments extends StatefulWidget {
  String commentText;
  comments({Key? key, required this.commentText}) : super(key: key);

  @override
  State<comments> createState() => _commentsState(commentText);
}

class _commentsState extends State<comments> {
  String commentText;

  _commentsState(this.commentText);

  double container_height = 230;
  TextOverflow comments_text = TextOverflow.clip;
  bool is_visible = true;

  @override
  Widget build(BuildContext context) {
    var screen_size = MediaQuery.of(context).size;

    /// controlling the size of the comment when clicked
    return InkWell(
      onTap: () => setState(() {
        container_height = container_height == 50 ? 230 : 50;
        comments_text =
            container_height == 50 ? TextOverflow.ellipsis : TextOverflow.clip;
        is_visible = container_height == 50 ? false : true;
      }),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 250),
          height: container_height,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 7,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 10.0,
                      child: ClipRRect(
                        child: Image.asset('assets/kareem.jpg'),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text("r/kareem_community"),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "${commentText}",
                    overflow: comments_text,
                    style: TextStyle(),
                  ),
                ),
              ),
              Visibility(
                visible: is_visible,
                child: Row(
                  children: [
                    Spacer(
                      flex: 10,
                    ),
                    PopupMen(MenuList: [
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
                        leading: Icon(Icons.notifications_none_rounded),
                        title: Text("Get reply notifications"),
                      )),
                      PopupMenuItem(
                          child: ListTile(
                        leading: Icon(Icons.content_copy_rounded),
                        title: Text("Copy text"),
                      )),
                      PopupMenuItem(
                          child: ListTile(
                        leading: Icon(Icons.close_fullscreen),
                        title: Text("Collapse thread"),
                      )),
                      PopupMenuItem(
                          child: ListTile(
                        leading: Icon(Icons.edit),
                        title: Text("Edit"),
                      )),
                      PopupMenuItem(
                          child: ListTile(
                        leading: Icon(Icons.delete),
                        title: Text("Delete"),
                      )),
                    ], icon: Icon(Icons.more_vert_rounded)),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.reply_sharp),
                            color: Colors.black,
                          ),
                          Text("Reply"),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {}, icon: Icon(CustomIcons.up_outline)),
                    Text("145"),
                    IconButton(
                        onPressed: () {}, icon: Icon(CustomIcons.down_outline)),
                  ],
                ),
              ),
              Container(
                height: 7,
                width: double.infinity,
                child: Text(''),
                color: Color.fromRGBO(242, 243, 244, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
