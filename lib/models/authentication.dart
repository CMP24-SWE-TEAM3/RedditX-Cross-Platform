import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

/// this class represents the authentication of the user
/// whether its google or facebook or by email
/// it has the signed_in status and data like token, username , password, profile picture , gender , interest list
class UserAuthentication {
  final FirebaseAuth? firebaseAuth = (kIsWeb) ? null : FirebaseAuth.instance;
  final FacebookAuth facebookAuth = FacebookAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  ///check whether the user is signed_in or not
  bool isSignedIn;

  /// checks whether there is error in the service call or not
  bool hasError;

  /// the definition for the error (erroro message shown to the user)
  String? errorCode;

  /// whether he is signed in with google , facebook or with bare email
  String? provider;

  /// token of the user
  String? uid;

  /// name of the user
  String? name;

  /// username of the user
  String? username;

  /// email of the user
  String? email;

  /// gender of the user
  String? gender;

  /// image url of the user
  String? imageUrl;

  /// list of interest of the user
  List<String>? list;

  UserAuthentication({
    required this.isSignedIn,
    required this.hasError,
  });
}
/// the instant of the UserAuthentication
final UserAuthentication userauthentication =
    UserAuthentication(isSignedIn: false, hasError: false);
