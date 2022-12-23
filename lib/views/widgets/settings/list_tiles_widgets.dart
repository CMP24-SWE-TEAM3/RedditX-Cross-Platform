// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../config/constants.dart';
import '../../../models/user_model.dart';

///list tile customized for settings
class ListTileCustom extends StatelessWidget {
  ListTileCustom(
      {Key? key,
      required this.ico,
      required this.text,
      required this.selector,
      this.subtitle,
      required this.enble,
      this.onTap})
      : super(key: key);
  Icon ico;
  String? text;
  String? subtitle = " ";
  Future<bool?> selector;
  Future<bool?> enble;
  Function(bool)? onTap = (_) {};
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.wait([selector, enble]),
        builder: (context, value) {
          return ListTile(
            leading: ico,
            title: Text(text!),
            subtitle: Text(subtitle!),
            trailing: Switch(
              value: value.hasData ? value.data![0]! : false,
              onChanged:
                  (value.hasData ? value.data![1]! : true) ? onTap : (_) {},
              activeColor: white,
              inactiveTrackColor: Colors.grey,
              activeTrackColor: Colors.blue,
              splashRadius: 20,
            ),
            enabled: value.hasData ? value.data![1]! : true,
          );
        });
  }
}

/// List tile with a ready buttom sheet for settings
class SettingsTileButtomSheet extends StatelessWidget {
  Icon leadingIcon;
  Text titleText;
  Text sheetText;
  List<Text> sheetChildrenTextList;
  List<Icon> sheetChildrenIconList;
  List<dynamic> actionMethods;

  SettingsTileButtomSheet(
      {Key? key,
      required this.leadingIcon,
      required this.titleText,
      required this.sheetText,
      //    this.variableVal,
      required this.sheetChildrenTextList,
      required this.sheetChildrenIconList,
      required this.actionMethods})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingIcon,
      title: titleText,
      trailing: Wrap(
        children: [
          Text(currentUser!.username!),
          const Icon(Icons.arrow_downward_outlined)
        ],
      ),
      onTap: () {
        switchAccountButtomSheet(context);
      },
    );
  }

  Future<dynamic> switchAccountButtomSheet(BuildContext context) {
    return showModalBottomSheet(
      constraints:
          BoxConstraints.tightFor(height: sheetChildrenIconList.length * 80),
      context: context,
      builder: (context) => ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: sheetText,
          ),
          const Divider(
            thickness: 2,
            color: Colors.black26,
            indent: 20,
            endIndent: 20,
          ),
          for (int i = 0; i < sheetChildrenTextList.length; i++)
            InkWell(
              onTap: actionMethods[i],
              child: ListTile(
                leading: sheetChildrenIconList[i],
                title: sheetChildrenTextList[i],
              ),
            ),
        ],
      ),
    );
  }
}

///a general settings list tile
class SettingsListTile extends StatelessWidget {
  SettingsListTile({super.key, this.title, this.ico, this.onTab});
  String? title;
  Icon? ico;
  // ignore: prefer_typing_uninitialized_variables
  var onTab;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ico,
      trailing: const Icon(Icons.arrow_forward),
      title: Text(title!),
      onTap: onTab ?? onTab,
    );
  }
}

///a ready list tile for URLs in settings
class ListTileURL extends StatelessWidget {
  ListTileURL(
      {super.key, required this.title, required this.ico, required this.url});
  String? title;
  String url;
  Icon? ico;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ico,
      trailing: const Icon(Icons.arrow_forward),
      title: Text(title!),
      onTap: (() async {
        await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView);
      }),
    );
  }
}
