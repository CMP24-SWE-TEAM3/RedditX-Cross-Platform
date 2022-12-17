import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/mobile_settings_view_controller.dart';

import '../../../models/user_model.dart';

/// a dialog shown for bare email accounts who try to access
/// update email screen , change password screen and connect/disconnect from google
/// allows them to recieve email for setting up their reddit password
showMakePasswordFirstDialogue(context1, String s) => showDialog<String>(
      context: context1,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Update email address'),
        content: Text("To $s , you need to create a Reddit password first"),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            style: const ButtonStyle(alignment: Alignment.center),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<SettingsViewModelMobileController>(context1,
                      listen: false)
                  .sendRedditPasswordToEmail();
              Navigator.pop(context, 'OK');
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        insetPadding: const EdgeInsets.all(10),
                        title: const Text('Ckeck your email'),
                        content: Text(
                            "We sent an email to ${currentUser!.username} with a link to create your password"),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context, 'OK');
                            },
                            style:
                                const ButtonStyle(alignment: Alignment.center),
                            child: const Text('OK'),
                          ),
                        ],
                      ));
            },
            style: const ButtonStyle(alignment: Alignment.center),
            child: const Text('OK'),
          ),
        ],
      ),
    );
