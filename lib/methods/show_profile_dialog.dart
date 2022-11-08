import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit/models/post_model.dart';
import 'package:reddit/models/user_model.dart';

Future<void> showeProfileDialog(BuildContext context, int index) async {
  showDialog<void>(
    context: context,
    //barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 45,
              backgroundImage: NetworkImage(users[index].avatar),
            ),
            const SizedBox(height: 30),
            Text(
              postsList[index].username,
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
                onTap: () {},
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
                        "View profile",
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
