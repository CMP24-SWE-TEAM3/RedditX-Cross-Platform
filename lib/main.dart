import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_project/views/screens/community/community_home.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'views/screens/notification_one.dart';
import 'views/screens/notification_two.dart';
import 'views/screens/notification_three.dart';
import 'views/screens/notification_four.dart';
import 'views/screens/notification_five.dart';
import 'views/screens/notification_six.dart';
void main() async {
  // initial the application
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.instance.getToken().then((value){
    
  });

  FirebaseMessaging.onMessaging.listen((RemoteMessage message) async{
    Navigator.pushNamed(context, '/notification_one');
  });
  FirebaseMessaging.instance.getInitialized().then(
    (RemoteMessage? message)
    {
      if(messsage!=null)
      {
        Navigator.pushNamed(context, '/notification_one');
      }
    }
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //ChangeNotifierProvider(create: ((context) => SignInController())),
        
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
        home: Scaffold(),
        routes: {
          '/notification_one': ((context)=> const NotificationOne()),
          '/notification_two': ((context)=> const NotificationTwo()),
          '/notification_three': ((context)=> const NotificationThree()),
          '/notification_four': ((context)=> const NotificationFour()),
          '/notification_five': ((context)=> const NotificationFive()),
          '/notification_six': ((context)=> const NotificationSix()),
          },
      ),
    );
  }
}

// class _HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//       ),
//       body: const Center(child: Text('Welcome to Reddit')),
//     );
//   }
// }
