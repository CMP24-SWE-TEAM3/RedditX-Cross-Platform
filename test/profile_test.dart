// ignore_for_file: avoid_relative_lib_imports

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../lib/controllers/profile_controller.dart';
import '../lib/models/post_model.dart';

class MockProfileService extends Mock implements ProfileService {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  late MockProfileService mockProfileService;
  late ProfileProvider sut;

  //stup method will run before each and every test
  setUp(() {
    mockProfileService = MockProfileService();
    sut = ProfileProvider(profileService: mockProfileService);
  });

  test('initial values are correct', () {
    expect(sut.tabIndex, 0);
    
  });

   test('on pressing posts tab => tab index will be 0', () {
    sut.changeTab(0);
    expect(sut.tabIndex, 0);
  });

   test('on pressing comments tab => tab index will be 1', () {
    sut.changeTab(1);
    expect(sut.tabIndex, 1);
  });

   test('on pressing about tab => tab index will be 2', () {
    sut.changeTab(2);
    expect(sut.tabIndex, 2);
  });

   test('on pressing saved tab => tab index will be 3', () {
    sut.changeTab(3);
    expect(sut.tabIndex, 3);
  });

   test('on pressing upvoted tab => tab index will be 4', () {
    sut.changeTab(4);
    expect(sut.tabIndex, 4);
  });

   test('on pressing downvoted tab => tab index will be 5', () {
    sut.changeTab(5);
    expect(sut.tabIndex, 5);
  });


}