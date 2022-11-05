import 'package:flutter/material.dart';

class InterestChoice extends StatefulWidget {
  const InterestChoice(
    this.txt,
    this.function, {
    Key? key,
  }) : super(key: key);

  final String txt;
  final Function function;

  @override
  State<InterestChoice> createState() => _InterestChoiceState();
}

class _InterestChoiceState extends State<InterestChoice> {
  bool ispressed = false;
  void preseed() {
    setState(() => ispressed = !ispressed);
    widget.function(widget.txt);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const SizedBox(
        width: 35,
        height: 35,
        child: null,
      ),
      onPressed: preseed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: ispressed
            ? Color.fromARGB(255, 254, 220, 220)
            : const Color.fromARGB(255, 248, 251, 255),
        // minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      label: Text(
        widget.txt,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
      ),
    );
  }
}
