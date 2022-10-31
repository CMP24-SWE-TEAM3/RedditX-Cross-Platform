import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/community_controller.dart';
import 'views/screens/community_home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CommunityProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CommunityProvider>(
      create: (context) => CommunityProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const CommunityScreen(),
      ),
    );
  }
}
