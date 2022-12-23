import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/profile_model_controller.dart';


import '../../config/constants.dart';

import '../../models/post_model.dart';
import '../../views/screens/profile/profile_page.dart';

/// Show Profile Dialog when a user name text button pressed

Future<void> showeProfileDialog(BuildContext context, int index) async {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        key: const ValueKey("profile_dialog"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 45,
              backgroundImage:
                  NetworkImage(communityPostsList[index]['userID']!['avatar']!),
            ),
            const SizedBox(height: 30),
            Text(
              (!iSMOCK)
                  ? "u/${communityPostsList[index]['userID']['_id']}"
                      .replaceFirst("t2_", "")
                  : "u/${communityPostsList[index]['userID']['userID']}"
                      .replaceFirst("t2_", ""),
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "20.206",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Post Karma",
                      style: TextStyle(
                          color: Color.fromARGB(255, 59, 59, 59), fontSize: 13),
                    )
                  ],
                )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "546",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Commment Karma",
                      style: TextStyle(
                          color: Color.fromARGB(255, 59, 59, 59), fontSize: 13),
                    )
                  ],
                )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () async{
                  await Provider.of<ProfileModelProvider>(context, listen: false).getProfilePosts(
 communityPostsList[index]['userID']['_id']);
  
  // ignore: use_build_context_synchronously
  await Provider.of<ProfileModelProvider>(context,
                          listen: false).getProfileComments( communityPostsList[index]['userID']['_id']);
                           // ignore: use_build_context_synchronously
                           await Provider.of<ProfileModelProvider>(context,
                          listen: false).getProfileAbout( communityPostsList[index]['userID']['_id']);
                          
                  // ignore: use_build_context_synchronously
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage(userID: communityPostsList[index]['userID']
                                  ['_id'], context: context)));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: const [
                      Icon(Icons.person),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "View profile",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
            InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: const [
                      Icon(Icons.messenger_outline_sharp),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Start Chat",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
            InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: const [
                      Icon(Icons.block_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Block account",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
            InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: const [
                      Icon(CupertinoIcons.envelope),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Invite to community",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      );
    },
  );
}
