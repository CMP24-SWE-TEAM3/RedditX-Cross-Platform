import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit/styles/colors.dart';

import '../../controllers/community_controller.dart';
import '../../styles/custom_icons.dart';
import 'dart:math' as math;

import 'default_drop_down_button_widget.dart';


/// Shows the web app bar title
class WebAppBarTitle extends StatelessWidget {
  
  /// Constrains to handle respositivity
  final BoxConstraints constraints;

  /// BuildContext to show pop up menus
  final BuildContext context;

  /// Web app bar title constructor
  const WebAppBarTitle(
      {super.key, required this.constraints, required this.context});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(child: Consumer<CommunityProvider>(
        builder: (context, value, child) {
          return Consumer<CommunityProvider>(
            builder: (context, value, child) => Row(
              children: [
                IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: const Icon(
                    CustomIcons.reddit,
                    color: Colors.red,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 6,
                ),
                if (constraints.minWidth >= 1098)
                  const Text(
                    'Reddit',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                const SizedBox(
                  width: 6,
                ),
                Expanded(
                    child: Container(
                  width: 500,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        label: Text("Search reddit"),
                        prefixIcon: Icon(Icons.search)),
                  ),
                )),
                Transform.rotate(
                  angle: 45 * math.pi / 180,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CustomIcons.arrow_up_circle,
                        color: Colors.black,
                      )),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CustomIcons.coins,
                      color: Colors.black,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CustomIcons.shield_1,
                      color: Colors.black,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CustomIcons.comment,
                      color: Colors.black,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: Colors.black,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black,
                    )),
                Container(
                    height: 35,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 236, 238, 238),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: TextButton(
                        onPressed: () {},
                        child: Row(
                          children: const [
                            Icon(
                              Icons.speaker,
                              color: Colors.black,
                            ),
                            Text(
                              "Advertise",
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        ))),
                const SizedBox(
                  width: 10,
                ),
                if (constraints.minWidth >= 600)
                  InkWell(
                      focusColor: whiteColor,
                      hoverColor: whiteColor,
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 195, 195, 195)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            const CircleAvatar(
                              radius: 15,
                              backgroundImage: NetworkImage(
                                 "https://i.pinimg.com/564x/cd/c8/11/cdc8110b6e2f746ab4c615b69d07dbfe.jpg"),
                            ),
                            DefaultDropDownButton(
                                icon: Icons.arrow_drop_down,
                                optionsCount: 2,
                                listValues: const ["1", "2"],
                                map: const {"1": Icons.add, "2": Icons.add},
                                width: (constraints.minWidth >= 1200)
                                    ? 180
                                    : (constraints.minWidth >= 800)
                                        ? 60
                                        : 10)
                          ],
                        ),
                      ))
              ],
            ),
          );
        },
      )),
    );
  }
}
