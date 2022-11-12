import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../config/constants.dart';

bool mockData = iSMOCK;

class SignInController extends ChangeNotifier {
  final FirebaseAuth? firebaseAuth = (kIsWeb) ? null : FirebaseAuth.instance;
  final FacebookAuth facebookAuth = FacebookAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  bool _hasError = false;
  bool get hasError => _hasError;

  String? _errorCode;
  String? get errorCode => _errorCode;

  String? _provider;
  String? get provider => _provider;

  String? _uid;
  String? get uid => _uid;

  String? _name;
  String? get name => _name;

  String? _username;
  String? get username => _username;

  String? _email;
  String? get email => _email;

  String? _gender;
  String? get gender => _gender;

  String? _imageUrl;
  String? get imageUrl => _imageUrl;

  List<String>? _list;
  List<String>? get list => _list;

  SignInController() {
    checkSignInUser();
  }

  Future checkSignInUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _isSignedIn = sharedPreferences.getBool("signed_in") ?? false;
    notifyListeners();
  }

  Future setSignIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool("signed_in", true);
    _isSignedIn = true;
    notifyListeners();
  }

  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      try {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final User? userDetails =
            (await firebaseAuth?.signInWithCredential(credential))?.user!;

        _name = userDetails?.displayName;
        // now save all values
        _name = userDetails?.displayName;
        _email = userDetails?.email;
        _imageUrl = userDetails?.photoURL;
        _provider = "GOOGLE";
        _uid = userDetails?.uid;
        notifyListeners();
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "account-exists-with-different-credential":
            _errorCode =
                "You already have an account with us. Use correct provider";
            _hasError = true;
            notifyListeners();
            break;

          case "null":
            _errorCode = "Some unexpected error while trying to sign in";
            _hasError = true;
            notifyListeners();
            break;
          default:
            _errorCode = e.toString();
            _hasError = true;
            notifyListeners();
        }
      }
    } else {
      _hasError = true;
      notifyListeners();
    }
  }

  Future signInWithFacebook() async {
    final LoginResult result = await facebookAuth.login();
    // getting the profile
    final graphResponse = await http.get(Uri.parse(
        'https://graph.facebook.com/v2.12/me?fields=name,picture.width(800).height(800),first_name,last_name,email&access_token=${result.accessToken!.token}'));

    final profile = jsonDecode(graphResponse.body);

    if (result.status == LoginStatus.success) {
      try {
        final OAuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        await firebaseAuth?.signInWithCredential(credential);
        // saving the values
        _name = profile['name'];
        _email = profile['email'];
        _imageUrl = profile['picture']['data']['url'];
        _uid = profile['id'];
        _hasError = false;
        _provider = "FACEBOOK";
        notifyListeners();
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "account-exists-with-different-credential":
            _errorCode =
                "You already have an account with us. Use correct provider";
            _hasError = true;
            notifyListeners();
            break;

          case "null":
            _errorCode = "Some unexpected error while trying to sign in";
            _hasError = true;
            notifyListeners();
            break;
          default:
            _errorCode = e.toString();
            _hasError = true;
            notifyListeners();
        }
      }
    } else {
      _hasError = true;
      notifyListeners();
    }
  }

  // ENTRY FOR CLOUDFIRESTORE
  Future getUserDataFromDataBase(uid) async {
    if (mockData) {
      _uid = '1234';
      _name = 'Ahmed Hany';
      _email = 'Ahmed@Hany.com';
      _imageUrl = 'assets/images/defaultuser.png';
      _provider = 'google';
    } else {
      // Call BackEnd
    }
  }

  Future saveDataToDataBase() async {
    if (mockData) {
      return;
    } else {
      // send to BackEnd
    }
    notifyListeners();
  }

  Future saveDataToSharedPreferences() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString('name', _name!);
    await sharedPreferences.setString('email', _email!);
    await sharedPreferences.setString('uid', _uid!);
    await sharedPreferences.setString('image_url', _imageUrl!);
    await sharedPreferences.setString('provider', _provider!);
    notifyListeners();
  }

  Future getDataFromSharedPreferences() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _name = sharedPreferences.getString('name');
    _email = sharedPreferences.getString('email');
    _imageUrl = sharedPreferences.getString('image_url');
    _uid = sharedPreferences.getString('uid');
    _provider = sharedPreferences.getString('provider');
    notifyListeners();
  }

  // checkUser exists or not in cloudfirestore
  Future<bool> checkUserExists() async {
    if (mockData) {
      return false;
    } else {
      bool result = false;
      // check back end
      return result;
    }
  }

  // signout
  Future userSignOut() async {
    firebaseAuth?.signOut;
    await googleSignIn.signOut();
    await facebookAuth.logOut();

    _isSignedIn = false;
    notifyListeners();
    // clear all storage information
    clearStoredData();
  }

  Future clearStoredData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  Future sendGender(String kind) async {
    if (mockData) {
      _gender = 'man';
      notifyListeners();
      return;
    }
    try {
      // send Data to Back End
      notifyListeners();
    } on FirebaseAuthException catch (_) {
      _errorCode = "Error while sending gender";
      _hasError = true;
      notifyListeners();
    }
  }

  Future sendPhoto(File imageFile) async {
    if (mockData) {
      _imageUrl =
          'https://www.shutterstock.com/image-photo/head-shot-portrait-close-smiling-600w-1714666150.jpg';
      notifyListeners();
      return;
    }
    try {
      // send Data to Back End
      notifyListeners();
    } on FirebaseAuthException catch (_) {
      _errorCode = "Error while sending Photo";
      _hasError = true;
      notifyListeners();
    }
  }

  Future sendUserName(String username) async {
    if (mockData) {
      _username = 'Ahmed300';
      notifyListeners();
      return;
    }
    try {
      // send Data to Back End
      notifyListeners();
    } on FirebaseAuthException catch (_) {
      _errorCode = "Error while sending User-Name";
      _hasError = true;
      notifyListeners();
    }
  }

  Future logIn(String username, String password) async {
    if (mockData) {
      _uid = '1234';
      _name = 'Ahmed Hany';
      _email = 'Ahmed@Hany.com';
      _imageUrl = 'assets/images/defaultuser.png';
      _provider = 'google';
      _username = 'Ahmed300';
      notifyListeners();
      return;
    }
    try {
      // send Data to Back End
      notifyListeners();
    } on FirebaseAuthException catch (_) {
      _errorCode = "Error while Login";
      _hasError = true;
      notifyListeners();
    }
  }

  Future signUp(String email, String username, String password) async {
    if (mockData) {
      _uid = '1234';
      _name = 'Ahmed Hany';
      _email = 'Ahmed@Hany.com';
      _provider = 'bare email';
      _username = 'Ahmed300';
      notifyListeners();
      return;
    }
    try {
      // send Data to Back End
      notifyListeners();
    } on FirebaseAuthException catch (_) {
      _errorCode = "Error while SignUp";
      _hasError = true;
      notifyListeners();
    }
  }

  Future forgetPass(String username, String email) async {
    if (mockData) {
      notifyListeners();
      return;
    }
    try {
      // send Data to Back End
      notifyListeners();
    } on FirebaseAuthException catch (_) {
      _errorCode = "Error while sending email of reseting password";
      _hasError = true;
      notifyListeners();
    }
  }

  Future forgetUsername(String email) async {
    if (mockData) {
      notifyListeners();
      return;
    }
    try {
      // send Data to Back End
      notifyListeners();
    } on FirebaseAuthException catch (_) {
      _errorCode = "Error while sending email of reseting username";
      _hasError = true;
      notifyListeners();
    }
  }

  Future interest(List<String> list) async {
    if (mockData) {
      _list = ['Career', 'Lifehacks', 'Funny', 'Interesting', 'Jokes'];
      notifyListeners();
      return;
    }
    try {
      // send Data to Back End
      notifyListeners();
    } on FirebaseAuthException catch (_) {
      _errorCode = "Error while setting interest";
      _hasError = true;
      notifyListeners();
    }
  }

  checkInternetConnection() {}
}
