import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/search_controller.dart';

class TrendingTodayInSearch extends StatelessWidget {
  const TrendingTodayInSearch({super.key});
  @override
  Widget build(BuildContext context) {
    return Provider.of<SearchController>(context).isWeb
        ? const Text('TRENDING TODAY')
        : const Text('Trending today');
  }
}
