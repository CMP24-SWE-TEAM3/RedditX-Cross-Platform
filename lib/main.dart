import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_project/controllers/profile_controller.dart';
import 'package:search_project/controllers/profile_model_controller.dart';
import 'package:search_project/views/screens/community/community_home.dart';

import 'controllers/community_controller.dart';
import 'controllers/community_model_controller.dart';
import 'controllers/internet_controller.dart';

import 'models/post_model.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

import 'views/screens/community/community_home_mobile_screen.dart';
import 'views/screens/community/community_home_web_screen.dart';
import 'views/screens/profile/profile_mobile_screen.dart';

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
        ChangeNotifierProvider(create: ((context) => InternetController())),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(
            create: ((context) =>
                ProfileModelProvider()..getProfileComments("t2_hamada")..getProfileAbout("t2_hamada"))),
        ChangeNotifierProvider(
            create: (context) => CommunityModelProvider()
              ..getPosts("t5_imagePro235", "hot", [], 2, 40)),
        ChangeNotifierProvider(
            create: (context) =>
                CommunityProvider(communityService: CommunityService())),
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
        home: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return (constraints.minWidth.round() < 500)
              ? ProfileMobileScreen(context: context, constraints: constraints,userID: "t2_hamada",)
              : CommunityWebScreen(context: context, constraints: constraints);
        }),
        routes: {},
      ),
    );
  }
}
