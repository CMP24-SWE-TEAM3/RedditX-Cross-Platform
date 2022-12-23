import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../controllers/mobile_settings_view_controller.dart';
import '../../../../views/widgets/settings/list_tiles_widgets.dart';
import '../../../../views/widgets/settings/setting_label_widget.dart';

///manage emails settings screen, accesed from account settings
class ManageEmailsScreen extends StatelessWidget {
  ///Manage Emails Screen route name
  static const routeName = '/Settings/Account_Settings/Manage_Emails';
  const ManageEmailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ///enabler for manage email settings, when [true] they are disactivated and vice versa
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),
        ),
        title: const Text("Emails", style: TextStyle(color: Colors.black)),
      ),
      body: ListView(
        children: [
          SettingsLabel(title: "MESSAGES"),
          ListTileCustom(
            key: const ValueKey('Inbox_Button'),
            ico: const Icon(Icons.email_outlined),
            text: "Inbox messages",
            subtitle: "",
            enble: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("unsubscribeFromAllEmailsEnabling"),
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("InboxMessages"),
            onTap: (_) => Provider.of<SettingsViewModelMobileController>(
                    context,
                    listen: false)
                .toggleSwitch("InboxMessages", context),
          ),
          ListTileCustom(
            key: const ValueKey('Allow_chat_Button'),
            ico: const Icon(Icons.chat),
            text: "Allow chat requests",
            subtitle: "",
            enble: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("unsubscribeFromAllEmailsEnabling"),
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("chatRequestsEmails"),
            onTap: (_) {
              Provider.of<SettingsViewModelMobileController>(context,
                      listen: false)
                  .toggleSwitch("chatRequestsEmails", context);
            },
          ),
          SettingsLabel(title: "ACTIVITY"),
          ListTileCustom(
            key: const ValueKey('New_user_Button'),
            ico: const Icon(Icons.email_outlined),
            text: "New user welcome",
            subtitle: "",
            enble: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("unsubscribeFromAllEmailsEnabling"),
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("newUserWelcomeEmails"),
            onTap: (_) => Provider.of<SettingsViewModelMobileController>(
                    context,
                    listen: false)
                .toggleSwitch("newUserWelcomeEmails", context),
          ),
          ListTileCustom(
            key: const ValueKey('Comments_Button'),
            ico: const Icon(Icons.notifications),
            text: "Comments On Your Posts",
            subtitle: "",
            enble: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("unsubscribeFromAllEmailsEnabling"),
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("commentsOnYourPostsEmails"),
            onTap: (_) => Provider.of<SettingsViewModelMobileController>(
                    context,
                    listen: false)
                .toggleSwitch("commentsOnYourPostsEmails", context),
          ),
          ListTileCustom(
            key: const ValueKey('Replies_To_Comments_Button'),
            ico: const Icon(Icons.reply_outlined),
            text: "Replies To Your Comments",
            subtitle: "",
            enble: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("unsubscribeFromAllEmailsEnabling"),
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("repliesToYourCommentsEmails"),
            onTap: (_) => Provider.of<SettingsViewModelMobileController>(
                    context,
                    listen: false)
                .toggleSwitch("repliesToYourCommentsEmails", context),
          ),
          ListTileCustom(
            key: const ValueKey('Upvotes_Posts_Button'),
            ico: const Icon(Icons.notifications),
            text: "Upvotes On Your Posts",
            subtitle: "",
            enble: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("unsubscribeFromAllEmailsEnabling"),
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("upvotesOnYourPostsEmails"),
            onTap: (_) => Provider.of<SettingsViewModelMobileController>(
                    context,
                    listen: false)
                .toggleSwitch("upvotesOnYourPostsEmails", context),
          ),
          ListTileCustom(
            key: const ValueKey('Upvotes_Comments_Button'),
            ico: const Icon(Icons.notifications),
            text: "Upvotes On Your Comments",
            subtitle: "",
            enble: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("unsubscribeFromAllEmailsEnabling"),
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("upvotesOnYourCommentsEmails"),
            onTap: (_) => Provider.of<SettingsViewModelMobileController>(
                    context,
                    listen: false)
                .toggleSwitch("upvotesOnYourCommentsEmails", context),
          ),
          ListTileCustom(
            key: const ValueKey('Username_mentions_Button'),
            ico: const Icon(Icons.person),
            text: "Username mentions",
            subtitle: "",
            enble: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("unsubscribeFromAllEmailsEnabling"),
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("userNameMentionsEmails"),
            onTap: (_) => Provider.of<SettingsViewModelMobileController>(
                    context,
                    listen: false)
                .toggleSwitch("userNameMentionsEmails", context),
          ),
          ListTileCustom(
            key: const ValueKey('New_followers_Button'),
            ico: const Icon(Icons.notifications),
            text: "New followers",
            subtitle: "",
            enble: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("unsubscribeFromAllEmailsEnabling"),
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("newFollowersEmails"),
            onTap: (_) => Provider.of<SettingsViewModelMobileController>(
                    context,
                    listen: false)
                .toggleSwitch("newFollowersEmails", context),
          ),
          SettingsLabel(title: "NEWSLETTER"),
          ListTileCustom(
            key: const ValueKey('Daily_Digest_Button'),
            ico: const Icon(Icons.notifications),
            text: "Daily Digest",
            subtitle: "",
            enble: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("unsubscribeFromAllEmailsEnabling"),
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("dailyDigestEmails"),
            onTap: (_) => Provider.of<SettingsViewModelMobileController>(
                    context,
                    listen: false)
                .toggleSwitch("dailyDigestEmails", context),
          ),
          ListTileCustom(
            key: const ValueKey('Weekly_Recap_Button'),
            ico: const Icon(Icons.notifications),
            text: "Weekly Recap",
            subtitle: "",
            enble: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("unsubscribeFromAllEmailsEnabling"),
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("weeklyRecapEmails"),
            onTap: (_) => Provider.of<SettingsViewModelMobileController>(
                    context,
                    listen: false)
                .toggleSwitch("weeklyRecapEmails", context),
          ),
          ListTileCustom(
            key: const ValueKey('Community_Discovery_Button'),
            ico: const Icon(Icons.notifications),
            text: "Community Discovery",
            subtitle: "",
            enble: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("unsubscribeFromAllEmailsEnabling"),
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("communityDiscoveryEmails"),
            onTap: (_) => Provider.of<SettingsViewModelMobileController>(
                    context,
                    listen: false)
                .toggleSwitch("communityDiscoveryEmails", context),
          ),
          SettingsLabel(title: ""),
          ListTileCustom(
            key: const ValueKey('Unsubscribe_fromallemails_Button'),
            ico: const Icon(Icons.email_outlined),
            text: "Unsubscribe from all emails",
            subtitle: "",
            enble: Future<bool>.value(true),
            selector: Provider.of<SettingsViewModelMobileController>(context,
                    listen: true)
                .getSwitchValue("unsubscribeFromAllEmails"),
            onTap: (_) => Provider.of<SettingsViewModelMobileController>(
                    context,
                    listen: false)
                .toggleUnsubscribeFromAllEmails(context),
          ),
        ],
      ),
    );
  }
}
