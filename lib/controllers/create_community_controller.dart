import 'package:flutter/material.dart';


import '../methods/community/show_snack_bar.dart';
import '../models/create_community_model.dart';
import 'create_community_service_model_controller.dart';

///the change notifier provider for Create Community
///also know as view model controller
class CreateCommunityViewModelController with ChangeNotifier {
  ///buttomsheet index of create community type
  int? createCommunityIndex = 0;

  ///switch value
  bool? plus18 = false;

  ///changes type of community index upon changing community type from buttomsheet buttom sheet
  changeCommunityTypeIndex(int? index, ctx) {
    Navigator.of(ctx).pop();
    createCommunityIndex = index;
    notifyListeners();
  }

  ///toggles plus18 switch
  togglePlus18() {
    plus18 = !plus18!;
    notifyListeners();
  }

  ///function that invokes service of create community
  createCommunity(String? communityName, ctx) async {
    int res = await createCommunityServiceModelController
        .createCommunityServiceController(communityName,
            createCommunitySheetTitle[createCommunityIndex!], plus18);
    if (res == 0) {
      showSnackBar("Created successfully" as BuildContext, ctx);
      Navigator.of(ctx).pushReplacementNamed('/');
      return;
    }
    if (res == 1) {
      showSnackBar("name already taken" as BuildContext, ctx);
      return;
    }
    if (res == -1) {
      showSnackBar("server fail! try again" as BuildContext, ctx);
      return;
    }
  }
}
