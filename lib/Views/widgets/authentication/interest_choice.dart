import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class InterestChoice extends StatefulWidget {
  const InterestChoice(
    this.pair,
    this.function, {
    Key? key,
  }) : super(key: key);

  final List pair;
  final Function function;

  @override
  State<InterestChoice> createState() => _InterestChoiceState();
}

class _InterestChoiceState extends State<InterestChoice> {
  bool ispressed = false;
  void preseed() {
    setState(() => ispressed = !ispressed);
    widget.function(widget.pair[0]);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      key: const ValueKey('icon_interest_page'),
      icon: Text(widget.pair[1]),
      onPressed: preseed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: ispressed
            ? (kIsWeb)
                ? Colors.blueGrey
                : const Color.fromARGB(255, 254, 220, 220)
            : const Color.fromARGB(255, 248, 251, 255),
        // minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      label: Text(
        widget.pair[0],
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
      ),
    );
  }
}
