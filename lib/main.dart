import 'package:flutter/material.dart';

import 'Views/Screens/about_you.dart';
import 'Views/Screens/choose_profilepicture.dart';
import 'Views/Screens/choose_username.dart';
import 'Views/Screens/email_login.dart';
import 'Views/Screens/email_signup.dart';
import 'Views/Screens/forget_password.dart';
import 'Views/Screens/forget_username.dart';
import 'Views/Screens/interests.dart';
import 'Views/Screens/sign_up_page.dart';
import 'Views/Screens/temphome.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reddit',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: (kIsWeb)
            ? ColorScheme.fromSwatch(primarySwatch: Colors.blue)
                .copyWith(secondary: Colors.deepOrange)
            : ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange)
                .copyWith(secondary: Colors.lightBlue),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
      ),
      initialRoute: '/',
      home: const SignUpPage(),
      routes: {
        Home.routeName: (ctx) => const Home(),
        SignUpPage.routeName: (ctx) => const SignUpPage(),
        EmailLogin.routeName: (ctx) => const EmailLogin(),
        EmailSignup.routeName: (ctx) => const EmailSignup(),
        ForgetPassword.routeName: (ctx) => const ForgetPassword(),
        ForgetUserName.routeName: (ctx) => const ForgetUserName(),
        ChooseUserName.routeName: (ctx) => const ChooseUserName(),
        Interests.routeName: (ctx) => const Interests(),
        ChooseProfilePicture.routeName: (ctx) => const ChooseProfilePicture(),
        AboutYou.routeName: (ctx) => const AboutYou(),
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
