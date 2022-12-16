import 'package:flutter/material.dart';

///Text field for username in settings
class UserNameText extends StatelessWidget {
  const UserNameText({
    Key? key,
    required this.userNameController,
    this.errorUserNameText,
  }) : super(key: key);

  final TextEditingController userNameController;
  final String? errorUserNameText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        errorText: errorUserNameText,
        focusColor: Colors.blue,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            color: Colors.blue,
          ),
        ),
        labelText: 'New email address',
        labelStyle: const TextStyle(
          color: Colors.blue,
        ),
      ),
      controller: userNameController,
      onSubmitted: (_) {},
    );
  }
}

///Text field for email in settings
class EmailText extends StatelessWidget {
  const EmailText({
    Key? key,
    required this.emailController,
    required this.errorEmailText,
  }) : super(key: key);

  final TextEditingController emailController;
  final String? errorEmailText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
        ),
        floatingLabelStyle: const TextStyle(
          color: Colors.blue,
        ),
        errorText: errorEmailText,
        focusColor: Colors.blue,
        labelText: 'New email address',
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSubmitted: (_) {},
    );
  }
}

///Text field for Password in settings
class PasswordText extends StatelessWidget {
  const PasswordText({
    Key? key,
    required this.passwordController,
    required this.labeling,
    this.errorPasswordText,
  }) : super(key: key);

  final String? labeling;
  final TextEditingController passwordController;
  final String? errorPasswordText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
        ),
        focusColor: Colors.blue,
        errorText: errorPasswordText,
        floatingLabelStyle: const TextStyle(
          color: Colors.blue,
        ),
        labelText: labeling,
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      controller: passwordController,
      onSubmitted: (_) {},
    );
  }
}
