// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/search_controller.dart';
import '../../styles/custom_icons.dart';

///the button of follow/unfollow in people searchr results
///the button of join/unjoin in people searchr results
class FollowJoinButtonWidget extends StatelessWidget {
  const FollowJoinButtonWidget({
    Key? key,
    required this.index,
    required this.isPeopleWidget,
    required this.communityOrUserName,
  }) : super(key: key);
  //to know which button in the list of items
  final int index;
  //to determine whether it is follow button or join button
  final bool isPeopleWidget;

  final String communityOrUserName;

  @override
  Widget build(BuildContext context) {
    //to detect when the button is hovered woth mouse in web
    return MouseRegion(
      //when hover the button with mouse
      onHover: (val) {
        isPeopleWidget
            ? Provider.of<SearchController>(
                context,
                listen: false,
              ).onHoverFollowButton(index)
            : Provider.of<SearchController>(
                context,
                listen: false,
              ).onHoverJoinButton(index);
      },
      //when exit hover with mouse
      onExit: (val) {
        isPeopleWidget
            ? Provider.of<SearchController>(
                context,
                listen: false,
              ).onExitFollowButton(index)
            : Provider.of<SearchController>(
                context,
                listen: false,
              ).onExitJoinButton(index);
      },
      child: TextButton(
        key: isPeopleWidget
            ? const Key('follow_button')
            : const Key('Join_Button'),
        //call onPressing function from controller
        onPressed: () {
          isPeopleWidget
              ? Provider.of<SearchController>(
                  context,
                  listen: false,
                ).onPressingFollowButton(index)
              : Provider.of<SearchController>(
                  context,
                  listen: false,
                ).onPressingJoinButton(index);
                ///alert when click the follow or join button
                ///it will appears for 5 seconds
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              key: isPeopleWidget
                  ? const Key('follow_alert')
                  : const Key('Join_alert'),
              backgroundColor: Colors.white,
              duration: const Duration(seconds: 5),
              content: Row(
                children: [
                  const Icon(CustomIcons.reddit),
                  Text(
                    style: const TextStyle(color: Colors.black),
                    isPeopleWidget
                        ? Provider.of<SearchController>(context, listen: false)
                                .isFollowing[index]
                            ? Provider.of<SearchController>(context,
                                        listen: false)
                                    .isWeb
                                ? '  Successfully followed $communityOrUserName'
                                : '  Following $communityOrUserName'
                            : Provider.of<SearchController>(context,
                                        listen: false)
                                    .isWeb
                                ? '  Successfully unfollowed $communityOrUserName'
                                : '  You are no longer following $communityOrUserName'
                        : Provider.of<SearchController>(context, listen: false)
                                .isJoining[index]
                            ? Provider.of<SearchController>(context,
                                        listen: false)
                                    .isWeb
                                ? '  Successfully joined $communityOrUserName'
                                : '  You have joined the $communityOrUserName community!'
                            : Provider.of<SearchController>(context,
                                        listen: false)
                                    .isWeb
                                ? '  Successfully left $communityOrUserName'
                                : '  You have left the $communityOrUserName community',
                  ),
                ],
              ),
            ),
          );
        },

        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              //if App & not Following||not joining (according to the widget)==> grey
              //else App ==> white, web ==> light grey
              return !Provider.of<SearchController>(context).isWeb &&
                          isPeopleWidget &&
                          !Provider.of<SearchController>(context)
                              .isFollowing[index] ||
                      !isPeopleWidget &&
                          !Provider.of<SearchController>(context)
                              .isJoining[index]
                  ? const Color.fromRGBO(0, 121, 211, 0.1)
                  : Provider.of<SearchController>(context).isWeb
                      ? const Color.fromRGBO(0, 121, 211, 0.06)
                      : Colors.white;
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //to make the button RoundedRectangle
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
              //Border side Color
              side: BorderSide(
                //if App & folloeing||joining (according to the widget)==>blue
                //else ==>white
                color: !Provider.of<SearchController>(context).isWeb &&
                        (isPeopleWidget &&
                                Provider.of<SearchController>(context)
                                    .isFollowing[index] ||
                            !isPeopleWidget &&
                                Provider.of<SearchController>(context)
                                    .isJoining[index])
                    ? Colors.blue
                    : Colors.white,
              ),
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            //if the text is longer(Following and Joined case) ==> make the padding cmaller
            horizontal: (isPeopleWidget &&
                        Provider.of<SearchController>(context)
                            .isFollowing[index]) ||
                    (!isPeopleWidget &&
                        Provider.of<SearchController>(context).isJoining[index])
                ? 8.0
                : 18.0,
            vertical: 10,
          ),
          child: Text(
            isPeopleWidget
                //////////////////////////
                //people widget
                //according to platform and following case (T/F) and hovering with the mouse in web
                ? (!Provider.of<SearchController>(context).isFollowing[index])
                    ? 'Follow'
                    : Provider.of<SearchController>(context).isWeb
                        ? Provider.of<SearchController>(context)
                                .isHoveredFollowButton[index]
                            ? 'UnFollow'
                            : 'Following'
                        : 'UnFollow'
                //////////////////////////
                //community widget
                //according to platform and joining case (T/F) and hovering with the mouse in web
                : (!Provider.of<SearchController>(context).isJoining[index])
                    ? 'Join'
                    : Provider.of<SearchController>(context).isWeb &&
                            Provider.of<SearchController>(context)
                                .isHoveredJoinButton[index]
                        ? 'Leave'
                        : 'Joined',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 3, 136, 245),
            ),
          ),
        ),
      ),
    );
  }
}
