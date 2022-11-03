import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit/views/screens/community_home_web_screen.dart';

import 'controllers/community_controller_mobile.dart';
import 'controllers/community_controller_web.dart';
import 'views/screens/community_home_mobile_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => WebCommunityProvider()),
      ChangeNotifierProvider(create: (context) => MobileCommunityProvider())
    ],
    child: const MyApp(),
  )
      //   ChangeNotifierProvider(
      //   create: (context) => WebCommunityProvider(),
      //   child: const MyApp(),
      // )
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //return  ChangeNotifierProvider<WebCommunityProvider>(
    //   create: (context) => WebCommunityProvider(),
    //   child:
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        //print(constraints.minWidth.round());
        return CommunityWebScreen(
          constraints: constraints,
          context: context,
        );
      }),
    );
  }
}
