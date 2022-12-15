import 'authentication.dart';

class UserData {
  final UserAuthentication userauthentication = UserAuthentication(isSignedIn: false, hasError: false);
}

UserData currentUser = UserData();