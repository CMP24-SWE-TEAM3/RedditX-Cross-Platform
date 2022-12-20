import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_project/controllers/drawer_view_model_controller.dart';
import 'package:search_project/views/screens/authentication/splash_screen.dart';
import 'package:search_project/views/screens/create_community/create_community_screen.dart';
import 'package:search_project/views/screens/settings/setting_menu.dart';

import '../../../models/authentication.dart';
import '../../../models/drawers_model.dart';
import '../../../models/user_model.dart';
import '../../screens/authentication/choose_profilepicture.dart';
import '../../screens/authentication/sign_up_page.dart';

Drawer leftDrawer(BuildContext context) {
  List<bool> isopen =
      Provider.of<DrawersViewModelController>(context).expandIsOpen;
  return Drawer(
    child: Column(
      children: [
        (!userauthentication.isSignedIn)
            ? Column(
                children: [
                  const Divider(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.person_sharp,
                        size: 100,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Sign up to upvote the best content,\ncustomize your feed,share your\n interests,and more! ",
                        maxLines: 5,
                      )
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  InkWell(
                    child: ListTile(
                      leading: const Icon(Icons.person_pin),
                      title: const Text("Log in to add your communities"),
                      onTap: () =>
                          Navigator.of(context).pushNamed(SignUpPage.routeName),
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  const Divider(
                    height: 70,
                  ),
                  ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      Provider.of<DrawersViewModelController>(context,
                              listen: false)
                          .expandingIsOpen(index, isExpanded);
                    },
                    children: [
                      ExpansionPanel(
                          headerBuilder: (context, bool isExpanded) {
                            return const ListTile(
                              title: Text('Your Communities'),
                            );
                          },
                          body: Column(children: [
                            for (int i = 0;
                                i < communitiesListLeftDrawer!.length;
                                i++)
                              ListTile(
                                leading: const Icon(Icons.reddit),
                                title: Text(communitiesListLeftDrawer![i]!
                                    .substring(3)),
                              ),
                          ]),
                          isExpanded: isopen.elementAt(0)),
                      ExpansionPanel(
                          headerBuilder: (context, bool isExpanded) {
                            return const ListTile(
                              title: Text('Moderating'),
                            );
                          },
                          body: Column(children: [
                            InkWell(
                              child: ListTile(
                                leading: const Icon(Icons.add),
                                title: const Text("Create a community"),
                                onTap: () => Navigator.of(context)
                                    .pushNamed(CreateCommunityScreen.routeName),
                              ),
                            ),
                            for (int i = 0;
                                i < moderatedCommunitiesListLeftDrawer!.length;
                                i++)
                              ListTile(
                                leading: const Icon(Icons.reddit),
                                title: Text(
                                    moderatedCommunitiesListLeftDrawer![i]!
                                        .substring(3)),
                              ),
                          ]),
                          isExpanded: isopen.elementAt(1)),
                    ],
                  )
                ],
              ),
      ],
    ),
  );
}
