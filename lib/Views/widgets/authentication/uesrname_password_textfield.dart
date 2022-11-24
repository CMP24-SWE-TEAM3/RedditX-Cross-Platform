import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'x_button.dart';

class UserNameText extends StatefulWidget {
  const UserNameText({
    Key? key,
    required this.userNameController,
    this.errorUserNameText,
  }) : super(key: key);

  final TextEditingController userNameController;
  final String? errorUserNameText;

  @override
  State<UserNameText> createState() => _UserNameTextState();
}

class _UserNameTextState extends State<UserNameText> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (_) => setState(() {}),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        suffixIcon: (kIsWeb)
            ? null
            : Visibility(
                visible: widget.userNameController.text.isNotEmpty,
                child: IconButton(
                  onPressed: () => setState(() {
                    widget.userNameController.clear();
                  }),
                  icon: const Icon(
                    XButtonIcon.cancelcircled2,
                    color: Colors.black54,
                  ),
                ),
              ),
        errorText: widget.errorUserNameText,
        enabledBorder: (kIsWeb)
            ? const OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
              )
            : null,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: Colors.blue,
          ),
        ),
        labelText: 'Username',
        labelStyle: const TextStyle(
          color: (kIsWeb) ? Colors.grey : Colors.black,
        ),
        filled: true,
        fillColor: (kIsWeb)
            ? const Color.fromARGB(255, 252, 252, 255)
            : const Color.fromARGB(31, 126, 114, 114),
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
    this.errorEmailText,
  }) : super(key: key);

  final TextEditingController emailController;
  final String? errorEmailText;

  @override
  State<EmailText> createState() => _EmailTextState();
}

class _EmailTextState extends State<EmailText> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (_) => setState(() {}),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        suffixIcon: (kIsWeb)
            ? null
            : Visibility(
                visible: widget.emailController.text.isNotEmpty,
                child: IconButton(
                  onPressed: () => setState(() {
                    widget.emailController.clear();
                  }),
                  icon: const Icon(
                    XButtonIcon.cancelcircled2,
                    color: Colors.black54,
                  ),
                ),
              ),
        errorText: widget.errorEmailText,
        enabledBorder: (kIsWeb)
            ? const OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
              )
            : null,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: Colors.blue,
          ),
        ),
        labelText: 'Email',
        labelStyle: const TextStyle(
          color: (kIsWeb) ? Colors.grey : Colors.black,
        ),
        filled: true,
        fillColor: (kIsWeb)
            ? const Color.fromARGB(255, 252, 252, 255)
            : const Color.fromARGB(31, 126, 114, 114),
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
    this.errorPasswordText,
  }) : super(key: key);

  final TextEditingController passwordController;
  final String? errorPasswordText;

  @override
  State<PasswordText> createState() => _PasswordTextState();
}

class _PasswordTextState extends State<PasswordText> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
        suffixIcon: (kIsWeb)
            ? null
            : IconButton(
                onPressed: _toggle,
                icon: (_obscureText)
                    ? const Icon(
                        Icons.visibility,
                        color: Colors.black54,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: Colors.black54,
                      ),
              ),
        errorText: widget.errorPasswordText,
        enabledBorder: (kIsWeb)
            ? const OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
              )
            : null,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: Colors.blue,
          ),
        ),
        labelText: 'Password',
        labelStyle: const TextStyle(
          color: (kIsWeb) ? Colors.grey : Colors.black,
        ),
        filled: true,
        fillColor: (kIsWeb)
            ? const Color.fromARGB(255, 252, 252, 255)
            : const Color.fromARGB(31, 126, 114, 114),
      ),
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscureText,
      enableSuggestions: false,
      autocorrect: false,
      controller: widget.passwordController,
      onSubmitted: (_) {},
    );
  }
}
