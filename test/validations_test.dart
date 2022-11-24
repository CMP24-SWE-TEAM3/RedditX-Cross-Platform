import 'package:flutter_test/flutter_test.dart';
import 'package:reddit/controllers/validations.dart';

void main() {
  group('Validations for Emails', () {
    test('Valid Email', () {
      String email = 'test@example.com';
      expect(emailValidation(email), null);
    });
    test('InValid Email 1', () {
      String email = 'test@example';
      expect(emailValidation(email), 'Not a valid email address');
    });
    test('InValid Email 2', () {
      String email = '';
      expect(emailValidation(email), 'Please Enter This Field');
    });
  });

  group('Validations for Usernames', () {
    test('Valid Username', () {
      String username = 'Ahmed';
      expect(usernameValidationinternal(username), null);
    });
    
    test('InValid Username 1', () {
      String username = 'a';
      expect(usernameValidationinternal(username), 'Username must be between 3 and 20 characters');
    });
    test('InValid Username 2', () {
      String username = 'asdfasdfasdfasddfasdfasdfasdfasdfasdfasdf';
      expect(usernameValidationinternal(username), 'Username must be between 3 and 20 characters');
    });
    test('InValid Username 3', () {
      String username = 'ah.sadf';
      expect(usernameValidationinternal(username), 'Letters, numbers, dashes, and underscores only. please try again without symbols.');
    });
    test('InValid Username 4', () {
      String username = '';
      expect(usernameValidationinternal(username), 'Please Enter This Field');
    });
  });


    group('Validations for Passwords', () {
    test('Valid Password', () {
      String password = 'asdfasdfsadfasdf';
      expect(passwordValidation(password), null);
    });
    test('InValid Password 1', () {
      String password = 'mple';
      expect(passwordValidation(password), 'the password must be at least 8 characters');
    });
    test('InValid Password 2', () {
      String password = '';
      expect(passwordValidation(password), 'Please Enter This Field');
    });
  });




}
