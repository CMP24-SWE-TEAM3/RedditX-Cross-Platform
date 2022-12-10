import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

import 'sign_in_controller.dart';

/// emial vaildation takes email
/// check that if the email is valid or not
/// return null in case of valid and error message in case of error
String? emailValidation(var email) {
  return (email.isEmpty)
      ? 'Please Enter This Field'
      : (EmailValidator.validate(email))
          ? null
          : 'Not a valid email address';
}

/// username vaildation takes username
/// check that if the username is valid or not and is taken or not
/// return null in case of valid and error message in case of error
Future<String?> usernameValidation(var username, context) async {
  final signInController =
      Provider.of<SignInController>(context, listen: false);
  bool avaliable = await signInController.checkUserAvailability(username);
  // print(avaliable);
  String? check1 = usernameValidationinternal(username);
  if (check1 == null) {
    if (avaliable) {
      return null;
    } else {
      return 'username is already taken';
    }
  } else {
    return check1;
  }
}

/// check that the length of the username and characters are valid
///check that if the username is valid or not
/// return null in case of valid and error message in case of error
usernameValidationinternal(var username) {
  return (username.isEmpty)
      ? 'Please Enter This Field'
      : ((username.length < 3) || (username.length > 20))
          ? 'Username must be between 3 and 20 characters'
          : (!(RegExp(r'^[A-Za-z0-9_-]+$').hasMatch(username)))
              ? 'Letters, numbers, dashes, and underscores only. please try again without symbols.'
              : null;
}

/// password vaildation takes password
/// checks for the length of the password
/// return null in case of valid and error message in case of error
String? passwordValidation(var password) {
  return (password.isEmpty)
      ? 'Please Enter This Field'
      : (password.length >= 8)
          ? null
          : 'the password must be at least 8 characters';
}