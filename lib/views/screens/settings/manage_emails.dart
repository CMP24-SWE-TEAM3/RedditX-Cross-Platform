import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit/controllers/mobile_settings_controller.dart';
import 'package:reddit/views/widgets/settings/list_tiles_widgets.dart';
import 'package:reddit/views/widgets/settings/setting_label_widget.dart';

///manage emails settings screen, accesed from account settings
class ManageEmailsScreen extends StatelessWidget {
  ///Manage Emails Screen route name
  static const routeName = '/Settings/Account_Settings/Manage_Emails';
  const ManageEmailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ///enabler for manage email settings, when [true] they are disactivated and vice versa
    bool unsubscribeEnabling =
        Provider.of<SettingsViewModelMobileController>(context, listen: true)
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
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .inboxMessagesEmails,
            onTap: (_) => Provider.of<SettingsViewModelMobileController>(
                    context,
                    listen: false)
                .toggleInboxMessagesEmails(),
          ),
          ListTileCustom(
            ico: const Icon(Icons.chat),
            text: "Allow chat requests",
            subtitle: "",
            enble: unsubscribeEnabling,
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .chatRequestsEmails,
            onTap: (_) {
              Provider.of<SettingsViewModelMobileController>(context,
                      listen: false)
                  .toggleChatRequestsEmails();
            },
          ),
          SettingsLabel(title: "ACTIVITY"),
          ListTileCustom(
            ico: const Icon(Icons.email_outlined),
            text: "New user welcome",
            subtitle: "",
            enble: unsubscribeEnabling,
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .newUserWelcomeEmails,
            onTap: (_) => Provider.of<SettingsViewModelMobileController>(
                    context,
                    listen: false)
                .toggleNewUserWelcomeEmails(),
          ),
          ListTileCustom(
            ico: const Icon(Icons.notifications),
            text: "Comments On Your Posts",
            subtitle: "",
            enble: unsubscribeEnabling,
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .commentsOnYourPostsEmails,
            onTap: (_) => Provider.of<SettingsViewModelMobileController>(
                    context,
                    listen: false)
                .toggleCommentsOnYourPostsEmails(),
          ),
          ListTileCustom(
            ico: const Icon(Icons.reply_outlined),
            text: "Replies To Your Comments",
            subtitle: "",
            enble: unsubscribeEnabling,
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .repliesToYourCommentsEmails,
            onTap: (_) => Provider.of<SettingsViewModelMobileController>(
                    context,
                    listen: false)
                .toggleRepliesToYourCommentsEmails(),
          ),
          ListTileCustom(
            ico: const Icon(Icons.notifications),
            text: "Upvotes On Your Posts",
            subtitle: "",
            enble: unsubscribeEnabling,
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .upvotesOnYourPostsEmails,
            onTap: (_) => Provider.of<SettingsViewModelMobileController>(
                    context,
                    listen: false)
                .toggleUpvotesOnYourPostsEmails(),
          ),
          ListTileCustom(
            ico: const Icon(Icons.notifications),
            text: "Upvotes On Your Comments",
            subtitle: "",
            enble: unsubscribeEnabling,
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .upvotesOnYourCommentsEmails,
            onTap: (_) => Provider.of<SettingsViewModelMobileController>(
                    context,
                    listen: false)
                .toggleUpvotesOnYourCommentsEmails(),
          ),
          ListTileCustom(
            ico: const Icon(Icons.person),
            text: "Username mentions",
            subtitle: "",
            enble: unsubscribeEnabling,
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .userNameMentionsEmails,
            onTap: (_) => Provider.of<SettingsViewModelMobileController>(
                    context,
                    listen: false)
                .toggleUserNameMentionsEmails(),
          ),
          ListTileCustom(
            ico: const Icon(Icons.notifications),
            text: "New followers",
            subtitle: "",
            enble: unsubscribeEnabling,
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .newFollowersEmails,
            onTap: (_) => Provider.of<SettingsViewModelMobileController>(
                    context,
                    listen: false)
                .toggleNewFollowersEmails(),
          ),
          SettingsLabel(title: "NEWSLETTER"),
          ListTileCustom(
            ico: const Icon(Icons.notifications),
            text: "Daily Digest",
            subtitle: "",
            enble: unsubscribeEnabling,
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .dailyDigestEmails,
            onTap: (_) => Provider.of<SettingsViewModelMobileController>(
                    context,
                    listen: false)
                .toggleDailyDigestEmails(),
          ),
          ListTileCustom(
            ico: const Icon(Icons.notifications),
            text: "Weekly Recap",
            subtitle: "",
            enble: unsubscribeEnabling,
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .weeklyRecapEmails,
            onTap: (_) => Provider.of<SettingsViewModelMobileController>(
                    context,
                    listen: false)
                .toggleWeeklyRecapEmails(),
          ),
          ListTileCustom(
            ico: const Icon(Icons.notifications),
            text: "Community Discovery",
            subtitle: "",
            enble: unsubscribeEnabling,
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .communityDiscoveryEmails,
            onTap: (_) => Provider.of<SettingsViewModelMobileController>(
                    context,
                    listen: false)
                .toggleCommunityDiscoveryEmails(),
          ),
          SettingsLabel(title: ""),
          ListTileCustom(
            ico: const Icon(Icons.email_outlined),
            text: "Unsubscribe from all emails",
            subtitle: "",
            enble: true,
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .unsubscribeFromAllEmails,
            onTap: (_) => Provider.of<SettingsViewModelMobileController>(
                    context,
                    listen: false)
                .toggleUnsubscribeFromAllEmails(),
          ),
        ],
      ),
    );
  }
}
