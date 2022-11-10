import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/screens/search_screen_one.dart';
import 'controllers/search_controller.dart';
import 'models/search_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => SearchController(
          searchService: SearchService(),
        ),
        child: const SearchScreenOne(),
      ),
    );
  }
}
