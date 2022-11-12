// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:reddit/controllers/community_controller.dart';

import 'package:reddit/main.dart';
import 'package:reddit/models/community_service.dart';
import 'package:reddit/views/screens/community_home_mobile_screen.dart';
import 'package:reddit/views/screens/community_home_web_screen.dart';

class MockCommunityService extends Mock implements CommunityService {}

void main() {
  late MockCommunityService mockCommunityService;
  setUp(() {
    mockCommunityService = MockCommunityService();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return (constraints.minWidth.round() < 500)
            ? CommunityMobileScreen(context: context, constraints: constraints)
            : CommunityWebScreen(context: context, constraints: constraints);
      }),
    );
  }

  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(ChangeNotifierProvider(
  //       builder: (context, _) => Divider(),
  //       create: (context) =>
  //           CommunityProvider(communityService: mockCommunityService)));

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  // });
}
