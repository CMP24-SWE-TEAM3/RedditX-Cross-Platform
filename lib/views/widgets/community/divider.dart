import 'package:flutter/material.dart';

/// Divider
class Divider extends StatelessWidget {
  /// Divider constructor
  const Divider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: const Color.fromARGB(255, 166, 166, 166),
    );
  }
}
