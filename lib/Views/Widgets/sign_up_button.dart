import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton(this.iconPath, this.iconText, {super.key});
  final String iconPath;
  final String iconText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton.icon(
        onPressed: () {},
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
          style: const TextStyle(fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 230, 230, 230),
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
      ),
    );
  }
}
