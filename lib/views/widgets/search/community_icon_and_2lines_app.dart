import 'package:flutter/material.dart';

import '../../../methods/circular_image_widget.dart';

import '../../../models/search_model.dart';

///Community icon annd the two lines next to it in App posts search results
class CommIconAndTwoLinesApp extends StatelessWidget {
  const CommIconAndTwoLinesApp({
    super.key,
    required this.postData,
    required this.shownDate,
  });

  final PostInSearch postData;
  final String shownDate;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            CircularImageWidget(
              img: postData.communityIcon,
              radius: 30,
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.right,
                  postData.communityName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  textAlign: TextAlign.right,
                  '${postData.userName} . $shownDate',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color.fromRGBO(124, 124, 124, 1),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ],
        ),
        if (postData.nsfw)
          Row(
            children: const [
              SizedBox(
                width: 10,
              ),

              ///If the content is NSFW, write 'NSFW' in red
              Text(
                'NSFW',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Colors.red,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
