import 'package:flutter/material.dart';
import '../Widgets/setting_email_password_textfield.dart';
import '../../const/const.dart';



class ChangePasswordScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  static const routeName = '/Settings/Account_Settings/Change_Password';

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
      body: Column(
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
            child: PasswordText(passwordController: passwordController),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Text("Cancel"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(white)),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Text("Save"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
