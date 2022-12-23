import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../methods/circular_image_widget.dart';
import 'follow_join_button_in_search_rsults.dart';
import 'username_communityname.dart';

import '../../../controllers/search_controller.dart';
import '../../../models/search_model.dart';

///people Widget in search results comments tab
class PeopleSearchResult extends StatelessWidget {
  final PersonInSearch personData;

  ///Detects which item this widget represents
  final int index;
  const PeopleSearchResult({
    Key? key,
    required this.personData,
    required this.index,
  }) : super(key: key);

  String dateToShow() {
    ///calculate the age person has been in Reddit
    int years = DateTime.now().year - personData.date.year;
    int months = DateTime.now().month - personData.date.month;
    int days = DateTime.now().day - personData.date.day;

    ///negative value means the current day/month is less than the DateTime of the post
    ///so it means we are in a month/year after that one but not a full minute/day/month/year have passed
    ///so we subtract it
    ///Ex:3/11/2022-5/12/2022
    if (months < 0) {
      months = (12 - personData.date.month) + DateTime.now().month;
      years -= 1;
    } else if (days < 0) {
      int daysCount = personData.date.month == 2
          ? 28
          : (personData.date.month == 1 ||
                  personData.date.month == 3 ||
                  personData.date.month == 5 ||
                  personData.date.month == 7 ||
                  personData.date.month == 8 ||
                  personData.date.month == 10 ||
                  personData.date.month == 12)
              ? 31
              : 30;
      days = (daysCount - personData.date.day) + DateTime.now().day;
      months -= 1;
    }

    ///Format the shown period
    String shownDate = '';
    if (years != 0) {
      shownDate = '${years}y ${months}m';
    } else if (months != 0) {
      shownDate = '${months}m ${days}d';
    } else {
      shownDate = '${days}d';
    }
    return shownDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: Provider.of<SearchController>(context).isWeb ? 0 : 5,
          ),
          Row(
            children: [
              //for free space in the beginning
              const SizedBox(
                width: 8,
              ),

              ///Circular image
              CircularImageWidget(
                img: personData.img,
                radius: 35,
              ),
              //space in the right of the image
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: Provider.of<SearchController>(context).isWeb
                      ///////////////////////////////////WEB///////////////////////////////////
                      ? personData.about.isNotEmpty
                          //if about text is not empty
                          ? [
                              const SizedBox(
                                height: 15,
                              ),
                              FirstRowInWebPeopleInSearch(
                                personData: personData,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      textAlign: TextAlign.start,

                                      ///show only 100 characters
                                      personData.about.length > 100
                                          ? '${personData.about.substring(0, 100)}...'
                                          : personData.about,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Color.fromRGBO(124, 124, 124, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]
                          //if about text is empty ==> make the name in the middle of the widget vertically
                          : [
                              FirstRowInWebPeopleInSearch(
                                  personData: personData),
                            ]
                      : ///////////////////////////////////APP///////////////////////////////////
                      [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ///Username
                              UserOrCommunityNameText(
                                usernameOrCommunityName: personData.userName,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  textAlign: TextAlign.start,
                                  personData.karma < 1000
                                      ? '${personData.karma} Karma . ${dateToShow()}'
                                      : personData.karma < 1000000
                                          ? '${personData.karma ~/ 1000},${personData.karma % 1000} Karma . ${dateToShow()}'
                                          : '${personData.karma ~/ 1000000},${personData.karma % 1000000 ~/ 1000},${personData.karma % 1000} Karma . ${dateToShow()}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color.fromRGBO(124, 124, 124, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),

              ///Follow Button
              FollowJoinButtonWidget(
                index: index,
                isPeopleWidget: true,
                communityOrUserName: personData.userName,
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),

          ///Horizontal line
          const Divider(
            color: Color.fromRGBO(135, 138, 140, 0.2),
          ),
        ],
      ),
    );
  }
}

class FirstRowInWebPeopleInSearch extends StatelessWidget {
  const FirstRowInWebPeopleInSearch({
    super.key,
    required this.personData,
  });

  final PersonInSearch personData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Username
        UserOrCommunityNameText(
          usernameOrCommunityName: personData.userName,
        ),
        Expanded(
          child: Text(
            personData.karma > 1000000
                ? ' . ${double.parse((personData.karma / 1000000.0).toStringAsFixed(3))}m Karma'
                : personData.karma > 1000
                    ? ' . ${personData.karma / 1000.0}k Karma'
                    : ' . ${personData.karma} Karma',
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Color.fromRGBO(124, 124, 124, 1),
            ),
          ),
        ),
      ],
    );
  }
}
