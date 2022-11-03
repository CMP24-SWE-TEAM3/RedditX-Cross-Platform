// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CircularImageWidget extends StatelessWidget {
  const CircularImageWidget({
    Key? key,
    required this.img,
  }) : super(key: key);
  //image path or url
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(
            img,
          ),
          //fit the photo inside the curcular box
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
