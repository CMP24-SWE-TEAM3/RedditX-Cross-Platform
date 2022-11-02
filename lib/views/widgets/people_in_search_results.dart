// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/search_controller.dart';
import '../../models/search_model.dart';

class PeopleSearchResult extends StatelessWidget {
  final PersonInSearch personData;
  final int index;
  const PeopleSearchResult({
    Key? key,
    required this.personData,
    required this.index,
  }) : super(key: key);

  String dateToShow() {
    int years = DateTime.now().year - personData.date.year;
    int months = DateTime.now().month - personData.date.month;
    int days = DateTime.now().day - personData.date.day;
    if (years == 1 && months < 0) {
      years = 0;
    }
    if (months < 0) {
      months = (12 - personData.date.month) + DateTime.now().month;
    } else if (months == 1 && days < 0) {
      months = 0;
    }

    if (days < 0) {
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
    }
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
    var row = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        UserNameText(personData: personData),
        Text(
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
      ],
    );
    return Container(
      height: 100,
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                //for free space in the beginning
                const SizedBox(
                  width: 10,
                ),
                //circular image
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        personData.img,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: Provider.of<SearchController>(context).isWeb
                        ? personData.about.isNotEmpty
                            ? [
                                const SizedBox(
                                  height: 15,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: row,
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          textAlign: TextAlign.start,
                                          //maxLines: 2,
                                          //overflow: TextOverflow.ellipsis,
                                          personData.about.length > 100
                                              ? '${personData.about.substring(0, 100)}...'
                                              : personData.about,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: Color.fromRGBO(
                                                124, 124, 124, 1),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]
                            : [
                                Expanded(
                                  child: Center(
                                    child: row,
                                  ),
                                ),
                              ]
                        : [
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                UserNameText(personData: personData),
                              ],
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
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
                              ],
                            ),
                          ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                MouseRegion(
                  onHover: (val) {
                    Provider.of<SearchController>(
                      context,
                      listen: false,
                    ).onHoverFollowButton(index);
                  },
                  child: TextButton(
                    //call onPressingFollowButton function from controller
                    onPressed: () {
                      Provider.of<SearchController>(
                        context,
                        listen: false,
                      ).onPressingFollowButton(index);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          //if App & not Following ==> Bluegrey
                          //else ==> white
                          return !Provider.of<SearchController>(context)
                                      .isWeb &&
                                  !Provider.of<SearchController>(context)
                                      .isFollowing[index]
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
                          //Border sie Color
                          side: BorderSide(
                            color:
                                !Provider.of<SearchController>(context).isWeb &&
                                        Provider.of<SearchController>(context)
                                            .isFollowing[index]
                                    ? Colors.blue
                                    : Colors.white,
                          ),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Provider.of<SearchController>(context)
                                .isFollowing[index]
                            ? 8.0
                            : 18.0,
                        vertical: 10,
                      ),
                      child: Text(
                        (!Provider.of<SearchController>(context)
                                .isFollowing[index])
                            ? 'Follow'
                            : Provider.of<SearchController>(context).isWeb
                                ? Provider.of<SearchController>(context)
                                        .isHoveredFollowButton[index]
                                    ? 'UnFollow'
                                    : 'Following'
                                : 'UnFollow',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 3, 136, 245),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          const Divider(
            color: Color.fromRGBO(135, 138, 140, 0.2),
          ),
        ],
      ),
    );
  }
}

class UserNameText extends StatelessWidget {
  const UserNameText({
    super.key,
    required this.personData,
  });

  final PersonInSearch personData;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.start,
      personData.userName,
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 12,
        color: Color.fromRGBO(28, 28, 28, 1),
      ),
    );
  }
}
