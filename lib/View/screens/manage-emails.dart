import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit/Controller/Mobile_settings_controller.dart';
import 'package:reddit/View/widgets/ListTilesWidgets.dart';
import 'package:reddit/View/widgets/default_buttom_sheet.dart';
import 'package:reddit/View/widgets/settingLabelWidget.dart';
import '../../model/settings_model.dart';

class manageEmailsScreen extends StatefulWidget {
  const manageEmailsScreen({super.key});

  @override
  State<manageEmailsScreen> createState() => accountStateSettingsScreen();
}

class accountStateSettingsScreen extends State<manageEmailsScreen> {
  bool inboxMessagesEmails = false;
  bool chatRequestsEmails = false;
  bool newUserWelcomeEmails = false;
  bool commentsOnYourPostsEmails = false;
  bool repliesToYourCommentsEmails = false;
  bool upvotesOnYourPostsEmails = false;
  bool upvotesOnYourCommentsEmails = false;
  bool userNameMentionsEmails = false;
  bool newFollowersEmails = false;
  bool dailyDigestEmails = false;
  bool weeklyRecapEmails = false;
  bool communityDiscoveryEmails = false;
  bool unsubscribeFromAllEmails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text("Emails"),
      ),
      body: ListView(
        children: [
          SettingsLabel(title: "MESSAGES"),
          ListTileCustom(
              ico: const Icon(Icons.email_outlined),
              text: "Inbox messages",
              subtitle: "",
              selector: inboxMessagesEmails),
          ListTileCustom(
            ico: const Icon(Icons.chat),
            text: "Allow chat requests",
            subtitle: "",
            selector: chatRequestsEmails,
          ),
          ListTileCustom(
            ico: const Icon(Icons.email_outlined),
            text: "New user welcome",
            subtitle: "",
            selector: newUserWelcomeEmails,
          ),
          SettingsLabel(title: "ACTIVITY"),
          ListTileCustom(
            ico: const Icon(Icons.email_outlined),
            text: "New user welcome",
            subtitle: "",
            selector: newUserWelcomeEmails,
          ),
          ListTileCustom(
            ico: const Icon(Icons.notifications),
            text: "Comments On Your Posts",
            subtitle: "",
            selector: commentsOnYourPostsEmails,
          ),
          ListTileCustom(
            ico: const Icon(Icons.notifications),
            text: "Replies To Your Comments",
            subtitle: "",
            selector: repliesToYourCommentsEmails,
          ),
          ListTileCustom(
            ico: const Icon(Icons.notifications),
            text: "Upvotes On Your Posts",
            subtitle: "",
            selector: upvotesOnYourPostsEmails,
          ),
          ListTileCustom(
            ico: const Icon(Icons.notifications),
            text: "Upvotes On Your Comments",
            subtitle: "",
            selector: upvotesOnYourCommentsEmails,
          ),
          ListTileCustom(
            ico: const Icon(Icons.notifications),
            text: "Username mentions",
            subtitle: "",
            selector: userNameMentionsEmails,
          ),
          ListTileCustom(
            ico: const Icon(Icons.notifications),
            text: "New followers",
            subtitle: "",
            selector: newFollowersEmails,
          ),
          SettingsLabel(title: "NEWSLETTER"),
          ListTileCustom(
            ico: const Icon(Icons.notifications),
            text: "Daily Digest",
            subtitle: "",
            selector: dailyDigestEmails,
          ),
          ListTileCustom(
            ico: const Icon(Icons.notifications),
            text: "Weekly Recap",
            subtitle: "",
            selector: weeklyRecapEmails,
          ),
          ListTileCustom(
            ico: const Icon(Icons.notifications),
            text: "Community Discovery",
            subtitle: "",
            selector: communityDiscoveryEmails,
          ),
          SettingsLabel(title: ""),
          ListTileCustom(
            ico: const Icon(Icons.notifications),
            text: "Unsubscribe from all emails",
            subtitle: "",
            selector: unsubscribeFromAllEmails,
          ),
        ],
      ),
    );
  }
}
