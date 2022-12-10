import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:search_project/controllers/mobile_settings_view_controller.dart';
import 'package:search_project/services/settings_service.dart';

class MockSettingsService extends Mock implements SettingsService {}

void main() {
  late MockSettingsService mockSettingsService;
  late SettingsViewModelMobileController sut;
  setUp(() {
    mockSettingsService = MockSettingsService();
    sut = SettingsViewModelMobileController();
  });
  test('initial values are correct', () {
   // expect(sut.checkIconNotification, false);
  });

  group('Text Field Functions in controller works well', () {
    //this test was done at 2022/11/11/1:29
    //test('on Hover Text Field ==> onHover variable is true', () {
      //sut.onHoverTextField();
      //expect(sut.isHoveredTextField, true);
    });

    test('on Exit Text Field ==> onHover variable is false', () {
      //sut.onHoverTextField();
      //sut.onExitTextField();
      //expect(sut.isHoveredTextField, false);
    });

    test('on Tap Text Field ==> isTapped variable is true', () {
      // sut.onTapTextField();

      // /// bottomborderRadius = 0;
      // expect(sut.isTapped, true);
      // expect(sut.bottomborderRadius, 0);
    });
  }