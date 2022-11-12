import 'package:email_validator/email_validator.dart';

/// emial vaildation takes email
String? emailValidation(var email) {
  return (email.isEmpty) ? 'Please Enter This Field' : (EmailValidator.validate(email)) ? null : 'Not a valid email address';
}

/// username vaildation takes username
String? usernameValidation(var username) {

  return (username.isEmpty)
      ? 'Please Enter This Field'
      :  ((username.length < 3) || (username.length > 20))
      ? 'Username must be between 3 and 20 characters'
      : (!(RegExp(r'^[A-Za-z0-9_-]+$').hasMatch(username)))
          ? 'Letters, numbers, dashes, and underscores only. please try again without symbols.'
          : null;
}

/// password vaildation takes password
String? passwordValidation(var password) {
  return (password.isEmpty)
      ? 'Please Enter This Field'
      :  (password.length >= 8)
      ? null
      : 'the password must be at least 8 characters';
}
