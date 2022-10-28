import 'package:flutter/material.dart';

import 'Views/Screens/email_login.dart';
import 'Views/Screens/email_signup.dart';
import 'Views/Screens/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reddit',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange)
            .copyWith(secondary: Colors.lightBlue),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
      ),
      initialRoute: '/',
      home: const SignUpPage(),
      routes: {
        SignUpPage.routeName: (ctx) => const SignUpPage(),
        EmailLogin.routeName: (ctx) => const EmailLogin(),
        EmailSignup.routeName: (ctx) => const EmailSignup(),
      },
    );
  }
}

// class _HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//       ),
//       body: const Center(child: Text('Welcome to Reddit')),
//     );
//   }
// }
