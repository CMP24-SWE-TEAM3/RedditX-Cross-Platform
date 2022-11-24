import 'package:flutter/material.dart';

class ContinueUserName extends StatelessWidget {
  const ContinueUserName({
    Key? key,
    required TextEditingController userNameController,
    required this.function,
    required this.ctx,
  })  : _userNameController = userNameController,
        super(key: key);

  final TextEditingController _userNameController;
  final Function function;
  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
        valueListenable: _userNameController,
        builder: (context, value1, child) {
          return ElevatedButton(
            onPressed: (value1.text.isNotEmpty)
                ? () => function(_userNameController, ctx)
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Continue',
              style: TextStyle(fontSize: 18),
            ),
          );
        });
  }
}
