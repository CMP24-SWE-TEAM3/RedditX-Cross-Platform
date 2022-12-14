import 'package:flutter/material.dart';
import 'package:search_project/styles/custom_icons.dart';

class ProfileComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(10),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Post title",
                style: TextStyle(fontSize: 15),
              ),
              Row(
                children: [
                  Text(
                    "u/user_name",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "· 1mo",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "· 1",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Icon(
                    CustomIcons.upBold,
                    color: Colors.grey,
                    size: 14,
                  )
                ],
              ),
              Text(
                "comment content",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }
}
