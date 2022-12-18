import 'package:flutter/material.dart';
import 'package:reddit/views/screens/post/post_screen.dart';
import 'package:reddit/styles/custom_icons.dart';

/// Web comments widget used in web post page
class WebComments extends StatefulWidget {
  const WebComments({Key? key}) : super(key: key);

  @override
  State<WebComments> createState() => _WebCommentsState();
}

class _WebCommentsState extends State<WebComments> {
  @override
  Widget build(BuildContext context) {
    var screen_width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: screen_width * 0.5,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text("  r/kareem_community"),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "  22h ago",
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: screen_width * 0.47,
              child: Text(
                'kareem dgp etpomgp etpm d kdvni sk ksfvsfok i vi ismvlk  dikjsnviu 9 sibnv 9u k  i  iosv ;flf p dtpkgmdpookderperboep eombpe  mlmg pldg ldgp etpomgdk pmdgpk kefpfk msoi okl 0imwl',
              ),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CustomIcons.up_outline,
                      size: screen_width * 0.017,
                    )),
                Text(
                  "145",
                  style: TextStyle(
                    fontSize: screen_width * 0.013,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CustomIcons.down_outline,
                    size: screen_width * 0.017,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CustomIcons.comment,
                            size: screen_width * 0.017,
                          )),
                      Text(
                        'Reply',
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: screen_width * 0.013,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screen_width * 0.008,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        'Give Award',
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: screen_width * 0.013,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screen_width * 0.008,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        'Share',
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: screen_width * 0.013,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screen_width * 0.008,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        'Report',
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: screen_width * 0.013,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screen_width * 0.008,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        'Save',
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: screen_width * 0.013,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screen_width * 0.008,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        'Follow',
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: screen_width * 0.013,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
