import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/constants.dart';
import '../models/authentication.dart';
import '../models/user_model.dart';
import '../services/authentication_services.dart';

bool mockData = iSMOCK;

/// SignInController for the authentication of user by bare email , google and facebook
class SignInController extends ChangeNotifier {
  /// to get status of signed_in
  bool get isSignedIn => userauthentication.isSignedIn;

  /// to get status of error
  bool get hasError => userauthentication.hasError;

  /// to get the error code
  String? get errorCode => userauthentication.errorCode;

  /// to get the type of the provider
  String? get provider => userauthentication.provider;

  /// to get the token
  String? get uid => userauthentication.uid;

  /// to get the name
  String? get name => userauthentication.name;

  /// to get the user name
  String? get username => userauthentication.username;

  /// to get the email
  String? get email => userauthentication.email;

  /// to get the gender
  String? get gender => userauthentication.gender;

  /// to get the image url
  String? get imageUrl => userauthentication.imageUrl;

  /// to get the list
  List<String>? get list => userauthentication.list;

  SignInController() {
    checkSignInUser();
  }

  /// fillUser Function
  /// takes the [username]
  /// fill the usermodel for the documentation
  Future fillUser(String username) async {
    final response = await getuserdataAPI('t2_$username');
    if (response.statusCode == 200) {
      var map = json.decode(response.body)['about']['user'];
      if (map != null) {
        currentUser!.username = username;
        currentUser!.avatar = map['avatar'];
        currentUser!.userPrefs.prefShowTrending = map['prefShowTrending'];
        currentUser!.canCreateSubreddit = map['canCreateSubreddit'];
        currentUser!.userPrefs.over18 = map['over18'];
        currentUser!.hasVerifiedEmail = map['hasVerifiedEmail'];
        currentUser!.createdAt = DateTime.parse(map['createdAt']);
        currentUser!.inboxCount = map['inboxCount'];
        currentUser!.karma = map['totalKarma'];
        currentUser!.postKarma = map['linkKarma'];
        currentUser!.userPrefs.enableFollowers = map['acceptFollowers'];
        currentUser!.commentKarma = map['commentKarma'];
        currentUser!.isPasswordSet = map['passwordSet'];
        currentUser!.email = map['email'];
        currentUser!.about = map['about'];
        saveDataToSharedPreferences();
      } else {
        userauthentication.hasError = true;
        userauthentication.errorCode = 'Error in getting User';
      }
    } else {
      userauthentication.hasError = true;
      userauthentication.errorCode = 'Error in getting User';
    }
    notifyListeners();
    return;
  }

  /// login Function
  /// takes the username and password
  /// choose whether to use mock server or backend server
  /// set the error code and status in case of error
  Future logIn(String username, String password) async {
    if (mockData) {
      userauthentication.uid = loginBareEmailMock();
      setSignIn();
      saveDataToSharedPreferences();
      notifyListeners();
      return;
    } else {
      final response = await loginBareEmailAPI('t2_$username', password);
      if (response.statusCode == 200) {
        // print(json.decode(response.body)['token']);
        userauthentication.uid = json.decode(response.body)['token'];
        userauthentication.username = json.decode(response.body)['username'];
        userauthentication.hasError = false;
        userauthentication.username = username;
        fillUser(username);
        setSignIn();
        saveDataToSharedPreferences();
      } else {
        userauthentication.hasError = true;
        userauthentication.errorCode = 'Error in login';
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
      userauthentication.uid = loginBareEmailMock();
      setSignIn();
      saveDataToSharedPreferences();
      notifyListeners();
      return;
    } else {
      final response =
          await signUpBareEmailAPI(email, 't2_$username', password);
      if (response.statusCode == 200) {
        // print(json.decode(response.body)['token']);
        userauthentication.uid = json.decode(response.body)['token'];
        userauthentication.username = json.decode(response.body)['username'];
        userauthentication.hasError = false;
        fillUser(username);
        setSignIn();
        saveDataToSharedPreferences();
      } else {
        userauthentication.hasError = true;
        userauthentication.errorCode = 'Error in sign up';
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
    userauthentication.isSignedIn =
        sharedPreferences.getBool("signed_in") ?? false;
    notifyListeners();
  }

  /// setSignIn Function
  /// sets the signed_in status saved in the sharedPreferences
  Future setSignIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool("signed_in", true);
    userauthentication.isSignedIn = true;
    notifyListeners();
  }

  /// saveDataToSharedPreferences Function
  /// save the token in the sharedPreferences
  Future saveDataToSharedPreferences() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString('uid', userauthentication.uid!);
    //save user model
    await sharedPreferences.setString(
        'username', currentUser!.username ?? 'guest');
    await sharedPreferences.setString(
        'UserModel_avatar',
        currentUser!.avatar ??
            'https://www.iconpacks.net/icons/2/free-reddit-logo-icon-2436-thumb.png');
    await sharedPreferences.setBool('UserModel_prefShowTrending',
        currentUser!.userPrefs.prefShowTrending ?? false);
    await sharedPreferences.setBool('UserModel_canCreateSubreddit',
        currentUser!.userPrefs.canCreateSubreddit ?? false);
    await sharedPreferences.setBool(
        'UserModel_over18', currentUser!.over18 ?? false);
    await sharedPreferences.setBool(
        'UserModel_hasVerifiedEmail', currentUser!.hasVerifiedEmail ?? false);
    await sharedPreferences.setString(
        'UserModel_createdAt', currentUser!.createdAt!.toString());
    await sharedPreferences.setInt(
        'UserModel_totalKarma', currentUser!.karma ?? 0);
    await sharedPreferences.setInt(
        'UserModel_linkKarma', currentUser!.postKarma ?? 0);
    await sharedPreferences.setBool('UserModel_acceptFollowers',
        currentUser!.userPrefs.enableFollowers ?? false);
    await sharedPreferences.setInt(
        'UserModel_commentKarma', currentUser!.commentKarma ?? 0);
    await sharedPreferences.setBool(
        'UserModel_passwordSet', currentUser!.isPasswordSet!);
    await sharedPreferences.setString('UserModel_email', currentUser!.email!);
    await sharedPreferences.setString(
        'UserModel_about', currentUser!.about ?? "A redditor");

    notifyListeners();
  }

  /// getDataFromSharedPreferences Function
  /// get the token from the sharedPreferences
  Future getDataFromSharedPreferences() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    userauthentication.uid = sharedPreferences.getString('uid');
    // get the user model
    currentUser!.username = sharedPreferences.getString('username');
    currentUser!.avatar = sharedPreferences.getString('UserModel_avatar');
    currentUser!.userPrefs.prefShowTrending =
        sharedPreferences.getBool('UserModel_prefShowTrending');
    currentUser!.canCreateSubreddit =
        sharedPreferences.getBool('UserModel_canCreateSubreddit');
    currentUser!.userPrefs.over18 =
        sharedPreferences.getBool('UserModel_over18');
    currentUser!.hasVerifiedEmail =
        sharedPreferences.getBool('UserModel_hasVerifiedEmail');
    currentUser!.createdAt = DateTime.parse(
        sharedPreferences.getString('UserModel_createdAt') ??
            '2022-12-15 00:00:00.000');
    currentUser!.postKarma = sharedPreferences.getInt('UserModel_totalKarma');
    currentUser!.postKarma = sharedPreferences.getInt('UserModel_linkKarma');
    currentUser!.userPrefs.enableFollowers =
        sharedPreferences.getBool('UserModel_acceptFollowers');
    currentUser!.commentKarma =
        sharedPreferences.getInt('UserModel_commentKarma');
    currentUser!.isPasswordSet =
        sharedPreferences.getBool('UserModel_passwordSet');
    currentUser!.email = sharedPreferences.getString('UserModel_email');
    currentUser!.about = sharedPreferences.getString('UserModel_about');
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
      final response = await checkUserAvailabilityAPI('t2_$usernamechosen');
      if (response.statusCode != 200) {
        return false;
      }
      bool available = (json.decode(response.body)['response'] == 'Available');
      return available;
    }
  }

  /// userSignOut Function
  /// sign out the user form the app
  Future userSignOut() async {
    //  userauthentication.firebaseAuth?.signOut;
    await userauthentication.googleSignIn.signOut();
    // await  userauthentication.googleSignIn.disconnect();
    await userauthentication.facebookAuth.logOut();

    userauthentication.isSignedIn = false;
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
      userauthentication.gender = sendGenderMock();
      notifyListeners();
      return;
    } else {
      final response = await sendGenderApi(kind);
      if (response.statusCode == 200) {
        userauthentication.hasError = false;
      } else {
        userauthentication.hasError = true;
        userauthentication.errorCode = 'Error in sending Sendign Gender';
      }
      notifyListeners();
      return;
    }
  }

  /// sendPhoto Function
  /// takes the user image and send it
  /// choose whether to use mock server or backend server
  /// set the error code and status in case of error
  Future sendPhoto(File imageFile) async {
    if (mockData) {
      userauthentication.imageUrl = sendPhotoMock();
      notifyListeners();
      return;
    } else {
      final response = await uploadUserPhoto(imageFile);
      if (response.statusCode == 200) {
        var photoNameBody = response.data;
        String name = photoNameBody['avatar'];

        userauthentication.imageUrl =
            'https://api.redditswe22.tech/users/files/$name';
        userauthentication.hasError = false;
        setSignIn();
        saveDataToSharedPreferences();
      } else {
        userauthentication.hasError = true;
        userauthentication.errorCode = 'Error in uploading Picture';
      }
      notifyListeners();
      return;
    }
  }

  /// sendUserName Function
  /// takes the UserName and send it
  /// choose whether to use mock server or backend server
  /// set the error code and status in case of error
  Future sendUserName(String username) async {
    if (mockData) {
      userauthentication.username = sendUserNameMock();
      notifyListeners();
      return;
    } else {
      final response = await sendUserNameApi(username);
      if (response.statusCode == 200) {
        userauthentication.hasError = false;
      } else {
        userauthentication.hasError = true;
        userauthentication.errorCode = 'Error in sending Sendign User Name';
      }
      notifyListeners();
      return;
    }
  }

  /// forgetPass Function
  /// send forgetPassword request
  /// choose whether to use mock server or backend server
  /// set the error code and status in case of error
  Future forgetPass(String email, String username) async {
    if (mockData) {
      forgetPassMock();
      notifyListeners();
      return;
    } else {
      final response = await forgetpassApi(email, 't2_$username');
      if (response.statusCode == 200) {
        userauthentication.hasError = false;
      } else {
        userauthentication.hasError = true;
        userauthentication.errorCode =
            'Error in sending Forget Password request';
      }
      notifyListeners();
      return;
    }
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
    } else {
      final response = await forgetuseranameApi(email);
      if (response.statusCode == 200) {
        userauthentication.hasError = false;
      } else {
        userauthentication.hasError = true;
        userauthentication.errorCode =
            'Error in sending Forget UserName request';
      }
      notifyListeners();
      return;
    }
  }

  /// interest Function
  /// takes the interest of the user and send it
  /// choose whether to use mock server or backend server
  /// set the error code and status in case of error
  Future interest(List<String> list) async {
    if (mockData) {
      userauthentication.list = interestMock();
      notifyListeners();
      return;
    } else {
      final response = await interestApi(list);
      if (response.statusCode == 200) {
        userauthentication.hasError = false;
      } else {
        userauthentication.hasError = true;
        userauthentication.errorCode = 'Error in sending Interest';
      }
      notifyListeners();
      return;
    }
  }

  /// signInWithGoogle Function
  /// manage the sign in with google and return the token
  /// set the error code and status in case of error
  Future signInWithGoogle() async {
    // await userauthentication.googleSignIn.signOut();
    // await userauthentication.googleSignIn.disconnect();

    final GoogleSignInAccount? googleSignInAccount =
        await userauthentication.googleSignIn.signIn();

    if (googleSignInAccount != null) {
      try {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        // final AuthCredential credential = GoogleAuthProvider.credential(
        //   accessToken: googleSignInAuthentication.accessToken,
        //   idToken: googleSignInAuthentication.idToken,
        // );
        // print(googleSignInAuthentication);
        // print(credential.accessToken);
        //final User? userDetails = (await userauthentication.firebaseAuth?.signInWithCredential(credential))?.user!;

        /// now save all values
        //  userauthentication.name = userDetails?.displayName;
        //  userauthentication.email = userDetails?.email;
        //  userauthentication.imageUrl = userDetails?.photoURL;
        //  userauthentication.provider = "GOOGLE";
        // userauthentication.uid = userDetails?.uid;

        String? uidGoogle = googleSignInAuthentication.idToken;
        final response = await loginGoogleEmailAPI(uidGoogle!);
        if (response.statusCode == 200) {
          // print(json.decode(response.body)['token']);
          userauthentication.uid = json.decode(response.body)['token'];
          userauthentication.username = json.decode(response.body)['username'];
          userauthentication.hasError = false;
          fillUser(userauthentication.username!);
          setSignIn();
          saveDataToSharedPreferences();
        } else {
          userauthentication.hasError = true;
          userauthentication.errorCode = 'Error in sign up';
          // print(response.body);
        }
        notifyListeners();
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "account-exists-with-different-credential":
            userauthentication.errorCode =
                "You already have an account with us. Use correct provider";
            userauthentication.hasError = true;
            notifyListeners();
            break;

          case "null":
            userauthentication.errorCode =
                "Some unexpected error while trying to sign in";
            userauthentication.hasError = true;
            notifyListeners();
            break;
          default:
            userauthentication.errorCode = e.toString();
            userauthentication.hasError = true;
            notifyListeners();
        }
      }
    } else {
      userauthentication.hasError = true;
      notifyListeners();
    }
  }

  /// signInWithFacebook Function
  /// manage the sign in with facebook and return the token
  /// set the error code and status in case of error
  Future signInWithFacebook() async {
    final LoginResult result = await userauthentication.facebookAuth.login();

    /// getting the profile
    final graphResponse = facebookapi(result);
    final profile = jsonDecode(graphResponse.body);

    if (result.status == LoginStatus.success) {
      try {
        final OAuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        await userauthentication.firebaseAuth?.signInWithCredential(credential);

        // /// saving the values
        //  userauthentication.name = profile['name'];
        //  userauthentication.email = profile['email'];
        //  userauthentication.imageUrl =
        //     profile['picture']['data']['url'];
        // userauthentication.uid = profile['id'];
        //  userauthentication.hasError = false;
        //  userauthentication.provider = "FACEBOOK";
        // notifyListeners();
        final response = await loginFacebookEmailAPI(profile['id']);
        if (response.statusCode == 200) {
          // print(json.decode(response.body)['token']);
          userauthentication.uid = json.decode(response.body)['token'];
          userauthentication.username = json.decode(response.body)['username'];
          userauthentication.hasError = false;
          fillUser(userauthentication.username!);
          setSignIn();
          saveDataToSharedPreferences();
        } else {
          userauthentication.hasError = true;
          userauthentication.errorCode = 'Error in sign up';
        }
        notifyListeners();
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "account-exists-with-different-credential":
            userauthentication.errorCode =
                "You already have an account with us. Use correct provider";
            userauthentication.hasError = true;
            notifyListeners();
            break;

          case "null":
            userauthentication.errorCode =
                "Some unexpected error while trying to sign in";
            userauthentication.hasError = true;
            notifyListeners();
            break;
          default:
            userauthentication.errorCode = e.toString();
            userauthentication.hasError = true;
            notifyListeners();
        }
      }
    } else {
      userauthentication.hasError = true;
      notifyListeners();
    }
  }
}
