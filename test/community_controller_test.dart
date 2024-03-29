import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
// ignore: avoid_relative_lib_imports
import '../lib/controllers/community_controller.dart';
// ignore: avoid_relative_lib_imports
import '../lib/models/post_model.dart';
// ignore: avoid_relative_lib_imports
import '../lib/styles/custom_icons.dart';

class MockCommunityService extends Mock implements CommunityService {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  late MockCommunityService mockCommunityService;
  late CommunityProvider sut;

  //stup method will run before each and every test
  setUp(() {
    mockCommunityService = MockCommunityService();
    sut = CommunityProvider(communityService: mockCommunityService);
  });
  test('initial values are correct', () {
    expect(sut.expandedHeight, 320);
    expect(sut.joinLeaveButtonText, "Joined");
    expect(sut.tabIndex, 0);
    expect(sut.isExpanded, false);
    expect(sut.joined, false);
    expect(sut.notificationIcon, Icons.notifications_outlined);
    expect(sut.postView, "card");

    expect(sut.bottomSheetNotificationsIcons, [
      Icons.notifications_off_outlined,
      Icons.notifications,
      Icons.notifications_active_outlined
    ]);
    expect(sut.postSortByIcon, Icons.local_fire_department_rounded);
    expect(sut.bottomSheetPostSortIcons, [
      Icons.local_fire_department_rounded,
      CustomIcons.certificateOutline,
      CustomIcons.award,
    ]);
    expect(sut.postSortByType, "HOT POSTS");
    expect(sut.postViewIcon, Icons.view_stream_outlined);
    expect(sut.bottomSheetPostViewIcons,
        [Icons.view_stream_outlined, CustomIcons.menu]);

    expect(sut.checkIconNotification, [false, true, false]);
    expect(sut.checkIconPostView, [true, false]);
    expect(sut.checkIconPostSortBy, [true, false, false]);
    expect(sut.sortPostsButtonsHover, [false, false, false]);

    expect(sut.communityService, mockCommunityService);
  });

  group('Join/Unjoin community works well:', () {
    test('on pressing join button in mobile ==> joined will be true', () {
      sut.joinCommunity();
      expect(sut.joined, true);
    });

    test('on pressing Leave button in mobile ==> joined will be false', () {
      sut.unJoinCommunity();
      expect(sut.joined, false);
    });

    test(
        'on Hover Join/Leave button in web ==> joinLeaveButtonText variable will be "Leave"',
        () {
      sut.joinLeaveButtonOnHover();
      expect(sut.joinLeaveButtonText, "Leave");
    });

    test(
        'on Exit Join/Leave button in web ==> joinLeaveButtonText variable will be "Joined"',
        () {
      sut.joinLeaveButtonOnExit();
      expect(sut.joinLeaveButtonText, "Joined");
    });
  });

  group('Change sliver app bar expanded height works well:', () {
    test(
        'on pressing the community description in mobile screen, if isExpanded=false  ==> isExpanded variable will be true',
        () {
      sut.changeExpandedHight(false);
      expect(sut.isExpanded, true);
    });

    test(
        'on pressing the community description in mobile screen, if isExpanded=true  ==> isExpanded variable will be false',
        () {
      sut.changeExpandedHight(true);
      expect(sut.isExpanded, false);
    });
    test(
        'on pressing the community description in mobile screen, if isExpanded=true  ==> expandedHeight variable will be 400',
        () {
      sut.changeExpandedHight(false);
      expect(sut.expandedHeight, 450);
    });

    test(
        'on pressing the community description in mobile screen, if isExpanded=false  ==> expandedHeight variable will be 320',
        () {
      sut.changeExpandedHight(true);
      expect(sut.expandedHeight, 350);
    });
  });

  group('Toggle tabs works well:', () {
    test('on pressing the tab  ==> the tab index will be equal to its value',
        () {
      sut.changeTab(0);
      expect(sut.tabIndex, 0);
    });
  });

  group('Like/Unlike post works well:', () {
    test('Get posts', () async {
      when(
        () => sut.communityService.getPosts(),
      ).thenAnswer((_) async => []);
      await sut.communityService.getPosts();
      verify(() => sut.communityService.getPosts()).called(1);
    });
  });

  group('Get posts:', () {
    test('Checking existence of posts list returned from getPosts function',
        () async {
      when(
        () => sut.communityService.getPosts(),
      ).thenAnswer((_) async => []);
      await sut.communityService.getPosts();
      verify(() => sut.communityService.getPosts()).called(1);
    });
  });

  group('Change notifications type works well:', () {
    test(
        'on choosing "Off"  ==> the notificationIcon variable will be Icons.notifications_off_outlined and checkIcon for this icon will be true',
        () {
      sut.changeNotificationsType("Off", 0);
      expect(sut.notificationIcon, Icons.notifications_off_outlined);
      expect(sut.checkIconNotification[0], true);
    });

    test(
        'on choosing "Low"  ==> the notificationIcon variable will be Icons.notifications_outlined and checkIcon for this icon will be true',
        () {
      sut.changeNotificationsType("Low", 1);
      expect(sut.notificationIcon, Icons.notifications_outlined);
      expect(sut.checkIconNotification[1], true);
    });

    test(
        'on choosing "Frequent"  ==> the notificationIcon variable will be Icons.notifications_active_outlined and checkIcon for this icon will be true',
        () {
      sut.changeNotificationsType("Frequent", 2);
      expect(sut.notificationIcon, Icons.notifications_active_outlined);
      expect(sut.checkIconNotification[2], true);
    });
  });

  group('Change post view works well:', () {
    test(
        'on choosing "Card"  ==> the postViewIcon variable will be Icons.view_stream_outlined and checkIcon for this icon will be true',
        () {
      sut.changePostView("card", 0);
      expect(sut.checkIconPostView[0], true);
      expect(sut.postViewIcon, Icons.view_stream_outlined);
    });

    test(
        'on choosing "Classic"  ==> the postViewIcon variable will be CustomIcons.menu and checkIcon for this icon will be true',
        () {
      sut.changePostView("classic", 1);
      expect(sut.checkIconPostView[1], true);
      expect(sut.postViewIcon, CustomIcons.menu);
    });
  });
}
