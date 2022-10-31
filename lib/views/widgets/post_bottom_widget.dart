import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../styles/custom_icons.dart';

class PostBottomWidget extends StatelessWidget {
  const PostBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: IconButton(
              onPressed: () {}, icon: const Icon(CustomIcons.up_outline)),
        ),
        const Text("1500"),
        Expanded(
          child: IconButton(
              onPressed: () {}, icon: const Icon(CustomIcons.down_outline)),
        ),
        Expanded(
          child: IconButton(
              onPressed: () {}, icon: const Icon(CustomIcons.comment)),
        ),
        const Text("60"),
        Expanded(
          child: IconButton(
              onPressed: () {}, icon: const Icon(Icons.share_outlined)),
        ),
        const Text("Share"),
        Expanded(
          child:
              IconButton(onPressed: () {}, icon: const Icon(CustomIcons.gift)),
        )
      ],
    );
  }
}
