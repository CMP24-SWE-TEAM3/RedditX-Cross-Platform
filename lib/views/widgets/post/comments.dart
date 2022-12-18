import 'package:flutter/material.dart';
import 'package:reddit/models/comment_model.dart';
import 'package:reddit/styles/custom_icons.dart';
import 'package:reddit/views/widgets/post/comment_reply.dart';
import 'package:reddit/views/widgets/post/popup_menu.dart';

/// Mobile comment widget used in mobile post page
class comments extends StatefulWidget {
  String? authorId;
  String? text;
  DateTime? createdAt;
  bool? isRoot;
  String?
      replyingTo; // if root IS TRUE then it has the post ID, it return ID as string
  List<String>? replies;
  int? votesCount;
  List<voteModel>? voters;
  int? spamCount;

  comments({
    Key? key,
    // required this.authorId,
    // required this.isRoot,
    required this.text,
    // required this.createdAt,
    // required this.votesCount,
    // required this.replyingTo,
    // required this.replies,
    // required this.spamCount,
    // required this.voters,
  }) : super(key: key);

  @override
  State<comments> createState() => _commentsState();
}

class _commentsState extends State<comments> {
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
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
                      child: Text("Kareem Ashraf"),
                    ),
                    Text(" . 21h")
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${widget.text}",
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
                        leading: Icon(CustomIcons.gift),
                        title: Text("Award"),
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
                    Text("458"),
                    IconButton(
                        onPressed: () {}, icon: Icon(CustomIcons.down_outline)),
                  ],
                ),
              ),
              // commentReply(commentReplyText: "commentReplyText"),
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
