import 'package:flutter/material.dart';

class comments extends StatefulWidget {
  const comments({Key? key}) : super(key: key);

  @override
  State<comments> createState() => _commentsState();
}

class _commentsState extends State<comments> {
  double container_height = 200;
  TextOverflow comments_text = TextOverflow.clip;
  bool is_visible = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() {
        container_height = container_height == 50 ? 200 : 50;
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
                    'dgdbbgfkj okfmog om okjvmok ldofkn lcvx ovjndfk swo lcvm oief  lmd oi mdvlm qo ldmfd foidf . ,dv oj wr. m df9o',
                    overflow: comments_text,
                    style: TextStyle(),
                  ),
                ),
              ),
              Visibility(
                visible: is_visible,
                child: Row(
                  children: [
                    SizedBox(
                      width: 90,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_vert_rounded),
                      color: Colors.black,
                    ),
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
                        onPressed: () {},
                        icon: Icon(Icons.arrow_upward_rounded)),
                    Text("145"),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_downward)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
