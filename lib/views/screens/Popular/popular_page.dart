import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'popular_mobile.dart';
import 'popular_web.dart';


class Popular extends StatelessWidget {
  const Popular({super.key});
  static const routeName = '/PopularPage';

  @override
  Widget build(BuildContext context) {
    return (kIsWeb) ? const  PopularWeb(): const PopularMobile();
  }
}