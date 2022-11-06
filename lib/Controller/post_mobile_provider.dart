import 'package:flutter/material.dart';

import '../View/Styles/custom_icons.dart';

class MobilePostProvider with ChangeNotifier {

  bool isPostLiked = false;
  bool isPostDisliked = false;
  int reactsCount = 0;


  List<IconData> bottomSheetPostSortIcons = [
    CustomIcons.hotjar,
    CustomIcons.certificate_outline,
    CustomIcons.award,
    CustomIcons.broadsword,
    CustomIcons.chart_outline
  ];

  void likePost() {
    if (isPostLiked) {
      reactsCount--;
    } else {
      reactsCount++;
    }
    isPostLiked = !isPostLiked;
    if (isPostDisliked) {
      isPostDisliked = !isPostDisliked;
    }

    notifyListeners();
  }

  void disLikePost() {
    if (isPostDisliked) {
      reactsCount++;
    } else {
      reactsCount--;
    }
    isPostDisliked = !isPostDisliked;
    if (isPostLiked) {
      isPostLiked = !isPostLiked;
    }
    notifyListeners();
  }


}
