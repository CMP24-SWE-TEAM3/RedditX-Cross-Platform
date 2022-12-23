import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/profile_controller.dart';
import '../../../styles/custom_icons.dart';



import '../../../models/user_model.dart';


class ProfileComment extends StatelessWidget {
  final int index;

  const ProfileComment({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, value, child) {
        return InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Text(
                    "${(commentsPostTitles.isNotEmpty)?commentsPostTitles[index]:""}",
                    style: const TextStyle(fontSize: 15),
                  ),
                  Row(
                    children: [
                      Text(
                        "u/${userProfileComments[index]['authorId']??""}"
                            .replaceFirst("t2_", ""),
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "· ${value.calculateAge(DateTime.parse(userProfileComments[index]['createdAt']??""))}",
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${userProfileComments[index]['votesCount']??0}",
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Icon(
                        (userProfileComments[index]['voteType'] == 1)
                            ? CustomIcons.upBold
                            : CustomIcons.downBold,
                        color: Colors.grey,
                        size: 14,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${userProfileComments[index]['text']??"comment content"}",
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
