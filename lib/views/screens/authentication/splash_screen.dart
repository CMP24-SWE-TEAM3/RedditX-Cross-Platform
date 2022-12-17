import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/sign_in_controller.dart';
import '../temphome.dart';
import 'email_signup.dart';
import 'sign_up_page.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const routeName = '/SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // init State
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _controller.repeat();
    final signInController =
        Provider.of<SignInController>(context, listen: false);
    super.initState();
    //timer for 2 seconds
    Timer(
      const Duration(seconds: 3),
      () async {
        if (signInController.isSignedIn == false) {
          (kIsWeb)
              ? Navigator.of(context)
                  .pushReplacementNamed(EmailSignup.routeName, arguments: {})
              : Navigator.of(context)
                  .pushReplacementNamed(SignUpPage.routeName, arguments: {});
        } else {
          await signInController.getDataFromSharedPreferences();
          // ignore: use_build_context_synchronously
          Navigator.of(context)
              .pushReplacementNamed(Home.routeName, arguments: {});
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
            child: Image.asset(
              'assets/images/logo.png',
              height: 80,
              width: 80,
            ),
          ),
        ),
      ),
    );
  }
}
