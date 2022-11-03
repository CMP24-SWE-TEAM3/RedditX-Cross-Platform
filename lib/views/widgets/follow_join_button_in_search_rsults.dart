import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/search_controller.dart';

class FollowJoinButtonWidget extends StatelessWidget {
  //the button of follow/unfollow in people searchr results
  //the button of join/unjoin in people searchr results
  const FollowJoinButtonWidget({
    super.key,
    required this.index,
    required this.isPeopleWidget, //true in people //false in communities
  });
  //to know which button in the list of items
  final int index;
  //to determine whether it is follow button or join button
  final bool isPeopleWidget;

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
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: Color.fromARGB(255, 3, 136, 245),
            ),
          ),
        ),
      ),
    );
  }
}
