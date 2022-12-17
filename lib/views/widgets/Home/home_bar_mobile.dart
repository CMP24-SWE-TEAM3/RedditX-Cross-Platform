import 'package:flutter/material.dart';
import '../../../models/user_model.dart';

void displayDrawer(BuildContext context) {
  Scaffold.of(context).openDrawer();
}

void displayEndDrawer(BuildContext context) {
  Scaffold.of(context).openEndDrawer();
}

AppBar buildHomeBar({text, function}) {
  return AppBar(
    title: const Text('Home'),
    centerTitle: false,
    leading: Builder(builder: (context) {
      return IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => displayDrawer(context),
      );
    }),
    actions: [
      IconButton(
        onPressed: () {
          // showSearch(context: context, delegate: SearchCommunityDelegate(ref));
        },
        icon: const Icon(Icons.search),
      ),
      IconButton(
        onPressed: () {
          // Routemaster.of(context).push('/add-post');
        },
        icon: const Icon(Icons.add),
      ),
      Builder(builder: (context) {
        return IconButton(
          icon: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://api.redditswe22.tech/users/files/${currentUser!.avatar}'),
          ),
          onPressed: () => displayEndDrawer(context),
        );
      }),
    ],
  );
}
