import 'package:flutter/material.dart';
import 'package:search_project/views/screens/Home/home_page.dart';
import 'package:search_project/views/screens/Popular/popular_page.dart';
import 'package:search_project/views/screens/search/search_screen_one.dart';
import '../../../models/user_model.dart';

void displayDrawer(BuildContext context) {
  Scaffold.of(context).openDrawer();
}

void displayEndDrawer(BuildContext context) {
  Scaffold.of(context).openEndDrawer();
}

final items = ['🛖 Home', '↗ Popular'];
String value = items[0];
String? currentValue;

AppBar buildHomeBar(text) {
  currentValue = text;
  if (currentValue != null) {
    if (currentValue == 'Home') {
      value = items[0];
    } else {
      value = items[1];
    }
  }
  return AppBar(
    title: const Text('Home'),
    centerTitle: false,
    leading: Builder(builder: (context) {
      return IconButton(
        key: const ValueKey('leftbannel_ToolBar'),
        icon: const Icon(Icons.menu),
        onPressed: () => Scaffold.of(context).openDrawer(),
      );
    }),
    actions: [
      Builder(builder: (context) {
        return DropdownButton(
            key: const ValueKey('dropdown_ToolBar'),
            value: value,
            iconEnabledColor: Colors.amberAccent,
            items: items.map(buildMenuItem).toList(),
            onChanged: (value) {
              if (value?.split(' ')[1] == 'Home' && currentValue != 'Home') {
                Navigator.of(context)
                    .pushReplacementNamed(HomePage.routeName, arguments: {});
                // print(value);
              } else if (value?.split(' ')[1] == 'Popular' &&
                  currentValue != 'Popular') {
                Navigator.of(context)
                    .pushReplacementNamed(Popular.routeName, arguments: {});
                // print(value);
              }
            });
      }),
      Builder(builder: (context) {
        return IconButton(
        key: const ValueKey('search_ToolBar'),
        onPressed: () {
          Navigator.of(context)
              .pushReplacementNamed(SearchScreenOne.routeName, arguments: {});
        },
        icon: const Icon(Icons.search),
      );
      }),
      IconButton(
        key: const ValueKey('add_ToolBar'),
        onPressed: () {
          // Routemaster.of(context).push('/add-post');
        },
        icon: const Icon(Icons.add),
      ),
      Builder(builder: (context) {
        return IconButton(
          key: const ValueKey('righttbannel_ToolBar'),
          icon: CircleAvatar(
            backgroundImage: NetworkImage(currentUser!.avatar!),
          ),
          onPressed: () => Scaffold.of(context).openEndDrawer(),
        );
      }),
    ],
  );
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
