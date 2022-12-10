import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: avoid_relative_lib_imports
import '../lib/controllers/sign_in_controller.dart';
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
    expect(authService.isSignedIn, true);
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
    expect(authService.uid, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbFR5cGUiOiJiYXJlIGVtYWlsIiwidXNlcm5hbWUiOiJ0Ml9BaG1lZExvdGZ5MDIyMiIsImlhdCI6MTY2OTE1ODMxMywiZXhwIjoxNjY5NTkwMzEzfQ._HP3h2ChmLPiivdKN29b1mn9cuc-6pw_Q5rBGNwDiLY');
  });

  test('testing signup', () {
    authService.signUp('ahmed@example.com', 'ahmed', '134');
    expect(authService.uid, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbFR5cGUiOiJiYXJlIGVtYWlsIiwidXNlcm5hbWUiOiJ0Ml9BaG1lZExvdGZ5MDIyMiIsImlhdCI6MTY2OTE1ODMxMywiZXhwIjoxNjY5NTkwMzEzfQ._HP3h2ChmLPiivdKN29b1mn9cuc-6pw_Q5rBGNwDiLY');
  });

  test('testing sending interest', () {
    authService
        .interest(['Career', 'Lifehacks', 'Funny', 'Interesting', 'Jokes']);
    final bool equal = const ListEquality().equals(authService.list,
        ['Career', 'Lifehacks', 'Funny', 'Interesting', 'Jokes']);
    expect(equal, true);
  });
}
