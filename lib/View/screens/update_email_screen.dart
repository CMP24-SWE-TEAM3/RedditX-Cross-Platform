import 'package:flutter/material.dart';
import '../Widgets/setting_email_password_textfield.dart';
import '../../const/const.dart';

class UpdateEmailAddress extends StatefulWidget {
  const UpdateEmailAddress({super.key});
  static const routeName = '/Settings/Account_Settings/Update_Email';
  @override
  State<UpdateEmailAddress> createState() => _UpdateEmailAddressState();
}

class _UpdateEmailAddressState extends State<UpdateEmailAddress> {
  TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                    Text(
                      "email@gmail.com",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
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
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(white)),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text("Save"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
