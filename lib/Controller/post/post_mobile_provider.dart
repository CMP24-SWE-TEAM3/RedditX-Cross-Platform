import 'package:flutter/material.dart';
import 'package:reddit/View/Widgets/post/Styles/custom_icons.dart';

class MobilePostProvider with ChangeNotifier {
  bool isPostLiked = false;
  bool isPostDisliked = false;
  int reactsCount = 0;


  bool isPostSaved = false;

  List<IconData> bottomSheetPostSortIcons_1 = [
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

  void saveUnsavePost() {
    isPostSaved = !isPostSaved;
    notifyListeners();
  }
}
