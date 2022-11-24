// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
// ignore: avoid_relative_lib_imports
import '../lib/models/post_model.dart';





class MockCommunityService extends Mock implements CommunityService {}

void main() {
  setUp(() {
  });


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
