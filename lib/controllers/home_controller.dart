import 'package:flutter/material.dart';
import 'package:search_project/models/home_model.dart';

import '../config/constants.dart';
import '../services/home_service.dart';

bool mockData = iSMOCK;

class HomeController extends ChangeNotifier {
  var page = 0;
  var limit = 10;
  load() {
    page++;
    notifyListeners();
  }

  refresh() {
    page = 0;
    notifyListeners();
  }

  loadPosts() async {
    await getAPIHomePosts(page, limit);
    homePostsList = homePostsListAPI;
    notifyListeners();
  }
}
