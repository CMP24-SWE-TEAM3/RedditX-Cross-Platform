import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:search_project/controllers/search_controller.dart';
//import 'package:mocktail/mocktail.dart';
import 'package:search_project/models/search_model.dart';

void main() {
  late SearchController sut;

//stup method will run before each and every test
  setUp(() {
    sut = SearchController();
    communitiesListData = [
      CommunityInSearch(
        nsfw: true,
        name: 'CommunityName1',
        img:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2C8Z76bai2hfofGkaRDN2E_WAozCYOLL7ONbCgmSEQg&s',
        about: 'Reddit community for test purpose',
        membersCount: 1220,
        joined: true,
      ),
      CommunityInSearch(
        nsfw: false,
        name: 'CommunityName2',
        img:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFU7U2h0umyF0P6E_yhTX45sGgPEQAbGaJ4g&usqp=CAU',
        about: 'CommunityName2 is a community for memes',
        membersCount: 152,
        joined: false,
      ),
      CommunityInSearch(
        nsfw: false,
        name: 'CommunityName3',
        img:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvQRXWBKMqCQ4zssn7Ik5PI7IY0gZwih_i_g&usqp=CAU',
        about: 'Ablut text About Text',
        membersCount: 37,
        joined: false,
      ),
      CommunityInSearch(
        nsfw: false,
        name: 'CommunityName4',
        img:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnTo6TDNKkt5BW4MzI3YMaB9fEap7PneWulj2oE2JSC4tYaHEkN5q86ybgF7v8HGnlxD4&usqp=CAU',
        about: 'Islamic history community',
        membersCount: 11586,
        joined: false,
      ),
      CommunityInSearch(
        nsfw: false,
        name: 'CommunityName5',
        img:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOd256TcC6vcaQ99TYzoP0pBbch9_Q-bbrmw&usqp=CAU',
        about: 'world news community',
        membersCount: 111222333,
        joined: true,
      ),
      CommunityInSearch(
        nsfw: false,
        name: 'CommunityName6',
        img:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFU7U2h0umyF0P6E_yhTX45sGgPEQAbGaJ4g&usqp=CAU',
        about: '',
        membersCount: 113,
        joined: false,
      ),
    ];
    postsListData = [
      PostInSearch(
        postText:
            'World War II or the Second Worl all of the great powers—forming two opposing military alliances: the Allies and the Axis powers. World War II was a total war that directly involved more than 100 million personnel from more than 30 countries. The major participants in the war threw their entire economic, industrial, and scientific capabilities behind the war effort, blurring the distinction between civilian and military resources. Aircraft played a major role in the conflict, enabling the strategic bombing of population centres and deploying the only two nuclear weapons ever used in war. World War II was by far the deadliest conflict in human history; it resulted in 70 to 85 million fatalities, mostly among civilians. Tens of millions died due to genocides (including the Holocaust), starvation, massacres, and disease. In the wake of the Axis defeat, Germany and Japan were occupied, and war crimes tribunals were conducted against German and Japanese leaders.',
        communityName: 'u/communityName1',
        userName: 'u/userName1',
        communityIcon:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2C8Z76bai2hfofGkaRDN2E_WAozCYOLL7ONbCgmSEQg&s',
        flairText: 'News',
        createdAt: DateTime(2021, 10, 30),
        votesCount: 125,
        commentsCount: 0,
        attachedMedia: [],
        nsfw: false,
        spoiler: true,
      ),
      PostInSearch(
        postText:
            'World War II or the Second World War, often abbreviated as WWII or WW2, was a global war that lasted from 1937 to 1945. It involved the vast majority of the worlds countries—including all of the great powers—forming two opposing military alliances: the Allies and the Axis powers. World War II was a total war that directly involved more than 100 million personnel from more than 30 countries. The major participants in the war threw their entire economic, industrial, and scientific capabilities behind the war effort, blurring the distinction between civilian and military resources. Aircraft played a major role in the conflict, enabling the strategic bombing of population centres and deploying the only two nuclear weapons ever used in war. World War II was by far the deadliest conflict in human history; it resulted in 70 to 85 million fatalities, mostly among civilians. Tens of millions died due to genocides (including the Holocaust), starvation, massacres, and disease. In the wake of the Axis defeat, Germany and Japan were occupied, and war crimes tribunals were conducted against German and Japanese leaders.',
        communityName: 'u/communityName2',
        userName: 'u/userName2',
        communityIcon:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFU7U2h0umyF0P6E_yhTX45sGgPEQAbGaJ4g&usqp=CAU',
        flairText: 'Politics',
        createdAt: DateTime(2021, 11, 7),
        votesCount: -1555,
        commentsCount: 123,
        attachedMedia: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2C8Z76bai2hfofGkaRDN2E_WAozCYOLL7ONbCgmSEQg&s',
        ],
        nsfw: true,
        spoiler: true,
      ),
      PostInSearch(
        postText:
            'World War II or the Second World War, often abbreviated as WWII or WW2, was a global war that lasted from 1937 to 1945. It involved the vast majority of the worlds countries—including all of the great powers—forming two opposing military alliances: the Allies and the Axis powers. World War II was a total war that directly involved more than 100 million personnel from more than 30 countries. The major participants in the war threw their entire economic, industrial, and scientific capabilities behind the war effort, blurring the distinction between civilian and military resources. Aircraft played a major role in the conflict, enabling the strategic bombing of population centres and deploying the only two nuclear weapons ever used in war. World War II was by far the deadliest conflict in human history; it resulted in 70 to 85 million fatalities, mostly among civilians. Tens of millions died due to genocides (including the Holocaust), starvation, massacres, and disease. In the wake of the Axis defeat, Germany and Japan were occupied, and war crimes tribunals were conducted against German and Japanese leaders.',
        communityName: 'u/communityName3',
        userName: 'u/userName3',
        communityIcon:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOd256TcC6vcaQ99TYzoP0pBbch9_Q-bbrmw&usqp=CAU',
        flairText: '',
        createdAt: DateTime(2021, 12, 5),
        votesCount: 1002,
        commentsCount: 25,
        attachedMedia: [],
        nsfw: false,
        spoiler: true,
      ),
      PostInSearch(
        postText:
            'World War II or the Second World War, often abbreviated as WWII or WW2, was a global war that lasted from 1937 to 1945. It involved the vast majority of the worlds countries—including all of the great powers—forming two opposing military alliances: the Allies and the Axis powers. World War II was a total war that directly involved more than 100 million personnel from more than 30 countries. The major participants in the war threw their entire economic, industrial, and scientific capabilities behind the war effort, blurring the distinction between civilian and military resources. Aircraft played a major role in the conflict, enabling the strategic bombing of population centres and deploying the only two nuclear weapons ever used in war. World War II was by far the deadliest conflict in human history; it resulted in 70 to 85 million fatalities, mostly among civilians. Tens of millions died due to genocides (including the Holocaust), starvation, massacres, and disease. In the wake of the Axis defeat, Germany and Japan were occupied, and war crimes tribunals were conducted against German and Japanese leaders.',
        communityName: 'u/communityName4',
        userName: 'u/userName4',
        communityIcon:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvQRXWBKMqCQ4zssn7Ik5PI7IY0gZwih_i_g&usqp=CAU',
        flairText: '',
        createdAt: DateTime(2022, 11, 2),
        votesCount: 2102233,
        commentsCount: 123456,
        attachedMedia: [],
        nsfw: true,
        spoiler: true,
      ),
    ];
  });
  test('initial values are correct', () {
    expect(sut.isFocused, false);
    expect(sut.isHoveredTextField, false);
    expect(sut.isTapped, false);

    expect(sut.isHoveredJoinButton, []);
    expect(sut.isHoveredFollowButton, []);
    expect(sut.isJoining, []);
    expect(sut.isFollowing, []);

    expect(sut.restoreSearchHistory, []);

    expect(sut.isRTLText, false);
    expect(sut.clickedItemIndex, 0);
    expect(sut.bottomborderRadius, 0);
  });

  group('Text Field Functions in controller works well', () {
    //this test was done at 2022/11/11/1:29
    test('on Hover Text Field ==> onHover variable is true', () {
      sut.onHoverTextField();
      expect(sut.isHoveredTextField, true);
    });

    test('on Exit Text Field ==> onHover variable is false', () {
      sut.onHoverTextField();
      sut.onExitTextField();
      expect(sut.isHoveredTextField, false);
    });

    test('on Tap Text Field ==> isTapped variable is true', () {
      sut.onTapTextField();

      /// bottomborderRadius = 0;
      expect(sut.isTapped, true);
      expect(sut.bottomborderRadius, 0);
    });

    test('on Tap outside Text Field ==> isTapped variable is false', () {
      sut.isWeb = true;
      sut.onExitTapTextField();
      expect(sut.isTapped, false);
      expect(sut.bottomborderRadius, 20);

      sut.isWeb = false;
      sut.onExitTapTextField();
      expect(sut.isTapped, false);
      expect(sut.bottomborderRadius, 0);
    });

    test(
        'on press the clear button in the end of Text Field ==> text is cleared',
        () {
      sut.isWeb = true;
      sut.textFieldSuffixOnPressed();
      expect(sut.searchTextFieldcontroller.text, '');
    });

    test('on typing Aeabic in App in the Text Field ==> text direction is RTL',
        () {
      sut.isWeb = false;
      sut.searchTextFieldcontroller.text = 'دنيا';
      sut.isRTLTextField();
      expect(sut.isRTLText, true);
    });

    test('on typing English in App in the Text Field ==> text direction is LTR',
        () {
      sut.isWeb = false;
      sut.searchTextFieldcontroller.text = 'Flutter';
      sut.isRTLTextField();
      expect(sut.isRTLText, false);
    });

    test('on typing Aeabic in WEB in the Text Field ==> text direction is LTR',
        () {
      sut.isWeb = true;
      sut.searchTextFieldcontroller.text = 'دنيا';
      sut.isRTLTextField();
      expect(sut.isRTLText, false);
    });

    test('on typing English in WEB in the Text Field ==> text direction is LTR',
        () {
      sut.isWeb = true;
      sut.searchTextFieldcontroller.text = 'Flutter';
      sut.isRTLTextField();
      expect(sut.isRTLText, false);
    });
  });

  group('test follow / join Functions', () {
    test('Filling Following List', () {
      sut.fillFollowingList();
      for (var i = 0; i < peoplesListData.length; i++) {
        expect(sut.isFollowing[i], peoplesListData[i].followed);
      }
    });

    test('Filling Joining List', () {
      sut.fillJoiningList();
      for (var i = 0; i < communitiesListData.length; i++) {
        expect(sut.isJoining[i], communitiesListData[i].joined);
      }
    });

    test('Filling  is Hovered Join Button List with false', () {
      sut.fillJoiningList();
      for (var i = 0; i < communitiesListData.length; i++) {
        expect(sut.isHoveredJoinButton[i], false);
      }
    });
    test('Filling  is Hovered Follow Button List with false', () {
      sut.fillFollowingList();
      for (var i = 0; i < peoplesListData.length; i++) {
        expect(sut.isHoveredFollowButton[i], false);
      }
    });

    test('Press Follow Button', () {
      sut.fillFollowingList();
      bool beforePress = sut.isFollowing[1];
      sut.onPressingFollowButton(1);
      bool afterPress = sut.isFollowing[1];
      expect(afterPress, !beforePress);
    });

    test('Press Join Button', () {
      sut.fillJoiningList();
      bool beforePress = sut.isJoining[1];
      sut.onPressingJoinButton(1);
      bool afterPress = sut.isJoining[1];
      expect(afterPress, !beforePress);
    });

    test('Hover Join Button', () {
      sut.fillJoiningList();
      sut.onHoverJoinButton(2);
      expect(sut.isHoveredJoinButton[2], true);
    });

    test('Hover Follow Button', () {
      sut.fillFollowingList();
      sut.onHoverFollowButton(2);
      expect(sut.isHoveredFollowButton[2], true);
    });

    test('Exit Hover Join Button', () {
      sut.fillJoiningList();
      sut.onExitJoinButton(2);
      expect(sut.isHoveredJoinButton[2], false);
    });

    test('Exit hover Follow Button', () {
      sut.fillFollowingList();
      sut.onExitFollowButton(2);
      expect(sut.isHoveredFollowButton[2], false);
    });
  });

  group('Test Functions that detect needed colors', () {
    test('Text Field Fill Color', () {
      //8 combinations of the three boolean variables
      sut.isWeb = false;
      sut.isHoveredTextField = false;
      sut.isTapped = false;
      expect(sut.fillColorTextField(), const Color.fromRGBO(230, 230, 230, 1));

      sut.isWeb = false;
      sut.isHoveredTextField = false;
      sut.isTapped = true;
      expect(sut.fillColorTextField(), const Color.fromRGBO(230, 230, 230, 1));

      sut.isWeb = false;
      sut.isHoveredTextField = true;
      sut.isTapped = false;
      expect(sut.fillColorTextField(), const Color.fromRGBO(230, 230, 230, 1));

      sut.isWeb = false;
      sut.isHoveredTextField = true;
      sut.isTapped = true;
      expect(sut.fillColorTextField(), const Color.fromRGBO(230, 230, 230, 1));

      sut.isWeb = true;
      sut.isHoveredTextField = false;
      sut.isTapped = false;
      expect(sut.fillColorTextField(), const Color.fromRGBO(230, 230, 230, 1));

      sut.isWeb = true;
      sut.isHoveredTextField = false;
      sut.isTapped = true;
      expect(sut.fillColorTextField(), Colors.white);

      sut.isWeb = true;
      sut.isHoveredTextField = true;
      sut.isTapped = false;
      expect(sut.fillColorTextField(), Colors.white);

      sut.isWeb = true;
      sut.isHoveredTextField = true;
      sut.isTapped = true;
      expect(sut.fillColorTextField(), Colors.white);
    });

    test('Text field on hover color', () {
      sut.isWeb = true;
      expect(sut.hoverColorTextField(), Colors.white);
      sut.isWeb = false;
      expect(sut.hoverColorTextField(), const Color.fromRGBO(230, 230, 230, 1));
    });

    test('Focused Border color', () {
      sut.isWeb = true;
      expect(sut.focusBorderColorTextField(), Colors.blue);
      sut.isWeb = false;
      expect(sut.focusBorderColorTextField(),
          const Color.fromRGBO(230, 230, 230, 1));
    });

    test('Focused Border color', () {
      sut.isWeb = false;
      sut.isHoveredTextField = false;
      expect(sut.enabledBorderColor(), const Color.fromRGBO(230, 230, 230, 1));

      sut.isWeb = false;
      sut.isHoveredTextField = true;
      expect(sut.enabledBorderColor(), const Color.fromRGBO(230, 230, 230, 1));

      sut.isWeb = true;
      sut.isHoveredTextField = false;
      expect(sut.enabledBorderColor(), Colors.white);

      sut.isWeb = true;
      sut.isHoveredTextField = true;
      expect(sut.enabledBorderColor(), Colors.blue);
    });
  });
  group('test calculate age function and formatting it', () {
    test('Time is more than or equal one year', () {
      sut.isWeb = true;
      String shownDate = sut.calculateAge(DateTime(2020, 10, 30));
      expect(shownDate, '2 years ago');

      sut.isWeb = false;
      shownDate = sut.calculateAge(DateTime(2020, 10, 30));
      expect(shownDate, '2y');
    });

    test('Time is more than or equal one month and less than one year', () {
      sut.isWeb = true;
      String shownDate = sut.calculateAge(DateTime(2022, 2, 1));
      expect(shownDate, '10 months ago');

      sut.isWeb = false;
      shownDate = sut.calculateAge(DateTime(2022, 2, 1));
      expect(shownDate, '10mo');
    });

    test('Time is more than or equal one day and less than one month', () {
      sut.isWeb = true;
      String shownDate = sut.calculateAge(DateTime(2022, 12, 1));
      expect(shownDate, '${DateTime.now().day - 1} days ago');

      sut.isWeb = false;
      shownDate = sut.calculateAge(DateTime(2022, 12, 1));
      expect(shownDate, '${DateTime.now().day - 1}d');
    });

    test('Time is more than or equal one hour and less than one day', () {
      sut.isWeb = true;
      String shownDate =
          sut.calculateAge(DateTime(2022, 12, DateTime.now().day, 5));
      expect(shownDate, '${DateTime.now().hour - 5} hours ago');

      sut.isWeb = false;
      shownDate = sut.calculateAge(DateTime(2022, 12, DateTime.now().day, 5));
      expect(shownDate, '${DateTime.now().hour - 5}h');
    });

    test('Time is more than or equal one minute and less than one hour', () {
      sut.isWeb = true;
      String shownDate = sut.calculateAge(DateTime(DateTime.now().year,
          DateTime.now().month, DateTime.now().day, DateTime.now().hour, 2));
      expect(shownDate, '${DateTime.now().minute - 2} minutes ago');

      sut.isWeb = false;
      shownDate = sut.calculateAge(DateTime(DateTime.now().year,
          DateTime.now().month, DateTime.now().day, DateTime.now().hour, 2));
      expect(shownDate, '${DateTime.now().minute - 2}m');
    });
  });
}
