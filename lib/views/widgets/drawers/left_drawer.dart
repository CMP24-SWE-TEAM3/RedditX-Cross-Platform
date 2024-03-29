import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_project/models/post_model.dart';
import 'package:search_project/models/user_model.dart';
import '../../../controllers/drawer_view_model_controller.dart';
import '../../../views/screens/community/community_home.dart';
import '../../../views/screens/create_community/create_community_screen.dart';

import '../../../models/authentication.dart';
import '../../../models/drawers_model.dart';
import '../../screens/authentication/sign_up_page.dart';
///left drawer widget
Drawer leftDrawer(BuildContext context) {
  ///list of open status of expansion list tiles
  List<bool> isopen =
      Provider.of<DrawersViewModelController>(context).expandIsOpen;
  return Drawer(
    child: Column(
      children: [
        (!userauthentication.isSignedIn)
            //guest mode
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
              //logged in mode
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
                              InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CommunityHome(
                                              userName: currentUser!.username!,
                                              commName:
                                                  communitiesListLeftDrawer![
                                                      i]!,
                                              posts: communityPostsList,
                                            ))),
                                child: ListTile(
                                  leading: const Icon(Icons.reddit),
                                  title: Text(communitiesListLeftDrawer![i]!
                                      .substring(3)),
                                ),
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
                              InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CommunityHome(
                                            userName: currentUser!.username!,
                                            posts: communityPostsList,
                                            commName:
                                                moderatedCommunitiesListLeftDrawer![
                                                    i]!,
                                          )),
                                ),
                                child: ListTile(
                                  leading: const Icon(Icons.reddit),
                                  title: Text(
                                      moderatedCommunitiesListLeftDrawer![i]!
                                          .substring(3)),
                                ),
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
