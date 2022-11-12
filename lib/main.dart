
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:reddit/View/Screens/post/Post_screen.dart';

import 'models/post/post_model.dart';
import 'models/post/comment_model.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit/models/community_service.dart';
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



//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: 'DonWare',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: post_screen(
//        commentsNumber: postsList[0].commentsNumber,
//        title: postsList[0].title,
//        type: postsList[0].type,
//        text: postsList[0].text,
//        attachments: postsList[0].attachments,
//        communityName: postsList[0].communityName,
//        createdAt: postsList[0].createdAt,
//        username: postsList[0].username,
//        votesCount: postsList[0].votesCount),
//    );
//  }
//}


  @override
  Widget build(BuildContext context) {

//    return Scaffold(
//      appBar: AppBar(
//        title: const Text(
//          'Home',
//          style: TextStyle(color: Colors.black),
//        ),
//        backgroundColor: Colors.white,
//        leading: IconButton(
//          color: Colors.black,
//          icon: const Icon(Icons.menu),
//          onPressed: () {},
//        ),
//        actions: [
//          IconButton(
//           onPressed: () {},
//            icon: Icon(Icons.search),
//            color: Colors.black,
//          ),
//          CircleAvatar(
//            radius: 16.0,
//            child: ClipRRect(
//              child: Image.asset('assets/kareem.jpg'),
//              borderRadius: BorderRadius.circular(50.0),
//            ),
//          ),
//        ],
//      ),
//      body: Center(
//        child: Text('kareem'),

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                CommunityProvider(communityService: CommunityService())),
        ChangeNotifierProvider(create: ((context) => SignInController())),
        ChangeNotifierProvider(create: ((context) => InternetController())),
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
