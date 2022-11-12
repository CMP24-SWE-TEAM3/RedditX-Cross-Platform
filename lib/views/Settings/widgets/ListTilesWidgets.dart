import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../config/const.dart';

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
  bool? selector;
  Function(bool)? onTap = (_) {};
  bool enble = true;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ico,
      title: Text(text!),
      subtitle: Text(subtitle!),
      enabled: enble,
      trailing: Switch(
        value: selector!,
        onChanged: (enble) ? onTap : (_) {},
        activeColor: white,
        inactiveTrackColor: Colors.grey,
        activeTrackColor: Colors.blue,
        splashRadius: 20,
      ),
    );
  }
}

class SettingsTileButtomSheet extends StatelessWidget {
  Icon leadingIcon;

  Text titleText;
  Text sheetText;

  //var variableVal;

  List<Text> sheetChildrenTextList;
  List<Icon> sheetChildrenIconList;

  SettingsTileButtomSheet(
      {Key? key,
      required this.leadingIcon,
      required this.titleText,
      required this.sheetText,
      //    this.variableVal,
      required this.sheetChildrenTextList,
      required this.sheetChildrenIconList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingIcon,
      title: titleText,
      trailing: Wrap(
        children: const [Text("tmp"), Icon(Icons.arrow_downward_outlined)],
      ),
      onTap: () {
        showModalBottomSheet(
          constraints: BoxConstraints.tightFor(
              height: sheetChildrenIconList.length * 80),
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
                  onTap: () {},
                  child: ListTile(
                    leading: sheetChildrenIconList[i],
                    title: sheetChildrenTextList[i],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class SettingsListTile extends StatelessWidget {
  SettingsListTile({super.key, this.title, this.ico, this.onTab});
  String? title;
  Icon? ico;
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
