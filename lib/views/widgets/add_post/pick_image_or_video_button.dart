// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/add_post_controller.dart';

class PickButton extends StatelessWidget {
  const PickButton({
    Key? key,
    required this.isImage,
  }) : super(key: key);

  final bool isImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: const Color.fromARGB(120, 158, 158, 158),
      child: IconButton(
        key: isImage ? const Key('pick_image') : const Key('pick_video'),
        onPressed: () async {
          isImage
              ? await Provider.of<AddPostController>(
                  context,
                  listen: false,
                ).pickImages()
              : await Provider.of<AddPostController>(
                  context,
                  listen: false,
                ).pickvideo();
        },
        icon: const Icon(
          Icons.add,
          color: Colors.blue,
        ),
      ),
    );
  }
}
