import 'package:flutter/material.dart';
import '../../widgets/drawers/right_drawer.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});
  static const routeName = '/drawer_home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text("drawers Homepage")),
      appBar: AppBar(
        title: const Text("Home page"),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: <Widget>[
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          )
        ],
      ),
      endDrawer: rightDrawer(context),
      drawer: Drawer(
        child: Container(
          color: Colors.red,
          child: const Center(
            child: Text(
              "Reddit",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
