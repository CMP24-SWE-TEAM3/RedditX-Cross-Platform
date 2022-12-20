import 'package:flutter/material.dart';
import 'package:search_project/config/constants.dart';






class ProfileProvider with ChangeNotifier {
  /// Index of tabs Posts,Comments and about in both [UserProfileMobileScreen] and [UserProfileWebScreen].
  int tabIndex = 0;
   bool mockData=iSMOCK;

  /// Toggle tab views: Posts& Comments & About
  void changeTab(int val) {
    tabIndex = val;
    notifyListeners();
  }

  /// calculating the age of posts from the DateTime they created at [createdAt]
  calculateAge(DateTime createdAt) {
    String shownDate = '';
    //calculate the number of days,months and years the person has been in Reddit
    int years = DateTime.now().year - createdAt.year;
    int months = DateTime.now().month - createdAt.month;
    int days = DateTime.now().day - createdAt.day;
    int hours = DateTime.now().hour - createdAt.hour;
    int minutes = DateTime.now().minute - createdAt.minute;
    int seconds = DateTime.now().second - createdAt.second;
    //negative value means the current second/minute/day/month is less than the DateTime of the post
    //so it means we are in a minute/day/month/year after that one but not a full minute/day/month/year have passed
    //so we subtract it
    //Ex:3/11/2022-5/12/2022
    if (months < 0) {
      months = (12 - createdAt.month) + DateTime.now().month;
      years -= 1;
    }
    if (days < 0) {
      int daysCount = createdAt.month == 2
          ? 28
          : (createdAt.month == 1 ||
                  createdAt.month == 3 ||
                  createdAt.month == 5 ||
                  createdAt.month == 7 ||
                  createdAt.month == 8 ||
                  createdAt.month == 10 ||
                  createdAt.month == 12)
              ? 31
              : 30;
      days = (daysCount - createdAt.day) + DateTime.now().day;
      months -= 1;
    }
    if (hours < 0) {
      hours = (24 - createdAt.hour) + DateTime.now().hour;
      days -= 1;
    }
    if (minutes < 0) {
      minutes = (60 - createdAt.minute) + DateTime.now().minute;
      hours -= 1;
    }
    if (seconds < 0) {
      hours = (60 - createdAt.second) + DateTime.now().second;
      minutes -= 1;
    }
    //format the shown period according to the values of days,months and years
    if (years != 0) {
      shownDate = '${years}y';
    } else if (months != 0) {
      shownDate = '${months}mo';
    } else if (days != 0) {
      shownDate = '${days}d';
    } else if (hours != 0) {
      shownDate = '${hours}h';
    } else if (minutes != 0) {
      shownDate = '${minutes}m';
    } else if (seconds != 0) {
      shownDate = '${seconds}s';
    } else {
      shownDate = 'now';
    }

    return shownDate;
  }




}
