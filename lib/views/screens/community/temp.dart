import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit/controllers/community_model_controller.dart';
import 'package:reddit/models/community_model.dart';
import 'package:reddit/models/post_model.dart';
import 'package:reddit/services/community_services.dart';

class Temp extends StatelessWidget {
  List<PostModel> list = [];
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            color: Colors.blue,
            child: Consumer<CommunityModelProvider>(
              builder: (context, value, child) {
                return MaterialButton(onPressed: () {
                  // value.getPosts("Art", "hot", list, 2, 40);
                  // print(postsList.length);
                  voteAPI('0', 1);
                });
              },
            )));
    throw UnimplementedError();
  }
}
