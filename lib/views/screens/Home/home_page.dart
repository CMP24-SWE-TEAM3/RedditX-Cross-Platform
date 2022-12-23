import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'home_mobile.dart';
import 'home_web.dart';

class HomePage extends StatelessWidget {
    /// user name
  final String userName;
  const HomePage({required this.userName,super.key});
  static const routeName = '/HomePage';

  @override
  Widget build(BuildContext context) {
    return (kIsWeb) ? const  HomeWeb(): HomeMobile(userName: userName,);
  }
}