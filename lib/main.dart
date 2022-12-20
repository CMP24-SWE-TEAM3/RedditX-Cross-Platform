import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'controllers/community_controller.dart';
import 'controllers/community_model_controller.dart';
import 'controllers/internet_controller.dart';

import 'controllers/profile_controller.dart';
import 'controllers/profile_model_controller.dart';
import 'models/post_model.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

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
            create: ((context) => ProfileModelProvider()
              ..getProfileAbout("t2_lotfy2")
              ..getProfileComments('t2_lotfy2')
              ..getProfilePosts("t2_hamada")..getProfilePostsCommunityAvatars("t5_imagePro235")..getUserSavedPosts()..getUserDownVotedPosts("t2_lotfy2")..getUserUpVotedPosts("t2_lotfy2")
            )),
        ChangeNotifierProvider(
            create: (context) => CommunityModelProvider()
            ),
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
        home:
        //UserSavedPosts(),
        LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return ProfileMobileScreen(
            context: context,
            constraints: constraints,
            userID: "t2_hamada",
          );
        }),
        routes: const {},
      )
    );
  }
}
