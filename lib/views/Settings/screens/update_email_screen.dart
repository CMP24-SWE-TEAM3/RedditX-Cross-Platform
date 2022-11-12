import 'package:flutter/material.dart';
import '../../Widgets/setting_email_password_textfield.dart';
import '../../../config/const.dart';
import '../widgets/forgot_password_dialogue.dart';

class UpdateEmailAddress extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  static const routeName = '/Settings/Account_Settings/Update_Email';

  UpdateEmailAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),
        ),
        title: const Text("Update email address"),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(Icons.person_pin_outlined),
                  )
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: const [
                    Text(
                      "u/USER_NAME",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "email@gmail.com",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: EmailText(emailController: emailController),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PasswordText(
                passwordController: passwordController, labeling: "Password"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () => dialogBuilder(context),
                child: const Text("Forgot password?",
                    style: TextStyle(color: Colors.blue))),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Expanded(
                      flex: 1,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.blue)),
                          ),
                          //maximumSize: MaterialStateProperty.all(double.infinity),
                        ),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.blue)))),
                      child: const Text("Save"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
