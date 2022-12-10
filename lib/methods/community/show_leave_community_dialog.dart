import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../controllers/community_controller.dart';
import '../../models/community_model.dart';
import 'show_toast.dart';


/// Show dialog when Asking to leave a community

Future<void> showLeaveCommunityDialog(BuildContext context, String body) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        key: const ValueKey("join_dialog"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleChildScrollView(child: Text(body)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 190, 190, 190),
                      borderRadius: BorderRadius.circular(15)),
                  child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        key: ValueKey("cancel_button"),
                          padding: EdgeInsets.all(5),
                          child: Center(
                            child: Center(child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 102, 102, 102)),
                            ),)
                          ))),
                )),
                const SizedBox(
                  width: 10,
                ),
                Consumer<CommunityProvider>(
                  builder: (context, value, child) {
                    return Expanded(
                        child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15)),
                      child: InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: () {
                            value.unJoinCommunity();
                            showToast(
                                "You have left the r/${communityModel1.id} community");
                            Navigator.pop(context);
                          },
                          child: const Padding(
                            key: ValueKey("leave_button"),
                              padding: EdgeInsets.all(5),
                              child: Center(
                                child: Center(child: Text(
                                  "Leave",
                                  style: TextStyle(color: Colors.white),
                                ),)
                              ))),
                    ));
                  },
                )
              ],
            )
          ],
        ),
      );
    },
  );
}
