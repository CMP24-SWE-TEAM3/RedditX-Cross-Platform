
import 'dart:io';
import 'package:flutter/material.dart';
import 'Controllers/Mobile_settings_controller.dart';
import 'views/Settings/screens/account_setting_screen.dart';
import 'views/Settings/screens/change_password_screen.dart';
import 'views/Settings/screens/manage-emails.dart';
import 'views/Settings/screens/setting_Menu.dart';

import 'package:reddit/View/Screens/post/Post_screen.dart';

import 'models/post/post_model.dart';
import 'models/post/comment_model.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit/models/community_service.dart';
import 'views/Settings/screens/update_email_screen.dart';
import 'views/screens/community/community_screen.dart';
import 'controllers/community_controller.dart';
import 'controllers/internet_controller.dart';
import 'controllers/sign_in_controller.dart';
import 'views/screens/authentication/about_you.dart';
import 'views/screens/authentication/choose_profilepicture.dart';
import 'views/screens/authentication/choose_username.dart';
import 'views/screens/authentication/email_login.dart';
import 'views/screens/authentication/email_signup.dart';
import 'views/screens/authentication/email_signup_w.dart';
import 'views/screens/authentication/email_signup_w_2.dart';
import 'views/screens/authentication/forget_password.dart';
import 'views/screens/authentication/forget_username.dart';
import 'views/screens/authentication/interests.dart';
import 'views/screens/authentication/sign_up_page.dart';
import 'views/screens/authentication/splash_screen.dart';
import 'views/screens/temphome.dart';


void main() async {
  // initial the application
  WidgetsFlutterBinding.ensureInitialized();
  (kIsWeb) ? null : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {



    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                CommunityProvider(communityService: CommunityService())),
        ChangeNotifierProvider(create: ((context) => SignInController())),
        ChangeNotifierProvider(create: ((context) => InternetController())),
        ChangeNotifierProvider(
          create: (context) => SettingsMobileController(),),
      ],
      child: MaterialApp(
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
                // ignore: deprecated_member_use
                bodyText1: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
        ),
        initialRoute: '/',
        home: (kIsWeb) ? const EmailSignupW() : const SplashScreen(),
        routes: {
          Home.routeName: (ctx) => const Home(),
          SignUpPage.routeName: (ctx) => const SignUpPage(),
          EmailLogin.routeName: (ctx) => const EmailLogin(),
          EmailSignup.routeName: (ctx) => const EmailSignup(),
          EmailSignupW2.routeName: (ctx) => const EmailSignupW2(),
          ForgetPassword.routeName: (ctx) => const ForgetPassword(),
          ForgetUserName.routeName: (ctx) => const ForgetUserName(),
          ChooseUserName.routeName: (ctx) => const ChooseUserName(),
          Interests.routeName: (ctx) => const Interests(),
          ChooseProfilePicture.routeName: (ctx) => const ChooseProfilePicture(),
          AboutYou.routeName: (ctx) => const AboutYou(),
          SplashScreen.routeName: (ctx) => const SplashScreen(),
          CommunityScreen.routeName: (ctx) => const CommunityScreen(),
          SettingsHomePage.routeName: (context) => SettingsHomePage(),
          AccountSettingsScreen.routeName: (context) => AccountSettingsScreen(),
          ManageEmailsScreen.routeName: (context) => ManageEmailsScreen(),
          UpdateEmailAddress.routeName: (context) => UpdateEmailAddress(),
          ChangePasswordScreen.routeName: (context) => ChangePasswordScreen(),
        },

      ),
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
//       debugShowCheckedModeBanner: false,
//       home: LayoutBuilder(
//           builder: (BuildContext context, BoxConstraints constraints) {
//         return (constraints.minWidth.round() < 500)
//             ? CommunityMobileScreen(context: context, constraints: constraints)
//             : CommunityWebScreen(context: context, constraints: constraints);
//       }),
//     );
//   }
// }
