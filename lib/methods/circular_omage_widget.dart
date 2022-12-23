import 'package:flutter/material.dart';

class CircularImageWidget extends StatelessWidget {
  const CircularImageWidget({
    Key? key,
    required this.img,
    required this.radius,
  }) : super(key: key);

  ///image path or url
  final String img;

  ///Image diameter
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(
            'https://api.redditswe22.tech/subreddits/files/$img',
          ),
          //fit the photo inside the curcular box
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
