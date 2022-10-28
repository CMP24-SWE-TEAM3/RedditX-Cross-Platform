import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton(this.iconPath, this.iconText, this.function, {super.key});
  final String iconPath;
  final String iconText;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => function(context),
      icon: SizedBox(
        width: 35,
        height: 35,
        child: Image.asset(
          iconPath,
          width: 35,
        ),
      ),
      label: Text(
        iconText,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 230, 230, 230),
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
    );
  }
}
