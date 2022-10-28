import 'package:flutter/material.dart';

class ContinueLoginButton extends StatelessWidget {
  const ContinueLoginButton({
    Key? key,
    required TextEditingController userNameController,
    required TextEditingController passwordController,
    required this.function,
  })  : _userNameController = userNameController,
        _passwordController = passwordController,
        super(key: key);

  final TextEditingController _userNameController;
  final TextEditingController _passwordController;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: _userNameController,
      builder: (context, value1, child) {
        return ValueListenableBuilder<TextEditingValue>(
            valueListenable: _passwordController,
            builder: (context, value2, child) {
              return ElevatedButton(
                onPressed: (value1.text.isNotEmpty && value2.text.isNotEmpty)
                    ? () => function
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
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
      },
    );
  }
}
