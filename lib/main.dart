import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/search_controller.dart';
import 'views/screens/search_screen_one.dart';

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
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: ChangeNotifierProvider(
            create: (_) => SearchController(),
            child: const SearchScreenOne(),
          ),
        ),
      ),
    );
  }
}
