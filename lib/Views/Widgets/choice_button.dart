import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  const ChoiceButton(
    this.txt,
    this.function,
    this.ctx, {
    Key? key,
  }) : super(key: key);

  final String txt;
  final Function function;
  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => function(txt, ctx),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 239, 246, 255),
        // minimumSize: const Size(double.infinity, 50),
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
