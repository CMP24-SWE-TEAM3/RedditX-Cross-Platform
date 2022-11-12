import 'package:flutter/material.dart';

class MailMeButton1 extends StatelessWidget {
  const MailMeButton1({
    Key? key,
    required TextEditingController userNameController,
    required TextEditingController emailController,
    required this.function,
    required this.ctx,
  })  : _userNameController = userNameController,
        _emailController = emailController,
        super(key: key);

  final TextEditingController _userNameController;
  final TextEditingController _emailController;
  final Function function;
  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: _userNameController,
      builder: (context, value1, child) {
        return ValueListenableBuilder<TextEditingValue>(
            valueListenable: _emailController,
            builder: (context, value2, child) {
              return ElevatedButton(
                onPressed: (value1.text.isNotEmpty && value2.text.isNotEmpty)
                    ? () => function(_userNameController, _emailController, ctx)
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Email me',
                  style: TextStyle(fontSize: 18),
                ),
              );
            });
      },
    );
  }
}

class MailMeButton2 extends StatelessWidget {
  const MailMeButton2({
    Key? key,
    required TextEditingController emailController,
    required this.function,
    required this.ctx,
  })  : _emailController = emailController,
        super(key: key);

  final TextEditingController _emailController;
  final Function function;
  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
        valueListenable: _emailController,
        builder: (context, value1, child) {
          return ElevatedButton(
            onPressed: (value1.text.isNotEmpty)
                ? () => function(_emailController, ctx)
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Email me',
              style: TextStyle(fontSize: 18),
            ),
          );
        });
  }
}
