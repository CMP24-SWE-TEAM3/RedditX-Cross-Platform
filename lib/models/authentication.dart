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

  bool isSignedIn;

  bool hasError;

  String? errorCode;

  String? provider;

  String? uid;

  String? name;

  String? username;

  String? email;

  String? gender;

  String? imageUrl;

  List<String>? list;

  UserAuthentication({
    required this.isSignedIn,
    required this.hasError,
  });
}