import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search_project/controllers/search_controller.dart';
import 'package:mocktail/mocktail.dart';
import 'package:search_project/models/search_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSearchService extends Mock implements SearchService {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
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
      expect(sut.isTapped, true);
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

  group('Shared preferences of search history', () {
    test('First item in the search history is the last submitted text', () {
      sut.searchTextFieldcontroller.text = 'Text to test search history';
      sut.onSubmittingTextField();
      expect(sut.restoreSearchHistory![0], 'Text to test search history');
    });

    test('Last submitted text is saved in the shared preferences', () async {
      sut.searchTextFieldcontroller.text = 'Text to test search history';
      sut.onSubmittingTextField();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      expect(prefs.getStringList("SearchHistory")![0],
          'Text to test search history');
    });

    test('Deleting search history item', () async {
      //it works like a stack for input text
      sut.searchTextFieldcontroller.text = 'Text2 to test search history';
      sut.onSubmittingTextField();
      sut.searchTextFieldcontroller.text = 'Text1 to test search history';
      sut.onSubmittingTextField();
      sut.searchTextFieldcontroller.text = 'Text0 to test search history';
      sut.onSubmittingTextField();

      //delete the second item
      sut.deleteSearchHistory(1);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      expect(prefs.getStringList("SearchHistory")![1],
          'Text2 to test search history');
      expect(sut.restoreSearchHistory![1], 'Text2 to test search history');
    });

    test('Restore search history and save it in the restoreSearchHistory List',
        () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      expect(sut.restoreSearchHistory, prefs.getStringList("SearchHistory"));
    });
  });
}
