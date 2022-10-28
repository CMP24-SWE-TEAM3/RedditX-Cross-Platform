import 'package:flutter/material.dart';

class UserNameText extends StatefulWidget {
  const UserNameText({
    Key? key,
    required this.userNameController,
  }) : super(key: key);

  final TextEditingController userNameController;

  @override
  State<UserNameText> createState() => _UserNameTextState();
}

class _UserNameTextState extends State<UserNameText> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: Colors.blue,
          ),
        ),
        labelText: 'Username',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        filled: true,
        fillColor: Color.fromARGB(31, 126, 114, 114),
      ),
      controller: widget.userNameController,
      onSubmitted: (_) {},
    );
  }
}

class EmailText extends StatefulWidget {
  const EmailText({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  State<EmailText> createState() => _EmailTextState();
}

class _EmailTextState extends State<EmailText> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: Colors.blue,
          ),
        ),
        labelText: 'Email',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        filled: true,
        fillColor: Color.fromARGB(31, 126, 114, 114),
      ),
      controller: widget.emailController,
      keyboardType: TextInputType.emailAddress,
      onSubmitted: (_) {},
    );
  }
}

class PasswordText extends StatefulWidget {
  const PasswordText({
    Key? key,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController passwordController;

  @override
  State<PasswordText> createState() => _PasswordTextState();
}

class _PasswordTextState extends State<PasswordText> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: Colors.blue,
          ),
        ),
        labelText: 'Password',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        filled: true,
        fillColor: Color.fromARGB(31, 126, 114, 114),
      ),
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      controller: widget.passwordController,
      onSubmitted: (_) {},
    );
  }
}
