import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/community_controller.dart';

Future<void> showLeaveCommunityDialog(BuildContext context, String body) async {
  return showDialog<void>(
    context: context,
    //barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
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
                          padding: EdgeInsets.all(5),
                          child: Center(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 102, 102, 102)),
                            ),
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
                            Navigator.pop(context);
                          },
                          child: const Padding(
                              padding: EdgeInsets.all(5),
                              child: Center(
                                child: Text(
                                  "Leave",
                                  style: TextStyle(color: Colors.white),
                                ),
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
