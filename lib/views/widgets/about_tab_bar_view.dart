import 'package:flutter/material.dart';

class AboutTabBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Column(
      children: [
        Text("Subreddit Rules"),
        ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.red,
              child: Text("kjhg"),
            );
          },
        ),
      ],
    );
    throw UnimplementedError();
  }
}
