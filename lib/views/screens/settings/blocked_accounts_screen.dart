import 'package:flutter/material.dart';

class BloackedAccountsScreen extends StatelessWidget {
  const BloackedAccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blocked accounts"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          TextField(
            //onTap: ,
            decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
          )
        ],
      ),
    );
  }
}

class BlockedSearch extends StatelessWidget {
  const BlockedSearch({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextField(),
      ),
    );
  }
}
