import 'package:flutter_test/flutter_test.dart';
// ignore: avoid_relative_lib_imports
import '../lib/controllers/home_controller.dart';

Future<void> main() async {
  final HomeController homeService = HomeController();

  test('initial values are correct', () {
    expect(homeService.limit, 10);
    expect(homeService.page, 0);
  });

  test('testing load', () {
    var currPage = homeService.page;
    homeService.load();
    expect(homeService.page, (currPage + 1));
  });

  test('testing refresh', () {
    homeService.refresh();
    expect(homeService.page, 0);
  });
}
