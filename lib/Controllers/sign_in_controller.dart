import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/constants.dart';
import '../models/user_data.dart';
import '../services/authentication_services.dart';

bool mockData = iSMOCK;

/// SignInController for the authentication of user by bare email , google and facebook
class SignInController extends ChangeNotifier {
  /// to get status of signed_in
  bool get isSignedIn => currentUser.userauthentication.isSignedIn;

  /// to get status of error
  bool get hasError => currentUser.userauthentication.hasError;

  /// to get the error code
  String? get errorCode => currentUser.userauthentication.errorCode;

  /// to get the type of the provider
  String? get provider => currentUser.userauthentication.provider;

  /// to get the token
  String? get uid => currentUser.userauthentication.uid;

  /// to get the name
  String? get name => currentUser.userauthentication.name;

  /// to get the user name
  String? get username => currentUser.userauthentication.username;

  /// to get the email
  String? get email => currentUser.userauthentication.email;

  /// to get the gender
  String? get gender => currentUser.userauthentication.gender;

  /// to get the image url
  String? get imageUrl => currentUser.userauthentication.imageUrl;

  /// to get the list
  List<String>? get list => currentUser.userauthentication.list;

  SignInController() {
    checkSignInUser();
  }

  /// login Function
  /// takes the username and password
  /// choose whether to use mock server or backend server
  /// set the error code and status in case of error
  Future logIn(String username, String password) async {
    if (mockData) {
      currentUser.userauthentication.uid = loginBareEmailMock();
      notifyListeners();
      return;
    } else {
      final response = await loginBareEmailAPI(username, password);
      if (response.statusCode == 200) {
        // print(json.decode(response.body)['token']);
        currentUser.userauthentication.uid =
            json.decode(response.body)['token'];
        currentUser.userauthentication.hasError = false;
        setSignIn();
        saveDataToSharedPreferences();
      } else {
        currentUser.userauthentication.hasError = true;
        currentUser.userauthentication.errorCode = 'Error in login';
      }
      notifyListeners();
      return;
    }
  }

  /// signUp Function
  /// takes the username , password and email
  /// choose whether to use mock server or backend server
  /// set the error code and status in case of error
  Future signUp(String email, String username, String password) async {
    if (mockData) {
      currentUser.userauthentication.uid = '1234';
      currentUser.userauthentication.name = 'Ahmed Hany';
      currentUser.userauthentication.email = 'Ahmed@Hany.com';
      currentUser.userauthentication.imageUrl = 'assets/images/defaultuser.png';
      currentUser.userauthentication.provider = 'google';
      currentUser.userauthentication.username = 'Ahmed300';
      notifyListeners();
      return;
    } else {
      final response = await signUpBareEmailAPI(email, username, password);
      if (response.statusCode == 200) {
        // print(json.decode(response.body)['token']);
        currentUser.userauthentication.uid =
            json.decode(response.body)['token'];
        currentUser.userauthentication.hasError = false;
        setSignIn();
        saveDataToSharedPreferences();
      } else {
        currentUser.userauthentication.hasError = true;
        currentUser.userauthentication.errorCode = 'Error in sign in';
      }
      notifyListeners();
      return;
    }
  }

  /// checkSignInUser Function
  /// returns the signed_in status saved in the sharedPreferences
  Future checkSignInUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    currentUser.userauthentication.isSignedIn =
        sharedPreferences.getBool("signed_in") ?? false;
    notifyListeners();
  }

  /// setSignIn Function
  /// sets the signed_in status saved in the sharedPreferences
  Future setSignIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool("signed_in", true);
    currentUser.userauthentication.isSignedIn = true;
    notifyListeners();
  }

  /// saveDataToSharedPreferences Function
  /// save the token in the sharedPreferences
  Future saveDataToSharedPreferences() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString(
        'uid', currentUser.userauthentication.uid!);
    notifyListeners();
  }

  /// getDataFromSharedPreferences Function
  /// get the token from the sharedPreferences
  Future getDataFromSharedPreferences() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    currentUser.userauthentication.uid = sharedPreferences.getString('uid');
    notifyListeners();
  }

  /// checkUserAvailability Function
  /// takes the username and checks whether it is taken or not
  /// choose whether to use mock server or backend server
  /// set the error code and status in case of error
  Future<bool> checkUserAvailability(var usernamechosen) async {
    if (mockData) {
      return checkUserAvailabilityMock();
    } else {
      final response = await checkUserAvailabilityAPI(usernamechosen);
      // print(json.decode(response.body)['response']);
      if (response.statusCode != 200) {
        return false;
      }
      return (json.decode(response.body)['response'] == 'Avaliable');
    }
  }

  /// userSignOut Function
  /// sign out the user form the app
  Future userSignOut() async {
    currentUser.userauthentication.firebaseAuth?.signOut;
    await currentUser.userauthentication.googleSignIn.signOut();
    await currentUser.userauthentication.facebookAuth.logOut();

    currentUser.userauthentication.isSignedIn = false;
    notifyListeners();

    /// clear all storage information
    clearStoredData();
  }

  /// clearStoredData Function
  /// clear sharedPreferences
  Future clearStoredData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  /// sendGender Function
  /// takes the kind and send it
  /// choose whether to use mock server or backend server
  /// set the error code and status in case of error
  Future sendGender(String kind) async {
    if (mockData) {
      currentUser.userauthentication.gender = sendGenderMock();
      notifyListeners();
      return;
    } else {}
  }

  /// sendPhoto Function
  /// takes the user image and send it
  /// choose whether to use mock server or backend server
  /// set the error code and status in case of error
  Future sendPhoto(File imageFile) async {
    if (mockData) {
      currentUser.userauthentication.imageUrl = sendPhotoMock();
      notifyListeners();
      return;
    } else {}
  }

  /// sendUserName Function
  /// takes the UserName and send it
  /// choose whether to use mock server or backend server
  /// set the error code and status in case of error
  Future sendUserName(String username) async {
    if (mockData) {
      currentUser.userauthentication.username = sendUserNameMock();
      notifyListeners();
      return;
    } else {}
  }

  /// forgetPass Function
  /// send forgetPassword request
  /// choose whether to use mock server or backend server
  /// set the error code and status in case of error
  Future forgetPass(String username, String email) async {
    if (mockData) {
      forgetPassMock();
      notifyListeners();
      return;
    } else {}
  }

  /// forgetUsername Function
  /// send forgetUsername request
  /// choose whether to use mock server or backend server
  /// set the error code and status in case of error
  Future forgetUsername(String email) async {
    if (mockData) {
      forgetUsernameMock();
      notifyListeners();
      return;
    } else {}
  }

  /// interest Function
  /// takes the interest of the user and send it
  /// choose whether to use mock server or backend server
  /// set the error code and status in case of error
  Future interest(List<String> list) async {
    if (mockData) {
      currentUser.userauthentication.list = interestMock();
      notifyListeners();
      return;
    } else {}
  }

  /// signInWithGoogle Function
  /// manage the sign in with google and return the token
  /// set the error code and status in case of error
  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await currentUser.userauthentication.googleSignIn.signIn();

    if (googleSignInAccount != null) {
      try {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final User? userDetails = (await currentUser
                .userauthentication.firebaseAuth
                ?.signInWithCredential(credential))
            ?.user!;

        currentUser.userauthentication.name = userDetails?.displayName;

        /// now save all values
        currentUser.userauthentication.name = userDetails?.displayName;
        currentUser.userauthentication.email = userDetails?.email;
        currentUser.userauthentication.imageUrl = userDetails?.photoURL;
        currentUser.userauthentication.provider = "GOOGLE";
        currentUser.userauthentication.uid = userDetails?.uid;
        notifyListeners();
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "account-exists-with-different-credential":
            currentUser.userauthentication.errorCode =
                "You already have an account with us. Use correct provider";
            currentUser.userauthentication.hasError = true;
            notifyListeners();
            break;

          case "null":
            currentUser.userauthentication.errorCode =
                "Some unexpected error while trying to sign in";
            currentUser.userauthentication.hasError = true;
            notifyListeners();
            break;
          default:
            currentUser.userauthentication.errorCode = e.toString();
            currentUser.userauthentication.hasError = true;
            notifyListeners();
        }
      }
    } else {
      currentUser.userauthentication.hasError = true;
      notifyListeners();
    }
  }

  /// signInWithFacebook Function
  /// manage the sign in with facebook and return the token
  /// set the error code and status in case of error
  Future signInWithFacebook() async {
    final LoginResult result =
        await currentUser.userauthentication.facebookAuth.login();

    /// getting the profile
    final graphResponse = facebookapi(result);
    final profile = jsonDecode(graphResponse.body);

    if (result.status == LoginStatus.success) {
      try {
        final OAuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        await currentUser.userauthentication.firebaseAuth
            ?.signInWithCredential(credential);

        /// saving the values
        currentUser.userauthentication.name = profile['name'];
        currentUser.userauthentication.email = profile['email'];
        currentUser.userauthentication.imageUrl =
            profile['picture']['data']['url'];
        currentUser.userauthentication.uid = profile['id'];
        currentUser.userauthentication.hasError = false;
        currentUser.userauthentication.provider = "FACEBOOK";
        notifyListeners();
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "account-exists-with-different-credential":
            currentUser.userauthentication.errorCode =
                "You already have an account with us. Use correct provider";
            currentUser.userauthentication.hasError = true;
            notifyListeners();
            break;

          case "null":
            currentUser.userauthentication.errorCode =
                "Some unexpected error while trying to sign in";
            currentUser.userauthentication.hasError = true;
            notifyListeners();
            break;
          default:
            currentUser.userauthentication.errorCode = e.toString();
            currentUser.userauthentication.hasError = true;
            notifyListeners();
        }
      }
    } else {
      currentUser.userauthentication.hasError = true;
      notifyListeners();
    }
  }
}
