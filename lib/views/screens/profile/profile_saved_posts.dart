import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_project/controllers/profile_model_controller.dart';
import 'package:search_project/models/user_model.dart';

import '../../widgets/community/mobile_post_classic.dart';

class UserSavedPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Consumer<ProfileModelProvider>(builder: (context,value,child){
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: const Text(
            "Saved",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                   MobilePostClassic(
                        postType: savedPosts[index]['type'],
                        context: context,
                        postPlace: "profile",
                        index: index,
                        posts: savedPosts,
                        voters: [],
                      ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: savedPosts.length),
            )
          ],
        ));
    },));
  }
}
