import 'package:flutter/material.dart';
import '../../const/const.dart';

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

class EmailText extends StatelessWidget {
  const EmailText({
    Key? key,
    required this.emailController,
    this.errorEmailText,
  }) : super(key: key);

  final TextEditingController emailController;
  final String? errorEmailText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        floatingLabelStyle: const TextStyle(
          color: Colors.blue,
        ),
        errorText: errorEmailText,
        // focusedBorder: const OutlineInputBorder(
        //   borderSide: BorderSide(
        //     width: 0,
        //     color: Colors.blue,
        //   ),
        // ),
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

class PasswordText extends StatelessWidget {
  const PasswordText({
    Key? key,
    required this.passwordController,
    this.errorPasswordText,
  }) : super(key: key);

  final TextEditingController passwordController;
  final String? errorPasswordText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
        errorText: errorPasswordText,
        floatingLabelStyle: const TextStyle(
          color: Colors.blue,
        ),
        // focusedBorder: const OutlineInputBorder(
        //   borderSide: BorderSide(
        //     width: 0,
        //     color: Colors.blue,
        //   ),
        // ),
        labelText: 'Reddit Password',
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
