import 'package:flutter/material.dart';
import '../../models/search_model.dart';
import 'circular_image_widget.dart';

//community icon and the line next to it in web
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
    return Row(
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
        Text(
          '${postData.communityName} . ',
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Colors.black,
          ),
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
    );
  }
}
