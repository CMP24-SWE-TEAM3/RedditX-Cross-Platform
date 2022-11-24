import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit/controllers/community_model_controller.dart';
import 'package:reddit/models/post_model.dart';
import 'package:reddit/views/screens/community/community_home_web_screen.dart';
import 'controllers/community_controller.dart';
import 'views/screens/community/community_home_mobile_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (context) =>
              CommunityModelProvider()..getPosts("At5_imagePro235", "hot", [], 2, 40)),
      ChangeNotifierProvider(
          create: (context) =>
              CommunityProvider(communityService: CommunityService()))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: 
        LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return (constraints.minWidth.round() < 500)
              ? CommunityMobileScreen(context: context, constraints: constraints)
              : CommunityWebScreen(context: context, constraints: constraints);
        }),
        );
  }
}
