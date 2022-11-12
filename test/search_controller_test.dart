import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:search_project/controllers/search_controller.dart';
import 'package:mocktail/mocktail.dart';
import 'package:search_project/models/search_model.dart';

class MockSearchService extends Mock implements SearchService {}

void main() {
  //SharedPreferences.setMockInitialValues({});
  late MockSearchService mockSearchService;
  late SearchController sut;

//stup method will run before each and every test
  setUp(() {
    mockSearchService = MockSearchService();
    sut = SearchController(searchService: SearchService());
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
      for (var i = 0; i < sut.searchService.peoplesList.length; i++) {
        expect(sut.isFollowing[i], sut.searchService.peoplesList[i].followed);
      }
    });

    test('Filling Joining List', () {
      sut.fillJoiningList();
      for (var i = 0; i < sut.searchService.communitiesList.length; i++) {
        expect(sut.isJoining[i], sut.searchService.communitiesList[i].joined);
      }
    });

    test('Filling  is Hovered Join Button List with false', () {
      sut.fillJoiningList();
      for (var i = 0; i < sut.searchService.communitiesList.length; i++) {
        expect(sut.isHoveredJoinButton[i], false);
      }
    });
    test('Filling  is Hovered Follow Button List with false', () {
      sut.fillFollowingList();
      for (var i = 0; i < sut.searchService.peoplesList.length; i++) {
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
      String shownDate = sut.calculateAge(DateTime(2021, 12, 30));
      expect(shownDate, '10 months ago');

      sut.isWeb = false;
      shownDate = sut.calculateAge(DateTime(2021, 12, 30));
      expect(shownDate, '10mo');
    });

    test('Time is more than or equal one day and less than one month', () {
      sut.isWeb = true;
      String shownDate = sut.calculateAge(DateTime(2022, 11, 3));
      expect(shownDate, '${DateTime.now().day - 3} days ago');

      sut.isWeb = false;
      shownDate = sut.calculateAge(DateTime(2022, 11, 3));
      expect(shownDate, '${DateTime.now().day - 3}d');
    });

    test('Time is more than or equal one hour and less than one day', () {
      sut.isWeb = true;
      String shownDate = sut.calculateAge(DateTime(2022, 11, 12, 12));
      expect(shownDate, '${DateTime.now().hour - 12} hours ago');

      sut.isWeb = false;
      shownDate = sut.calculateAge(DateTime(2022, 11, 12, 12));
      expect(shownDate, '${DateTime.now().hour - 12}h');
    });

    test('Time is more than or equal one minute and less than one hour', () {
      sut.isWeb = true;
      String shownDate =
          sut.calculateAge(DateTime(2022, 11, 12, DateTime.now().hour, 2));
      expect(shownDate, '${DateTime.now().minute - 2} minutes ago');

      sut.isWeb = false;
      shownDate =
          sut.calculateAge(DateTime(2022, 11, 12, DateTime.now().hour, 2));
      expect(shownDate, '${DateTime.now().minute - 2}m');
    });
  });
}
