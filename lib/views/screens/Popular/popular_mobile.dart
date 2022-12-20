import 'package:flutter/material.dart';

import '../../widgets/Home/home_bar_mobile.dart';

class PopularMobile extends StatelessWidget {
  const PopularMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHomeBar('Popular'),
      body: const Center(
        child: Text('Popular Mobile'),
      ),
    );
  }
}
