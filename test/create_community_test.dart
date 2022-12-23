import 'package:flutter_test/flutter_test.dart';
// ignore: avoid_relative_lib_imports
import '../lib/controllers/create_community_controller.dart';

void main() {
  late CreateCommunityViewModelController sut;
  setUp(() {
    sut = CreateCommunityViewModelController();
  });
  test('plus18 switch', () {
    bool? initialValue = sut.plus18;
    sut.togglePlus18();
    expect(sut.plus18, !initialValue!);
  });
}
