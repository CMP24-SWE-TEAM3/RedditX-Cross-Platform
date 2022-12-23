import 'package:flutter_test/flutter_test.dart';
// ignore: avoid_relative_lib_imports
import '../lib/controllers/drawer_view_model_controller.dart';
import 'auth_test.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  late DrawersViewModelController sut;
  setUp(() async {
    sut = DrawersViewModelController();
    setupFirebaseAuthMocks();
    await Firebase.initializeApp();
  });
  test('online status is toggled correctly', () async {
    bool? initialValue = sut.onlineStatusControl;
    await sut.toggleOnlineStatus();
    expect(sut.onlineStatusControl, !initialValue!);
  });
  test('expanding an expansion tile in left drawer #1', () {
    bool? initialValue = sut.expandIsOpen[0];
    sut.expandingIsOpen(0, true);
    expect(sut.expandIsOpen[0], !initialValue);
  });
  test('expanding an expansion tile in left drawerv #2', () {
    bool? initialValue = sut.expandIsOpen[1];
    sut.expandingIsOpen(1, false);
    expect(sut.expandIsOpen[1], !initialValue);
  });
}
