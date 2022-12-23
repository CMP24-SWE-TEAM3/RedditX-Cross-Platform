import 'package:flutter/material.dart';
import '../models/home_model.dart';


import '../config/constants.dart';

import '../services/home_service.dart';

bool mockData = iSMOCK;

/// HomeController handles the pagination of the posts
class HomeController extends ChangeNotifier {
  /// Page number
  var page = 0;
  /// number of posts in the page
  var limit = 10;
  /// load the next page
  load() {
    page++;
    notifyListeners();
  }
  /// refresh and return to page 1
  refresh() {
    page = 0;
    notifyListeners();
  }
  /// load the [post] from the back end
  loadPosts() async {
    await getAPIHomePosts(page, limit);
    homePostsList = homePostsListAPI;
    notifyListeners();
  }
}
