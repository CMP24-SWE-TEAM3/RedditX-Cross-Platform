import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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
      label: Padding(
        padding: (kIsWeb)
            ? const EdgeInsets.only(
                top: 10,
                bottom: 10,
              )
            : const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
        child: Text(
          iconText,
          style: TextStyle(
            fontSize: (kIsWeb) ? 14 : 18,
            color:
                (kIsWeb) ? Theme.of(context).colorScheme.primary : Colors.black,
          ),
        ),
      ),
      style: (kIsWeb)
          ? ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              // minimumSize: const Size(double.infinity, 50),
              side: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            )
          : ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 230, 230, 230),
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
    );
  }
}
