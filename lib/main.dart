import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_project/views/screens/community/community_home.dart';

import 'controllers/community_controller.dart';
import 'controllers/community_model_controller.dart';
import 'controllers/internet_controller.dart';
import 'controllers/sign_in_controller.dart';

import 'views/screens/community/community_home_mobile_screen.dart';
import 'views/screens/community/community_home_web_screen.dart';
import 'views/screens/search/search_screen_one.dart';
import 'views/screens/search/search_screen_two.dart';
import 'controllers/search_controller.dart';

import 'models/post_model.dart';
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
import 'controllers/mobile_settings_controller.dart';
import 'views/screens/settings/account_setting_screen.dart';
import 'views/screens/settings/setting_menu.dart';
import './views/screens/settings/change_password_screen.dart';
import './views/screens/settings/manage_emails.dart';
import './views/screens/settings/update_email_screen.dart';
import 'views/screens/temphome.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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
        ChangeNotifierProvider(create: ((context) => SignInController())),
        ChangeNotifierProvider(create: ((context) => InternetController())),
        ChangeNotifierProvider(
            create: (context) => CommunityModelProvider()
              ..getCommunityPosts("t5_imagePro235", "hot", [], 1, 40)..getCommunityAbout("t5_imagePro235")..getCommunityInfo("t5_imagePro235")..getCommunityFlairs("t5_imagePro235")),
        ChangeNotifierProvider(
            create: (context) =>
                CommunityProvider(communityService: CommunityService())),
        ChangeNotifierProvider(
          create: (context) => SearchController(),
        ),
        ChangeNotifierProvider(
          create: (_) => SettingsViewModelMobileController(),
        ),
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
                bodyText1: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
        ),
        initialRoute: '/',
        home:
         LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return (constraints.minWidth.round() < 500)
              ? CommunityMobileScreen(
                  context: context, constraints: constraints,communityName: "t5_imagePro235",)
              : CommunityWebScreen(context: context, constraints: constraints,communityName: "t5_imagePro235",);
        }),
         //(kIsWeb) ? const EmailSignupW() : const SplashScreen(),
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
          CommunityHome.routeName: (ctx) => const CommunityHome(),
          SearchScreenTwo.routeName: (ctx) => const SearchScreenTwo(),
          SearchScreenOne.routeName: (ctx) => const SearchScreenOne(),
          SettingsHomePage.routeName: (context) => const SettingsHomePage(),
          AccountSettingsScreen.routeName: (context) =>
              const AccountSettingsScreen(),
          ManageEmailsScreen.routeName: (context) => const ManageEmailsScreen(),
          UpdateEmailAddress.routeName: (context) => UpdateEmailAddress(),
          ChangePasswordScreen.routeName: (context) => ChangePasswordScreen(),
        },
      ),
    );
  }
}
