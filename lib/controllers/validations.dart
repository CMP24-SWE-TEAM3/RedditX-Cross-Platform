import 'package:email_validator/email_validator.dart';

String? emailValidation(var email) {
  return (email.isEmpty)
      ? 'Please Enter This Field'
      : (EmailValidator.validate(email))
          ? null
          : 'Not a valid email address';
}

String? usernameValidation(var username) {
//will be replaced with API
  bool isTaken = false;

  return (username.isEmpty)
      ? 'Please Enter This Field'
      : ((username.length < 3) || (username.length > 20))
          ? 'Username must be between 3 and 20 characters'
          : (!(RegExp(r'^[A-Za-z0-9_-]+$').hasMatch(username)))
              ? 'Letters, numbers, dashes, and underscores only. please try again without symbols.'
              : (isTaken)
                  // ignore: dead_code
                  ? 'That username is already taken'
                  : null;
}

String? passwordValidation(var password) {
  return (password.isEmpty)
      ? 'Please Enter This Field'
      : (password.length >= 8)
          ? null
          : 'the password must be at least 8 characters';
}
