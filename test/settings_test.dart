import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
// ignore: avoid_relative_lib_imports
import '../lib/controllers/settings_validations.dart';
// ignore: avoid_relative_lib_imports
import '../lib/services/settings_service.dart';
// ignore: avoid_relative_lib_imports
import '../lib/controllers/mobile_settings_view_controller.dart';


class MockSettingsService extends Mock implements SettingsService {}

void main() {
  //late MockSettingsService mockSettingsService;
  late SettingsViewModelMobileController sut;
  setUp(() {
    //  mockSettingsService = MockSettingsService();
    sut = SettingsViewModelMobileController();
  });
  test('taking a switch as example', () async {
    bool? initialValue = await sut.getSwitchValue("allowToFollow");
    sut.toggleSwitchLogic("allowToFollow");
    expect(await sut.getSwitchValue("allowToFollow"), !initialValue!);
  });
  test('taking a switch as example2', () async {
    bool? initialValue = await sut.getSwitchValue("allowChatRequests");
    sut.toggleSwitchLogic("allowChatRequests");
    expect(await sut.getSwitchValue("allowChatRequests"), !initialValue!);
  });
  test('taking a switch as example3', () async {
    bool? initialValue = await sut.getSwitchValue("allowDirectMessages");
    sut.toggleSwitchLogic("allowDirectMessages");
    expect(await sut.getSwitchValue("allowDirectMessages"), !initialValue!);
  });
  test('taking a switch as example4', () async {
    bool? initialValue = await sut.getSwitchValue("InboxMessages");
    sut.toggleSwitchLogic("InboxMessages");
    expect(await sut.getSwitchValue("InboxMessages"), !initialValue!);
  });
  test('taking a switch as example5', () async {
    bool? initialValue = await sut.getSwitchValue("chatRequestsEmails");
    sut.toggleSwitchLogic("chatRequestsEmails");
    expect(await sut.getSwitchValue("chatRequestsEmails"), !initialValue!);
  });
  test('taking a switch as example6', () async {
    bool? initialValue = await sut.getSwitchValue("newUserWelcomeEmails");
    sut.toggleSwitchLogic("newUserWelcomeEmails");
    expect(await sut.getSwitchValue("newUserWelcomeEmails"), !initialValue!);
  });
  test('taking a switch as example7', () async {
    bool? initialValue = await sut.getSwitchValue("commentsOnYourPostsEmails");
    sut.toggleSwitchLogic("commentsOnYourPostsEmails");
    expect(
        await sut.getSwitchValue("commentsOnYourPostsEmails"), !initialValue!);
  });
  test('taking a switch as example8', () async {
    bool? initialValue =
        await sut.getSwitchValue("repliesToYourCommentsEmails");
    sut.toggleSwitchLogic("repliesToYourCommentsEmails");
    expect(await sut.getSwitchValue("repliesToYourCommentsEmails"),
        !initialValue!);
  });
  test('taking a switch as example9', () async {
    bool? initialValue = await sut.getSwitchValue("upvotesOnYourPostsEmails");
    sut.toggleSwitchLogic("upvotesOnYourPostsEmails");
    expect(
        await sut.getSwitchValue("upvotesOnYourPostsEmails"), !initialValue!);
  });
  test('taking a switch as example10', () async {
    bool? initialValue =
        await sut.getSwitchValue("upvotesOnYourCommentsEmails");
    sut.toggleSwitchLogic("upvotesOnYourCommentsEmails");
    expect(await sut.getSwitchValue("upvotesOnYourCommentsEmails"),
        !initialValue!);
  });
  test('taking a switch as example11', () async {
    bool? initialValue = await sut.getSwitchValue("userNameMentionsEmails");
    sut.toggleSwitchLogic("userNameMentionsEmails");
    expect(await sut.getSwitchValue("userNameMentionsEmails"), !initialValue!);
  });
  test('taking a switch as example12', () async {
    bool? initialValue = await sut.getSwitchValue("newFollowersEmails");
    sut.toggleSwitchLogic("newFollowersEmails");
    expect(await sut.getSwitchValue("newFollowersEmails"), !initialValue!);
  });
  test('taking a switch as example13', () async {
    bool? initialValue = await sut.getSwitchValue("dailyDigestEmails");
    sut.toggleSwitchLogic("dailyDigestEmails");
    expect(await sut.getSwitchValue("dailyDigestEmails"), !initialValue!);
  });
  test('taking a switch as example14', () async {
    bool? initialValue = await sut.getSwitchValue("weeklyRecapEmails");
    sut.toggleSwitchLogic("weeklyRecapEmails");
    expect(await sut.getSwitchValue("weeklyRecapEmails"), !initialValue!);
  });
  test('taking a switch as example15', () async {
    bool? initialValue = await sut.getSwitchValue("communityDiscoveryEmails");
    sut.toggleSwitchLogic("communityDiscoveryEmails");
    expect(
        await sut.getSwitchValue("communityDiscoveryEmails"), !initialValue!);
  });
  test('taking a switch as example16', () async {
    bool? initialValue = await sut.getSwitchValue("unsubscribeFromAllEmails");
    sut.toggleSwitchLogic("unsubscribeFromAllEmails");
    expect(
        await sut.getSwitchValue("unsubscribeFromAllEmails"), !initialValue!);
  });
  test('validation of change password functions 1 _ valid', () async {
    //bool? initialValue = await sut.getSwitchValue("unsubscribeFromAllEmails");
    int? res = validateChangePassword(
        TextEditingController(text: "KazaMoza1"),
        TextEditingController(text: "KazaMoza2"),
        TextEditingController(text: "KazaMoza2"));
    expect(res, 0);
  });
  group('validation of change password functions', () {
    test(' 2_invalid', () async {
      //bool? initialValue = await sut.getSwitchValue("unsubscribeFromAllEmails");
      int? res = validateChangePassword(
          TextEditingController(text: "KazaMoza1"),
          TextEditingController(text: "KazaMoza2"),
          TextEditingController(text: "KazaMoza1"));
      expect(res, -1);
    });
    test('2_invalid: wrong confirm new password', () async {
      //bool? initialValue = await sut.getSwitchValue("unsubscribeFromAllEmails");
      int? res = validateChangePassword(
          TextEditingController(text: "KazaMoza1"),
          TextEditingController(text: "KazaMoza2"),
          TextEditingController(text: "KazaMoza1"));
      expect(res, -1);
    });
    test('3_invalid:same as old password', () async {
      //bool? initialValue = await sut.getSwitchValue("unsubscribeFromAllEmails");
      int? res = validateChangePassword(
          TextEditingController(text: "KazaMoza1"),
          TextEditingController(text: "KazaMoza1"),
          TextEditingController(text: "KazaMoza1"));
      expect(res, -1);
    });
    test('4_ unmatched confirm', () async {
      //bool? initialValue = await sut.getSwitchValue("unsubscribeFromAllEmails");
      int? res = validateChangePassword(
          TextEditingController(text: "KazaMoza1"),
          TextEditingController(text: "Kazamoz"),
          TextEditingController(text: "Kaza"));
      expect(res, -1);
    });
  });
}
