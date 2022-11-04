import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListTileCustom extends StatefulWidget {
  ListTileCustom(
      {Key? key,
      required this.ico,
      required this.text,
      required this.selector,
      this.subtitle})
      : super(key: key);
  Icon ico;
  String? text;
  String? subtitle = " ";
  bool? selector;

  @override
  _ListTileCustomState createState() => _ListTileCustomState(
      ico: ico, text: text, selector: selector, subtitle: subtitle);
}

class _ListTileCustomState extends State<ListTileCustom> {
  Icon? ico;
  String? text;
  bool? selector;
  bool? enble = true;

  String? subtitle = " ";
  _ListTileCustomState({
    this.subtitle = " ",
    required this.ico,
    required this.text,
    required this.selector,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ico,
      title: Text(text!),
      subtitle: Text(subtitle!),
      enabled: enble!,
      trailing: Switch(
          value: selector!,
          onChanged: (value) {
            setState(() {
              selector = value;
            });
          }),
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
                ListTile(
                  leading: sheetChildrenIconList[i],
                  title: sheetChildrenTextList[i],
                ),
            ],
          ),
        );
      },
    );
  }
}

class SettingsListTile extends StatelessWidget {
  SettingsListTile({super.key, this.title, this.ico});
  String? title;
  Icon? ico;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ico,
      trailing: const Icon(Icons.arrow_forward),
      title: Text(title!),
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
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView);
        } else {
          throw 'Could not launch $url';
        }

        //launchUrl(url);
      }),
    );
  }
}
