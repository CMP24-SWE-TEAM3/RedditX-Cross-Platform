import 'package:flutter/material.dart';

import 'package:username_gen/username_gen.dart';



import '../../../controllers/authentication_submitions.dart';

import '../../../controllers/validations.dart';
import '../../widgets/authentication/choice_button.dart';
import '../../widgets/authentication/continue_username.dart';

import '../../widgets/authentication/sign_up_bar.dart';


class ChooseUserName extends StatefulWidget {
  const ChooseUserName({super.key});
  static const routeName = '/ChooseUserName';

  @override
  State<ChooseUserName> createState() => _ChooseUserNameState();
}

class _ChooseUserNameState extends State<ChooseUserName> {
  bool _submit = false;
  TextEditingController userNameController = TextEditingController();
  String? errorUserNameText;

  var _userNameSuggest = ['', '', ''];

  void submit1(userNameController, ctx) {
    submitUserName(userNameController.text, ctx);

    
  }

  void submit2(String username, ctx) {
    submitUserName(username, ctx);

    
  }



  void refresh() {
    setState(() => _userNameSuggest = [
          UsernameGen().generate(),
          UsernameGen().generate(),
          UsernameGen().generate()
        ]);
  }

  @override
  void initState() {
    super.initState();
    _userNameSuggest = [
      UsernameGen().generate(),
      UsernameGen().generate(),
      UsernameGen().generate()
    ];
  }

  Future<void> validate(userNameController, ctx) async {
    setState(() => _submit = true);
    if (_submit) {
      errorUserNameText = await usernameValidation(userNameController.text, ctx);

      if (errorUserNameText == null) {
        submit1(userNameController, ctx);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final dynamic appBar = buildAppBar();
    final heightScreen = (mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top);
    final widthScreen = (mediaQuery.size.width);
    final padding = EdgeInsets.symmetric(
      vertical: heightScreen * 0.01,
      horizontal: widthScreen * 0.05,
    );
    final paddingleft = heightScreen * 0.03;
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
                    padding: EdgeInsets.only(
                      left: paddingleft,
                      bottom: heightScreen * 0.01,
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
                          letterSpacing: 0.1,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: paddingleft,
                      bottom: heightScreen * 0.01,
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
                    padding: EdgeInsets.only(
                      left: paddingleft,
                      bottom: heightScreen * 0.01,
                    ),
                    child: TextField(
                      key: const ValueKey('username_text_field_username_page'),
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
                    padding: EdgeInsets.only(
                      left: paddingleft,
                      bottom: heightScreen * 0.01,
                    ),
                    child: const Text(
                      'This will be your name forever, so make sure it feels like you.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: paddingleft,
                      bottom: heightScreen * 0.01,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Can\'t think of one? use one of these:',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        IconButton(
                           key: const ValueKey('refresh_option_button'),
                          onPressed: refresh,
                          icon: const Icon(Icons.refresh_rounded),
                        ),
                      ],
                    ),
                  ),
                  chooseUserName(
                      paddingleft, heightScreen, context, _userNameSuggest[0]),
                  chooseUserName(
                      paddingleft, heightScreen, context, _userNameSuggest[1]),
                  chooseUserName(
                      paddingleft, heightScreen, context, _userNameSuggest[2]),
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
                  key: const ValueKey('continue_username_page'),
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

  Padding chooseUserName(
    double paddingleft,
    double heightScreen,
    BuildContext context,
    String username,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        left: paddingleft,
        bottom: heightScreen * 0.01,
      ),
      child: ChoiceButton(
        key: const ValueKey('username_option_button'),
        username, submit2, context),
    );
  }
}
