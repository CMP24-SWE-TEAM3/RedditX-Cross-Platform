import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit/Controller/post_mobile_provider.dart';
import 'package:reddit/View/Widgets/web_comments.dart';

class WebPostPage extends StatefulWidget {
  const WebPostPage({Key? key}) : super(key: key);

  @override
  State<WebPostPage> createState() => _WebPostPageState();
}

class _WebPostPageState extends State<WebPostPage> {
  @override
  Widget build(BuildContext context) {
    var screen_width = MediaQuery.of(context).size.width;

    print(screen_width);
    return Container(
      width: screen_width,
      height: double.infinity,
      color: Color.fromRGBO(50, 50, 50, 1),
      child: Container(
        width: screen_width * 0.85,
        height: double.infinity,
        margin: const EdgeInsets.only(right: 65, left: 65),
        color: Color.fromRGBO(218, 224, 230, 1),
        child: SingleChildScrollView(
          child: Row(
            children: [
              // Post & comments Container
              Container(
                  width: screen_width * 0.57,
                  height: 5000,
                  color: Colors.white,
                  margin: const EdgeInsets.only(right: 12, left: 36, top: 70),
                  // Post Area
                  child: Column(
                    children: [
                      Container(
                        height: 950,
                        // this width will change later depending on post size
                        child: Row(children: [
                          // column of like and dislike
                          Column(
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
                          // column of the real post
                          Column(
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
                                        child: Image.asset('assets/kareem.jpg'),
                                        borderRadius:
                                            BorderRadius.circular(50.0),
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
                                        "  Posted by u/kareem_ashraf1 22h ago",
                                        style: TextStyle(color: Colors.black45),
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
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.mode_comment_outlined)),
                                  Text(
                                    '356 Comments',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.card_giftcard)),
                                        Text(
                                          'Award',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.share_outlined)),
                                        Text(
                                          'Share',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.bookmark_border)),
                                        Text(
                                          'Save',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.more_horiz_rounded)),
                                  SizedBox(
                                    width: 120,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              Row(
                                children: [
                                  Text('Comment as kareem-138'),
                                  SizedBox(
                                    width: 450,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 200,
                              ),
                              Row(
                                children: [
                                  Text('Sort By:',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                  SizedBox(
                                    width: 550,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ]),
                      ),
                      WebComments(),
                      WebComments(),
                      WebComments(),
                      WebComments(),
                    ],
                  )),
              // sidebar container
              Container(
                width: screen_width * 0.24,
                height: 5000,
                color: Colors.white,
                margin: const EdgeInsets.only(right: 20, left: 5, top: 70),
              )
            ],
          ),
        ),
      ),
    );
  }
}
