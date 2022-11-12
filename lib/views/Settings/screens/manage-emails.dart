import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/controllers/Mobile_settings_controller.dart';
import '/views/Settings/widgets/ListTilesWidgets.dart';
import '/views/Settings/widgets/default_buttom_sheet.dart';
import '/views/Settings/widgets/settingLabelWidget.dart';
import '../../../models/settings_model.dart';

class ManageEmailsScreen extends StatelessWidget {
  static const routeName = '/Settings/Account_Settings/Manage_Emails';
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

  ManageEmailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //bool inboxMessagesEmails =
    bool unsubscribeEnabling =
        Provider.of<SettingsMobileController>(context, listen: true)
            .unsubscribeFromAllEmailsEnabling;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),
        ),
        title: const Text("Emails"),
      ),
      body: ListView(
        children: [
          SettingsLabel(title: "MESSAGES"),
          ListTileCustom(
            ico: const Icon(Icons.email_outlined),
            text: "Inbox messages",
            subtitle: "",
            enble: unsubscribeEnabling,
            selector:
                Provider.of<SettingsMobileController>(context, listen: true)
                    .inboxMessagesEmails,
            onTap: (_) =>
                Provider.of<SettingsMobileController>(context, listen: false)
                    .toggleInboxMessagesEmails(),
          ),
          ListTileCustom(
            ico: const Icon(Icons.chat),
            text: "Allow chat requests",
            subtitle: "",
            enble: unsubscribeEnabling,
            selector:
                Provider.of<SettingsMobileController>(context, listen: true)
                    .chatRequestsEmails,
            onTap: (_) {
              Provider.of<SettingsMobileController>(context, listen: false)
                  .toggleChatRequestsEmails();
            },
          ),
          SettingsLabel(title: "ACTIVITY"),
          ListTileCustom(
            ico: const Icon(Icons.email_outlined),
            text: "New user welcome",
            subtitle: "",
            enble: unsubscribeEnabling,
            selector:
                Provider.of<SettingsMobileController>(context, listen: true)
                    .newUserWelcomeEmails,
            onTap: (_) =>
                Provider.of<SettingsMobileController>(context, listen: false)
                    .toggleNewUserWelcomeEmails(),
          ),
          ListTileCustom(
            ico: const Icon(Icons.notifications),
            text: "Comments On Your Posts",
            subtitle: "",
            enble: unsubscribeEnabling,
            selector:
                Provider.of<SettingsMobileController>(context, listen: true)
                    .commentsOnYourPostsEmails,
            onTap: (_) =>
                Provider.of<SettingsMobileController>(context, listen: false)
                    .toggleCommentsOnYourPostsEmails(),
          ),
          ListTileCustom(
            ico: const Icon(Icons.reply_outlined),
            text: "Replies To Your Comments",
            subtitle: "",
            enble: unsubscribeEnabling,
            selector:
                Provider.of<SettingsMobileController>(context, listen: true)
                    .repliesToYourCommentsEmails,
            onTap: (_) =>
                Provider.of<SettingsMobileController>(context, listen: false)
                    .toggleRepliesToYourCommentsEmails(),
          ),
          ListTileCustom(
            ico: const Icon(Icons.notifications),
            text: "Upvotes On Your Posts",
            subtitle: "",
            enble: unsubscribeEnabling,
            selector:
                Provider.of<SettingsMobileController>(context, listen: true)
                    .upvotesOnYourPostsEmails,
            onTap: (_) =>
                Provider.of<SettingsMobileController>(context, listen: false)
                    .toggleUpvotesOnYourPostsEmails(),
          ),
          ListTileCustom(
            ico: const Icon(Icons.notifications),
            text: "Upvotes On Your Comments",
            subtitle: "",
            enble: unsubscribeEnabling,
            selector:
                Provider.of<SettingsMobileController>(context, listen: true)
                    .upvotesOnYourCommentsEmails,
            onTap: (_) =>
                Provider.of<SettingsMobileController>(context, listen: false)
                    .toggleUpvotesOnYourCommentsEmails(),
          ),
          ListTileCustom(
            ico: const Icon(Icons.person),
            text: "Username mentions",
            subtitle: "",
            enble: unsubscribeEnabling,
            selector:
                Provider.of<SettingsMobileController>(context, listen: true)
                    .userNameMentionsEmails,
            onTap: (_) =>
                Provider.of<SettingsMobileController>(context, listen: false)
                    .toggleUserNameMentionsEmails(),
          ),
          ListTileCustom(
            ico: const Icon(Icons.notifications),
            text: "New followers",
            subtitle: "",
            enble: unsubscribeEnabling,
            selector:
                Provider.of<SettingsMobileController>(context, listen: true)
                    .newFollowersEmails,
            onTap: (_) =>
                Provider.of<SettingsMobileController>(context, listen: false)
                    .toggleNewFollowersEmails(),
          ),
          SettingsLabel(title: "NEWSLETTER"),
          ListTileCustom(
            ico: const Icon(Icons.notifications),
            text: "Daily Digest",
            subtitle: "",
            enble: unsubscribeEnabling,
            selector:
                Provider.of<SettingsMobileController>(context, listen: true)
                    .dailyDigestEmails,
            onTap: (_) =>
                Provider.of<SettingsMobileController>(context, listen: false)
                    .toggleDailyDigestEmails(),
          ),
          ListTileCustom(
            ico: const Icon(Icons.notifications),
            text: "Weekly Recap",
            subtitle: "",
            enble: unsubscribeEnabling,
            selector:
                Provider.of<SettingsMobileController>(context, listen: true)
                    .weeklyRecapEmails,
            onTap: (_) =>
                Provider.of<SettingsMobileController>(context, listen: false)
                    .toggleWeeklyRecapEmails(),
          ),
          ListTileCustom(
            ico: const Icon(Icons.notifications),
            text: "Community Discovery",
            subtitle: "",
            enble: unsubscribeEnabling,
            selector:
                Provider.of<SettingsMobileController>(context, listen: true)
                    .communityDiscoveryEmails,
            onTap: (_) =>
                Provider.of<SettingsMobileController>(context, listen: false)
                    .toggleCommunityDiscoveryEmails(),
          ),
          SettingsLabel(title: ""),
          ListTileCustom(
            ico: const Icon(Icons.email_outlined),
            text: "Unsubscribe from all emails",
            subtitle: "",
            enble: true,
            selector:
                Provider.of<SettingsMobileController>(context, listen: true)
                    .unsubscribeFromAllEmails,
            onTap: (_) =>
                Provider.of<SettingsMobileController>(context, listen: false)
                    .toggleUnsubscribeFromAllEmails(),
          ),
        ],
      ),
    );
  }
}
