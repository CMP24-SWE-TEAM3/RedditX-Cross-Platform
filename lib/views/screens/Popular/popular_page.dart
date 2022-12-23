import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../../views/screens/Popular/popular_mobile.dart';
import '../../../views/screens/Popular/popular_web.dart';

class Popular extends StatelessWidget {
  const Popular({super.key});
  static const routeName = '/PopularPage';

  @override
  Widget build(BuildContext context) {
    return (kIsWeb) ? const  PopularWeb(): const PopularMobile();
  }
}