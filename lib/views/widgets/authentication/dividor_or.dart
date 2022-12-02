import 'package:flutter/material.dart';

class DividerOR extends StatelessWidget {
  const DividerOR({
    Key? key,
    required this.fixedWidth,
  }) : super(key: key);

  final int fixedWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: fixedWidth * 0.07,
          child: const Divider(
            thickness: 1,
            color: Colors.black12,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('OR'),
        ),
        SizedBox(
          width: fixedWidth * 0.09,
          child: const Divider(
            thickness: 1,
            color: Colors.black12,
          ),
        ),
      ],
    );
  }
}
