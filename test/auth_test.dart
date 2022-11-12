import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reddit/Controllers/sign_in_controller.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:collection/collection.dart';

typedef Callback = void Function(MethodCall call);

void setupFirebaseAuthMocks([Callback? customHandlers]) {
  TestWidgetsFlutterBinding.ensureInitialized();

  setupFirebaseCoreMocks();
}

Future<void> main() async {
  setupFirebaseAuthMocks();
  await Firebase.initializeApp();
  final SignInController authService = SignInController();

  test('initial values are correct', () {
    expect(authService.isSignedIn, false);
    expect(authService.hasError, false);
    expect(authService.errorCode, null);
    expect(authService.provider, null);
    expect(authService.uid, null);
    expect(authService.name, null);
    expect(authService.username, null);
    expect(authService.email, null);
    expect(authService.gender, null);
    expect(authService.imageUrl, null);
    expect(authService.list, null);
  });

  test('testing sending gender', () {
    authService.sendGender('man');
    expect(authService.gender, 'man');
  });

  test('testing sending sendPhoto', () {
    File imageFile = File('file.txt');
    authService.sendPhoto(imageFile);
    expect(authService.imageUrl,
        'https://www.shutterstock.com/image-photo/head-shot-portrait-close-smiling-600w-1714666150.jpg');
  });

  test('testing sending sendUserName', () {
    authService.sendUserName('Ahmed300');
    expect(authService.username, 'Ahmed300');
  });

  test('testing logIn', () {
    authService.logIn('ahmed', '134');
    expect(authService.uid, '1234');
    expect(authService.name, 'Ahmed Hany');
    expect(authService.email, 'Ahmed@Hany.com');
    expect(authService.imageUrl, 'assets/images/defaultuser.png');
    expect(authService.provider, 'google');
    expect(authService.username, 'Ahmed300');
  });

  test('testing signup', () {
    authService.signUp('ahmed@example.com', 'ahmed', '134');
    expect(authService.uid, '1234');
    expect(authService.name, 'Ahmed Hany');
    expect(authService.email, 'Ahmed@Hany.com');
    expect(authService.provider, 'bare email');
    expect(authService.username, 'Ahmed300');
  });

  test('testing sending interest', () {
    authService
        .interest(['Career', 'Lifehacks', 'Funny', 'Interesting', 'Jokes']);
    final bool equal = const ListEquality().equals(authService.list,
        ['Career', 'Lifehacks', 'Funny', 'Interesting', 'Jokes']);
    expect(equal, true);
  });
}
