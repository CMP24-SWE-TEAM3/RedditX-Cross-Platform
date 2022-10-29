import 'package:flutter/material.dart';
import 'package:reddit/Views/Screens/temphome.dart';

import '../Widgets/continue_username.dart';
import '../Widgets/sign_up_bar.dart';

class ChooseUserName extends StatefulWidget {
  const ChooseUserName({super.key});
  static const routeName = '/ChooseUserName';

  @override
  State<ChooseUserName> createState() => _ChooseUserNameState();
}

bool _submit = false;
TextEditingController userNameController = TextEditingController();
String? errorUserNameText;

void submit(userNameController, ctx) {
  print('sending data to back end');
  Navigator.of(ctx).pop();
  Navigator.of(ctx).pushReplacementNamed(Home.routeName, arguments: {});
}

class _ChooseUserNameState extends State<ChooseUserName> {
  void validate(userNameController, ctx) {
    setState(() => _submit = true);

    bool isValidUserName3 = true;

    errorUserNameText =
        !(isValidUserName3) ? 'That username is already taken' : null;

    if (isValidUserName3) {
      submit(userNameController, ctx);
    } else {
      print("---" + userNameController.text + "---");
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final dynamic appBar = buildAppBar();
    final heightScreen = (mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top);
    final padding = EdgeInsets.symmetric(
      vertical: heightScreen * 0.01,
      horizontal: mediaQuery.size.width * 0.05,
    );
    return Scaffold(
      appBar: appBar,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                      heightScreen * 0.03,
                    ),
                    child: const Text(
                      'Create your profile',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: padding,
                      child: const Text(
                        'Choose a username',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                      heightScreen * 0.03,
                    ),
                    child: const Text(
                      'Reddit is anonymous, so your username is what you\'ll go by here. Choose wisely-because once you get a name, you can\'t changeit.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                      heightScreen * 0.02,
                    ),
                    child: TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        errorText: errorUserNameText,
                        labelText: 'username',
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      controller: userNameController,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                      heightScreen * 0.03,
                    ),
                    child: const Text(
                      'This will be your name forever, so make sure it feels like you.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: heightScreen * 0.02),
                child: ContinueUserName(
                  userNameController: userNameController,
                  function: validate,
                  ctx: context,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
