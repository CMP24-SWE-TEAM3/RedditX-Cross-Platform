import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../lib/controllers/create_community_controller.dart';
import '../lib/services/create_community_service.dart';

class MockCreateCommunityService extends Mock
    implements CreateCommunityService {}

void main() {
  late MockCreateCommunityService mockCreateCommunityService;
  late CreateCommunityViewModelController sut;
  setUp(() {
    mockCreateCommunityService = MockCreateCommunityService();
    sut = CreateCommunityViewModelController();
  });
  test('plus18 switch', () {
    bool? initialValue = sut.plus18;
    sut.togglePlus18();
    expect(sut.plus18, !initialValue!);
  });
}
