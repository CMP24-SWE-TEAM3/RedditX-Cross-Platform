import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../styles/custom_icons.dart';
import '../../widgets/post/web_comments.dart';



/// The post design on web
class WebPostPage extends StatefulWidget {
  const WebPostPage({Key? key}) : super(key: key);

  @override
  State<WebPostPage> createState() => _WebPostPageState();
}

class _WebPostPageState extends State<WebPostPage> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    final screen_width = MediaQuery.of(context).size.width;
    print(screen_width);
    return Container(
      width: screen_width,
      height: double.infinity,
      color: Color.fromRGBO(50, 50, 50, 1),

      /// The main container the contains the pgae
      child: Container(
        width: screen_width * 0.85,
        height: double.infinity,
        margin: const EdgeInsets.only(right: 65, left: 65),
        color: Color.fromRGBO(218, 224, 230, 1),
        child: SingleChildScrollView(
          child: Row(
            children: [
              // Post & comments Container
              SizedBox(
                width: screen_width * 0.03,
              ),

              /// Post and comments area
              Container(
                  width: screen_width * 0.57,
                  height: 5000,
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 70),
                  // Post Area
                  child: Column(
                    children: [
                      Container(
                        height: 1000,
                        // this width will change later depending on post size
                        child: Row(children: [
                          // column of like and dislike
                          Container(
                            child: Column(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(CustomIcons.up_outline)),
                                Text(
                                  "145",
                                  style: TextStyle(
                                    fontSize: screen_width * 0.013,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(CustomIcons.down_outline)),
                              ],
                              mainAxisAlignment: MainAxisAlignment.start,
                            ),
                            width: screen_width * 0.03,
                          ),
                          // column of the real post
                          Container(
                            width: screen_width * 0.54,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: screen_width * 0.5,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 15,
                                      ),
                                      CircleAvatar(
                                        radius: 16.0,
                                        child: ClipRRect(
                                          child:
                                              Image.asset('assets/kareem.jpg'),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          "  r/kareem_community",
                                          style: TextStyle(
                                            fontSize: screen_width * 0.013,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          "  Posted by u/kareem_ashraf1 22h ago",
                                          style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: screen_width * 0.013,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                        width: screen_width * 0.50,
                                        child: Text(
                                          'kareem lorem vfi dplm d;dgpk kefpfk msoi okl 0okp  okm oklksmvspdk posokm mskreem lorem vfi dplm d;flf p dtpkgmdpookderperboep eombpe  mlm ;dg pldg ;ldgp etpom;kgdk pmdgpk kefpfk msoi okl 0imwl moieem lorem vfi dplm d;flf plm ;dg pldg ;lreem lorem vfi dplm d;flf p dtpkgmdpookderperboep eombpe  mlm ;dg pldg ;ldgp etpom;kgdk pmdgpk kefpfk msoi okl 0imwl moim i sok  okp  okm oklksmvspdk posokm mskreem lorem vfi dplm d;flf p dtpkgmdpookderperboep eombpe  mlm ;dg pldg ;ldgp etpom;kgdk pmdgpk kefpfk msoi okl 0imwl moieem lorem vfi dplm d;flf plm ;dg pldg ;lreem lorem vfi dplm d;flf p dtpkgmdpookderperboep eombpe  mlm ;dg pldg ;ldgp etpom;kgdk pmdgpk kefpfk msoi okl 0imwl moim i sok  okp  okm oklksmvspdk posokm mskreem lorem vfi dplm d;flf p dtpkgmdpookderperboep eombpe  mlm ;dg pldg ;ldgp etpom;kgdk pmdgpk kefpfk msoi okl 0imwl moieem lorem vfi dplm d;flf plm ;dg pldg ;lreem lorem vfi dplm d;flf p dtpkgmdpookderperboep eombpe  mlm ;dg pldg ;ldgp etpom;kgdk pmdgpk kefpfk msoi okl 0imwl moim i sok  okp  okm oklksmvspdk posokm mskreem lorem vfi dplm d;flf p dtpkgmdpookderperboep eombpe  mlm ;dg pldg ;ldgp etpom;kgdk pmdgpk kefpfk msoi okl 0imwl moieem lorem vfi dplm d;flf plm ;dg pldg ;lreem lorem vfi dplm d;flf p dtpkgmdpookderperboep eombpe  mlm ;dg pldg ;ldgp etpom;kgdk pmdgpk kefpfk msoi okl 0imwl moim i sok  okp  okm oklksmvspdk posokm mskreem lorem vfi dplm d;flf p dtpkgmdpookderperboep eombpe  mlm ;dg pldg ;ldgp etpom;kgdk pmdgpk kefpfk msoi okl 0imwl moieem lorem vfi dplm d;flf plm ;dg pldg ;lreem lorem vfi dplm d;flf p dtpkgmdpookderperboep eombpe  mlm ;dg pldg ;ldgp etpom;kgdk pmdgpk kefpfk msoi okl 0imwl moim i sok  okp  okm oklksmvspdk posokm mskreem lorem vfi dplm d;flf p dtpkgmdpookderperboep eombpe  mlm ;dg pldg ;ldgp etpom;kgdk pmdgpk kefpfk msoi okl 0imwl moieem lorem vfi dplm d;flf plm ;dg pldg ;lreem lorem vfi dplm d;flf p dtpkgmdpookderperboep eombpe  mlm ;dg pldg ;ldgp etpom;kgdk pmdgpk kefpfk msoi okl 0imwl moim i sok  okp  okm oklksmvspdk posokm mskreem lorem vfi dplm d;flf p dtpkgmdpookderperboep eombpe  mlm ;dg pldg ;ldgp etpom;kgdk pmdgpk kefpfk msoi okl 0imwl moieem lorem vfi dplm d;flf plm ;dg pldg ;lreem lorem vfi dplm d;flf p dtpkgmdpookderperboep eombpe  mlm ;dg pldg ;ldgp etpom;kgdk pmdgpk kefpfk msoi okl 0imwl moim i sok  okp  okm oklksmvspdk posokm mskreem lorem vfi dplm d;flf p dtpkgmdpookderperboep eombpe  mlm ;dg pldg ;ldgp etpom;kgdk pmdgpk kefpfk msoi okl 0imwl moieem lorem vfi dplm d;flf plm ;dg pldg ;lreem lorem vfi dplm d;flf p dtpkgmdpookderperboep eombpe  mlm ;dg pldg ;ldgp etpom;kgdk pmdgpk kefpfk msoi okl 0imwl moim i sok  okp  okm oklksmvspdk posokm mskreem lorem vfi dplm d;flf p dtpkgmdpookderperboep eombpe  mlm ;dg pldg ;ldgp etpom;kgdk pmdgpk kefpfk msoi okl 0imwl moi ;ldgp etpom;kgdk pmdgpk kefpfk msoi okl 0imwl moim i sok  okp  okm oklksmvspdk posokm mskreem lorem vfi dplm d;flf p dtpkgmdpookderperboep eombpe  mlm ;dg pldg ;ldgp etpom;kgdk pmdgpk kefpfk msoi okl 0imwl moim i sok  okp  okm oklksmvspdk posokm mskdgp etpom;kgdk pmdgpk kefpfk msoi okl 0imwl moim i sok  okp  okm oklksmvspdk posokm mskdoks  ok0isfm lkd foidfl odkf mldkf oidf lmdfok ldfkf oiefn lmdf foin',
                                          style: TextStyle(
                                              overflow: TextOverflow.clip),
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: screen_width * 0.5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            CustomIcons.comment,
                                            size: screen_width * 0.017,
                                          )),
                                      Text(
                                        '356 Comments',
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: screen_width * 0.015,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: screen_width * 0.01,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(CustomIcons.gift,
                                                    size:
                                                        screen_width * 0.017)),
                                            Text(
                                              'Award',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize:
                                                      screen_width * 0.015,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: screen_width * 0.01,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.share_outlined,
                                                    size:
                                                        screen_width * 0.017)),
                                            Text(
                                              'Share',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize:
                                                      screen_width * 0.015,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: screen_width * 0.01,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                    Icons.bookmark_border,
                                                    size:
                                                        screen_width * 0.017)),
                                            Text(
                                              'Save',
                                              style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: screen_width * 0.015,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: screen_width * 0.01,
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.more_horiz_rounded,
                                            size: screen_width * 0.017,
                                          )),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 35,
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 100),
                                  child: Text('Comment as kareem-138'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 200,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 100),
                                  child: Text('Sort By:',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                              ],
                            ),
                            WebComments(),
                            WebComments(),
                            WebComments(),
                            WebComments(),
                          ],
                        ),
                      ),
                    ],
                  )),
              Visibility(
                visible: isVisible = (screen_width > 1000) ? true : false,
                child: SizedBox(
                  width: screen_width * 0.011,
                ),
              ),

              /// sidebar container
              Visibility(
                visible: isVisible = (screen_width > 1000) ? true : false,
                child: Container(
                  width: screen_width * 0.24,
                  height: 5000,
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 70),
                ),
              ),
              Visibility(
                visible: isVisible = (screen_width > 1000) ? true : false,
                child: SizedBox(
                  width: screen_width * 0.015,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
