import 'package:flutter/material.dart';
import 'const/const.dart';
import 'icons/my_flutter_app_icons.dart';

void main() {
  runApp(const SettingsMenu());
}

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: white,
      ),
      home: const MyHomePage(title: 'Settings Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool sw1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text("Settings"),
      ),
      body: ListView(
        //   child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SettingsLabel(title: "GENERAL"),
          SettingsListTile(
            title: "Account settings for u/USER_NAME",
            ico: const Icon(Icons.person),
          ),
          SettingsLabel(title: "PREMIUM"),
          SettingsListTile(
            title: "Change app icon",
            ico: const Icon(Icons.reddit),
          ),
          SettingsListTile(
            title: "Style Avatar",
            ico: const Icon(Icons.checkroom_rounded),
          ),
          SettingsLabel(title: "FEED OPTIONS"),
          SettingsTileButtomSheet(
            leadingIcon: const Icon(Icons.house_rounded),
            titleText: const Text("Sort Home posts by"),
            //variableVal: ,   to be implemented in logic
            sheetText: const Text('SORT POSTS BY'),
            sheetChildrenIconList: const [
              Icon(Icons.rocket),
              Icon(Icons.hot_tub),
              Icon(Icons.psychology_outlined),
              Icon(Icons.arrow_upward_rounded),
              Icon(MyFlutterApp.broadsword),
              Icon(Icons.keyboard_arrow_up),
            ],
            sheetChildrenTextList: const [
              Text('Best'),
              Text('Hot'),
              Text('New'),
              Text('Top'),
              Text('Controversial'),
              Text('Rising')
            ],
          ),
          SettingsLabel(title: "VIEW OPTIONS"),
          SettingsTileButtomSheet(
            leadingIcon: const Icon(Icons.rectangle),
            titleText: const Text("Default view"),
            //variableVal: ,   to be implemented in logic
            sheetText: const Text('DEFAULT VIEW'),
            sheetChildrenIconList: const [
              Icon(Icons.rectangle),
              Icon(Icons.rectangle),
            ],
            sheetChildrenTextList: const [
              Text('Card'),
              Text('Classic'),
            ],
          ),
          SettingsTileButtomSheet(
            leadingIcon: const Icon(Icons.rectangle),
            titleText: const Text("Autoplay"),
            //variableVal: ,   to be implemented in logic
            sheetText: const Text('AUTOPLAY'),
            sheetChildrenIconList: const [
              Icon(Icons.rectangle),
              Icon(Icons.rectangle),
            ],
            sheetChildrenTextList: const [
              Text('Card'),
              Text('Classic'),
            ],
          ),
          SettingsLabel(title: "ADVANCED"),
          listTileSwitchSettings(
              ico: Icon(Icons.remove_red_eye),
              text: "Reduce animations",
              selector: sw1),
          SettingsLabel(title: "ABOUT"),
          SettingsLabel(title: "SUPPORT"),
          SettingsLabel(title: "BUILD INFORMATION"),
        ],
        //),
      ),
    );
  }

  ListTile listTileSwitchSettings(
      {required Icon ico, required String text, required bool selector}) {
    return ListTile(
      leading: ico,
      title: Text(text),
      trailing: Switch(
          value: selector,
          onChanged: (value) {
            setState(() {
              sw1 = value;
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

class SettingsLabel extends StatelessWidget {
  SettingsLabel({
    super.key,
    this.title,
  });
  String? title = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
      color: const Color.fromARGB(249, 216, 216, 216),
      child: Row(
        children: [
          Text(
            title!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
