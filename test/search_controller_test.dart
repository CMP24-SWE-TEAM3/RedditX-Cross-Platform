import 'package:flutter_test/flutter_test.dart';
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
    sut = SearchController(searchService: mockSearchService);
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

    expect(sut.searchService, mockSearchService);
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
      sut.onExitTapTextField();
      expect(sut.isTapped, false);
    });

    test(
        'on press the clear button in the end of Text Field ==> text is cleared',
        () {
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
      expect(shownDate, '8 days ago');

      sut.isWeb = false;
      shownDate = sut.calculateAge(DateTime(2022, 11, 3));
      expect(shownDate, '8d');
    });

    test('Time is more than or equal one hour and less than one day', () {
      sut.isWeb = true;
      String shownDate = sut.calculateAge(DateTime(2022, 11, 10, 12));
      expect(shownDate, '13 hours ago');

      sut.isWeb = false;
      shownDate = sut.calculateAge(DateTime(2022, 11, 10, 12));
      expect(shownDate, '13h');
    });

    test('Time is more than or equal one minute and less than one hour', () {
      sut.isWeb = true;
      String shownDate = sut.calculateAge(DateTime(2022, 11, 11, 1, 8));
      expect(shownDate, '${DateTime.now().minute - 8} minutes ago');

      sut.isWeb = false;
      shownDate = sut.calculateAge(DateTime(2022, 11, 11, 1, 8));
      expect(shownDate, '${DateTime.now().minute - 8}m');
    });
  });
}
