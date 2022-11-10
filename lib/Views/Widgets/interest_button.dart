import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class InterestButton extends StatelessWidget {
  const InterestButton(
    this.enable,
    this.txt,
    this.function,
    // this.ctx,
    {
    Key? key,
  }) : super(key: key);

  final bool enable;
  final String txt;
  final VoidCallback function;
  // final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (enable) ? function : () {},
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: (enable)
            ? Theme.of(context).colorScheme.primary
            : (kIsWeb)
                ? Colors.blueGrey
                : const Color.fromARGB(144, 240, 88, 23),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        txt,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }
}
