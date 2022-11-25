import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/screens/search/search_screen_one.dart';
import 'views/screens/search/search_screen_two.dart';
import 'controllers/search_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SearchController(),
          child: const SearchScreenOne(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        home: const SearchScreenOne(),
        routes: {
          SearchScreenTwo.routeName: (ctx) => const SearchScreenTwo(),
        },
      ),
    );
  }
}
