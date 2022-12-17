import 'package:flutter/material.dart';

import '../../widgets/Home/home_bar_mobile.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHomeBar(),
      body: Container(),
      );
  }
}