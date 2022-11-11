import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class SignUpButton extends StatelessWidget {
  const SignUpButton(this.iconPath, this.iconText, this.function, {super.key});
  final String iconPath;
  final String iconText;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return (kIsWeb)
        ? _WButton(function: function, iconPath: iconPath, iconText: iconText)
        : _MButton(function: function, iconPath: iconPath, iconText: iconText);
  }
}

class _WButton extends StatefulWidget {
  const _WButton({
    Key? key,
    required this.function,
    required this.iconPath,
    required this.iconText,
  }) : super(key: key);

  final Function function;
  final String iconPath;
  final String iconText;

  @override
  State<_WButton> createState() => _WButtonState();
}

class _WButtonState extends State<_WButton> {
  var colorButton = false;
  void onHover() {
    setState(() {
      colorButton = true;
    });
  }

  void onLeave() {
    setState(() {
      colorButton = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (val) => onHover(),
      onExit: (val) => onLeave(),
      child: ElevatedButton.icon(
        onPressed: () {
          widget.function();
        },
        icon: SizedBox(
          width: 35,
          height: 35,
          child: Image.asset(
            widget.iconPath,
            width: 35,
          ),
        ),
        label: Padding(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 10,
          ),
          child: Text(
            widget.iconText,
            style: TextStyle(
              fontSize: 14,
              color: colorButton
                  ? Colors.white
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: colorButton ? Colors.blue : Colors.white,
          // minimumSize: const Size(double.infinity, 50),
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}

class _MButton extends StatelessWidget {
  const _MButton({
    Key? key,
    required this.function,
    required this.iconPath,
    required this.iconText,
  }) : super(key: key);

  final Function function;
  final String iconPath;
  final String iconText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        function();
      },
      icon: SizedBox(
        width: 35,
        height: 35,
        child: Image.asset(
          iconPath,
          width: 35,
        ),
      ),
      label: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Text(
          iconText,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 230, 230, 230),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
