import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit/controllers/community_controller_mobile.dart';

import '../../styles/custom_icons.dart';

//still working on over flow problems

class WebPostDartWidget extends StatelessWidget {
  const WebPostDartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CommunityProvider>(
      builder: (context, value, child) => Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              value.likePost();
                            },
                            icon: (value.isPostLiked)
                                ? const Icon(
                                    CustomIcons.up_bold,
                                    color: Colors.deepOrange,
                                  )
                                : const Icon(CustomIcons.up_outline)),
                        Text("${value.reactsCount}"),
                        IconButton(
                            onPressed: () {
                              value.disLikePost();
                            },
                            icon: (value.isPostDisliked)
                                ? const Icon(
                                    CustomIcons.down_bold,
                                    color: Colors.blue,
                                  )
                                : const Icon(CustomIcons.down_outline)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 10,
                              //child: ,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              height: 20,
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Cool kids community",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        color: Colors.black),
                                  )),
                            ),
                            SizedBox(
                              height: 20,
                              child: TextButton(
                                onPressed: () {},
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    minWidth: 200.0,
                                    maxWidth: 300.0,
                                    minHeight: 30.0,
                                    maxHeight: 100.0,
                                  ),
                                  child: const AutoSizeText(
                                    "Posted by cake girl 19 hours ago",
                                    style: TextStyle(
                                        fontSize: 10.0, color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: 200.0,
                            maxWidth: 300.0,
                            minHeight: 30.0,
                            maxHeight: 100.0,
                          ),
                          child: const AutoSizeText(
                            "yourTexttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
    throw UnimplementedError();
  }
}
