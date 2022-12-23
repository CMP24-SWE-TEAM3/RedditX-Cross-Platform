import 'package:flutter/material.dart';

import '../../../methods/circular_image_widget.dart';

import '../../../models/search_model.dart';

///Community icon and the line next to it in web posts search results
class CommIconAndNextLinesWeb extends StatelessWidget {
  const CommIconAndNextLinesWeb({
    super.key,
    required this.postData,
    required this.shownDate,
  });

  final PostInSearch postData;
  final String shownDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            CircularImageWidget(
              img: postData.communityIcon,
              radius: 20,
            ),
            const SizedBox(
              width: 5,
            ),
            Row(
              children: [
                Text(
                  '${postData.communityName} . ',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Text(
                'Posted by ${postData.userName} $shownDate',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color.fromRGBO(124, 124, 124, 1),
                ),
              ),
            ),
          ],
        ),

        ///If the content is NSFW, write 'NSFW' in red
        if (postData.nsfw)
          Row(
            children: const [
              SizedBox(
                width: 10,
              ),
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
