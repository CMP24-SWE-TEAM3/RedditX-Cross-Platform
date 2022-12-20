import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:search_project/views/screens/add_post/add_post_screen_three.dart';
import 'views/screens/add_post/add_post_screen_one.dart';
import 'controllers/add_post_controller.dart';

void main() async {
  // initial the application
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AddPostController>(
            create: ((context) => AddPostController())),
      ],
      child: MaterialApp(
        routes: {
          AddPostScreenThree.routeName: (context) => const AddPostScreenThree(),
        },
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
                bodyLarge: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
        ),
        home: const AddPostScreenOne(),
      ),
    );
  }
}
