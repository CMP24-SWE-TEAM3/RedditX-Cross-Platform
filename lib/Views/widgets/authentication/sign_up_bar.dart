import 'package:flutter/material.dart';

AppBar buildAppBar({text, function}) {
  return (text != null)
      ? AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Image.asset(
            'assets/images/logo.png',
            height: 40,
          ),
          actions: [
            TextButton(
              key: const ValueKey('button_appbar'),
              onPressed: function,
              child: Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        )
      : AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Image.asset(
            'assets/images/logo.png',
            height: 40,
          ),
        );
}
