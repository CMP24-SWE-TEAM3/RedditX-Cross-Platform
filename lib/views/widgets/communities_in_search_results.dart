// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/search_controller.dart';
import '../../models/search_model.dart';
import 'circular_image_widget.dart';
import 'follow_join_button_in_search_rsults.dart';
import 'username_communityname.dart';

class CommunitiesSearchResult extends StatelessWidget {
  final CommunityInSearch communityData;
  //to select which item this widget represents
  final int index;
  const CommunitiesSearchResult({
    Key? key,
    required this.communityData,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                //space in the left of the image
                const SizedBox(
                  width: 10,
                ),
                //circular image
                CircularImageWidget(
                  img: communityData.img,
                ),
                //space in the right of the image
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: Provider.of<SearchController>(context).isWeb
                        ///////////////////////////////////WEB///////////////////////////////////
                        ? communityData.about.isEmpty
                            //if about text is empty ==> make the name in the middle of the widget vertically
                            ? [
                                Expanded(
                                  child: CommunityNameRow(
                                    communityData: communityData,
                                  ),
                                ),
                              ]
                            //if about text is not empty
                            : [
                                const SizedBox(
                                  height: 15,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: CommunityNameRow(
                                    communityData: communityData,
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: AboutCommunityText(
                                    communityData: communityData,
                                    maxNumberOfCharacters: 100,
                                  ),
                                ),
                              ]
                        : ///////////////////////////////////APP///////////////////////////////////
                        [
                            //space in the top
                            const SizedBox(
                              height: 15,
                            ),
                            //community name
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                UserOrCommunityNameText(
                                  usernameOrCommunityName: communityData.name,
                                ),
                              ],
                            ),
                            //just space
                            const SizedBox(
                              height: 1,
                            ),
                            //numbr of memebers
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  communityData.membersCount > 1000000
                                      ? '${double.parse((communityData.membersCount / 1000000.0).toStringAsFixed(3))}m members'
                                      : communityData.membersCount > 1000
                                          ? '${communityData.membersCount / 1000.0}k members'
                                          : '${communityData.membersCount} members',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color.fromRGBO(124, 124, 124, 1),
                                  ),
                                ),
                              ],
                            ),
                            //just space
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AboutCommunityText(
                                  communityData: communityData,
                                  maxNumberOfCharacters: 30,
                                ),
                              ],
                            ),
                          ],
                  ),
                ),
                //space between text and the button
                const SizedBox(
                  width: 10,
                ),
                FollowJoinButtonWidget(
                  index: index,
                  isPeopleWidget: false,
                ),
                //space in the right of the button
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          //horizontal line
          const Divider(
            color: Color.fromRGBO(135, 138, 140, 0.2),
          ),
        ],
      ),
    );
  }
}

class AboutCommunityText extends StatelessWidget {
  const AboutCommunityText({
    Key? key,
    required this.communityData,
    required this.maxNumberOfCharacters,
  }) : super(key: key);

  final CommunityInSearch communityData;
  //30 in App
  //100 in web
  final int maxNumberOfCharacters;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.start,
      communityData.about.length > maxNumberOfCharacters
          ? '${communityData.about.substring(0, maxNumberOfCharacters)}...'
          : communityData.about,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: Color.fromRGBO(124, 124, 124, 1),
      ),
    );
  }
}

class CommunityNameRow extends StatelessWidget {
  const CommunityNameRow({
    super.key,
    required this.communityData,
  });
  final CommunityInSearch communityData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        UserOrCommunityNameText(
          usernameOrCommunityName: communityData.name,
        ),
        Text(
          communityData.membersCount > 1000000
              ? '${double.parse((communityData.membersCount / 1000000.0).toStringAsFixed(3))}m Members'
              : communityData.membersCount > 1000
                  ? '${communityData.membersCount / 1000.0}k Members'
                  : '${communityData.membersCount} Members',
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color.fromRGBO(124, 124, 124, 1),
          ),
        ),
      ],
    );
  }
}
