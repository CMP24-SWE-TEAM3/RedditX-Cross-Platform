import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/search_controller.dart';
import 'views/screens/search_screen_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => SearchController(),
        child: const SearchScreenTwo(),
      ),
    );
  }
}
