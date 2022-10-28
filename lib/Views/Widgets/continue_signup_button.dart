import 'package:flutter/material.dart';

class ContinueSignUpButton extends StatelessWidget {
  const ContinueSignUpButton({
    Key? key,
    required TextEditingController userNameController,
    required TextEditingController passwordController,
    required TextEditingController emailController,
    required this.function,
  })  : _userNameController = userNameController,
        _passwordController = passwordController,
        _emailController = emailController,
        super(key: key);

  final TextEditingController _userNameController;
  final TextEditingController _passwordController;
  final TextEditingController _emailController;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: _userNameController,
      builder: (context, value1, child) {
        return ValueListenableBuilder<TextEditingValue>(
            valueListenable: _passwordController,
            builder: (context, value2, child) {
              return ValueListenableBuilder<TextEditingValue>(
                  valueListenable: _emailController,
                  builder: (context, value3, child) {
                    return ElevatedButton(
                      onPressed: (value1.text.isNotEmpty &&
                              value2.text.isNotEmpty &&
                              value3.text.isNotEmpty)
                          ? () => function(_emailController,
                              _userNameController, _passwordController)
                          : null,
                      // onPressed: () => function(_emailController,
                      // _userNameController, _passwordController),
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
            });
      },
    );
  }
}
