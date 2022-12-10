import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/mobile_settings_view_controller.dart';
import '../../../views/widgets/settings/list_tiles_widgets.dart';
import '../../../views/widgets/settings/setting_label_widget.dart';

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
        title: const Text("Emails"),
      ),
      body: ListView(
        children: [
          SettingsLabel(title: "MESSAGES"),
          ListTileCustom(
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
                .toggleSwitch("InboxMessages"),
          ),
          ListTileCustom(
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
                  .toggleSwitch("chatRequestsEmails");
            },
          ),
          SettingsLabel(title: "ACTIVITY"),
          ListTileCustom(
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
                .toggleSwitch("newUserWelcomeEmails"),
          ),
          ListTileCustom(
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
                .toggleSwitch("commentsOnYourPostsEmails"),
          ),
          ListTileCustom(
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
                .toggleSwitch("repliesToYourCommentsEmails"),
          ),
          ListTileCustom(
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
                .toggleSwitch("upvotesOnYourPostsEmails"),
          ),
          ListTileCustom(
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
                .toggleSwitch("upvotesOnYourCommentsEmails"),
          ),
          ListTileCustom(
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
                .toggleSwitch("userNameMentionsEmails"),
          ),
          ListTileCustom(
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
                .toggleSwitch("newFollowersEmails"),
          ),
          SettingsLabel(title: "NEWSLETTER"),
          ListTileCustom(
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
                .toggleSwitch("dailyDigestEmails"),
          ),
          ListTileCustom(
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
                .toggleSwitch("weeklyRecapEmails"),
          ),
          ListTileCustom(
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
                .toggleSwitch("communityDiscoveryEmails"),
          ),
          SettingsLabel(title: ""),
          ListTileCustom(
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
                .toggleUnsubscribeFromAllEmails(),
          ),
        ],
      ),
    );
  }
}
