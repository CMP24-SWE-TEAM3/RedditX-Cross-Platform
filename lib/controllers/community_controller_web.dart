import 'package:flutter/material.dart';

class WebCommunityProvider with ChangeNotifier {
  String joinLeaveButtonText="Joined";

  void joinLeaveButtonOnHover()
  {
    joinLeaveButtonText="Leave";
    notifyListeners();
  }
    void joinLeaveButtonOnExit() {
    joinLeaveButtonText = "Joined";
    notifyListeners();
  }
}
