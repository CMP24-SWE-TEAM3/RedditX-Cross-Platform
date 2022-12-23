import 'package:flutter/material.dart';
import 'package:search_project/views/screens/add_post/add_post_screen_one.dart';
import '../../../views/screens/Home/home_page.dart';
import '../../../views/screens/Popular/popular_page.dart';
import '../../../views/screens/search/search_screen_one.dart';
import '../../../models/user_model.dart';
import '../../screens/temphome.dart';

final items = ['🛖 Home', '↗ Popular'];
String value = items[0];
String? currentValue;

AppBar buildHomeBarWeb(text) {
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
        key: const ValueKey('logo_ToolBar'),
        icon: const ImageIcon(
          NetworkImage(
              'https://www.iconpacks.net/icons/2/free-reddit-logo-icon-2436-thumb.png'),
        ),
        onPressed: () => Navigator.of(context)
            .pushReplacementNamed(Home.routeName, arguments: {}),
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
      Builder(builder: (context) {
        return IconButton(
          key: const ValueKey('add_ToolBar'),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(
                AddPostScreenOne.routeName,
                arguments: {});
          },
          icon: const Icon(Icons.add),
        );
      }),
      Builder(builder: (context) {
        return IconButton(
          key: const ValueKey('righttbannel_ToolBar'),
          icon: CircleAvatar(
            backgroundImage: (currentUser!.avatar == null)
                ? const NetworkImage(
                    'https://www.iconpacks.net/icons/2/free-reddit-logo-icon-2436-thumb.png')
                : NetworkImage(currentUser!.avatar!),
          ),
          onPressed: null,
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
