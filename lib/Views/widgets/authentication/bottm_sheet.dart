import 'package:flutter/material.dart';

class BottomSheetProfilePicture extends StatelessWidget {
  const BottomSheetProfilePicture(this.function1, this.function2, {super.key});

  final VoidCallback function1;
  final Function function2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Choose Profile Picture',
            style: textStyletile(),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  icon: const Icon(
                    Icons.camera,
                  ),
                  onPressed: function1,
                  label: Text(
                    'Camera',
                    style: textStyle(),
                  ),
                ),
                TextButton.icon(
                  icon: const Icon(
                    Icons.image,
                  ),
                  onPressed: () => function2(),
                  label: Text(
                    'Gallery',
                    style: textStyle(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  TextStyle textStyletile() {
    return const TextStyle(
      color: Colors.grey,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle textStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 20,
    );
  }
}
