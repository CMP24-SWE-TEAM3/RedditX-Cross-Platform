import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../views/screens/authentication/about_you.dart';
import '../views/screens/authentication/choose_profilepicture.dart';
import '../views/screens/authentication/choose_username.dart';
import '../views/screens/authentication/interests.dart';
import '../views/screens/temphome.dart';
import '../views/widgets/authentication/show_snackbar.dart';
import 'internet_controller.dart';
import 'sign_in_controller.dart';

/// submitAboutyou Function
///this function takes the [kind] and the context [ctx] of the page and send the gender to the controller and check for the result to show the error
Future<void> submitAboutyou(String kind, ctx) async {
  final mediaQuery = MediaQuery.of(ctx);
  final widthScreen = (mediaQuery.size.width);
  final heightScreen = (mediaQuery.size.height - mediaQuery.padding.top);
  // set up the AlertDialog
  AlertDialog interestPage = AlertDialog(
    content: Container(
      width: widthScreen * 0.4,
      height: heightScreen * 0.73,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      child: const Interests(),
    ),
  );

  final sp = Provider.of<SignInController>(ctx, listen: false);
  final ip = Provider.of<InternetController>(ctx, listen: false);
  await ip.checkInternetConnection();

  if (ip.hasInternet == false) {
    // ignore: use_build_context_synchronously
    showSnackBar("Check your Internet connection", ctx);
  } else {
    await sp.sendGender(kind).then((value) {
      if (sp.hasError == true) {
        showSnackBar(sp.errorCode.toString(), ctx);
      }
    });
  }

  (kIsWeb)
      ? showDialog(
          context: ctx,
          builder: (BuildContext context) {
            return interestPage;
          },
        )
      : Navigator.of(ctx)
          .pushReplacementNamed(Interests.routeName, arguments: {});
}

/// submitPhoto Function
///this function takes the [photo] and the [context] of the page and send the photo to the controller and check for the result to show the error
Future<void> submitPhoto(photo, context) async {
  final sp = Provider.of<SignInController>(context, listen: false);
  final ip = Provider.of<InternetController>(context, listen: false);
  await ip.checkInternetConnection();

  if (ip.hasInternet == false) {
    // ignore: use_build_context_synchronously
    showSnackBar("Check your Internet connection", context);
  } else {
    await sp.sendPhoto(photo!).then((value) {
      if (sp.hasError == true) {
        showSnackBar(sp.errorCode.toString(), context);
      }
    });
  }
}

/// submitUserName Function
///this function takes the [username] and the [context] of the page and send the username to the controller and check for the result to show the error
Future<void> submitUserName(String username, context) async {
  final sp = Provider.of<SignInController>(context, listen: false);
  final ip = Provider.of<InternetController>(context, listen: false);
  await ip.checkInternetConnection();

  if (ip.hasInternet == false) {
    // ignore: use_build_context_synchronously
    showSnackBar("Check your Internet connection", context);
  } else {
    await sp.sendUserName(username).then((value) {
      if (sp.hasError == true) {
        showSnackBar(sp.errorCode.toString(), context);
      }
    });
  }

  Navigator.of(context)
      .pushReplacementNamed(ChooseProfilePicture.routeName, arguments: {});
}

/// submitlogin Function
///this function takes the [username], [password] and the [context] of the page and send the username and password to the controller and check for the result to show the error
Future<void> submitlogin(
    userNameController, passwordController, context) async {
  final sp = Provider.of<SignInController>(context, listen: false);
  final ip = Provider.of<InternetController>(context, listen: false);
  await ip.checkInternetConnection();

  if (ip.hasInternet == false) {
    // ignore: use_build_context_synchronously
    showSnackBar("Check your Internet connection", context);
  } else {
    await sp
        .logIn(userNameController.text, passwordController.text)
        .then((value) {
      if (sp.hasError == true) {
        showSnackBar(sp.errorCode.toString(), context);
      }
    });
  }
  if (sp.hasError == false) {
    (kIsWeb) ? null : Navigator.of(context).pop();
    Navigator.of(context).pushReplacementNamed(Home.routeName, arguments: {});
  } else {
    // ignore: use_build_context_synchronously
    (kIsWeb) ? null : showSnackBar('incorrect username or password', context);
  }
}

/// submitSignup Function
///this function takes the [email], [username], [password] and the [context] of the page and send the email, username and password to the controller and check for the result to show the error
Future<void> submitSignup(
    emailController, userNameController, passwordController, context) async {
  final sp = Provider.of<SignInController>(context, listen: false);
  final ip = Provider.of<InternetController>(context, listen: false);
  await ip.checkInternetConnection();

  if (ip.hasInternet == false) {
    // ignore: use_build_context_synchronously
    showSnackBar("Check your Internet connection", context);
  } else {
    await sp
        .signUp(emailController.text, userNameController.text,
            passwordController.text)
        .then((value) {
      if (sp.hasError == true) {
        showSnackBar(sp.errorCode.toString(), context);
      }
    });
  }
  (kIsWeb)
      ? Navigator.of(context)
          .pushReplacementNamed(Home.routeName, arguments: {})
      : Navigator.of(context)
          .pushReplacementNamed(AboutYou.routeName, arguments: {});
}

/// resetPass Function
///this function takes the [username], [password] and the [context] of the page and send the username and password to the controller to request password reset and check for the result to show the error
Future<void> resetPass(emailController, userNameController, context) async {
  final sp = Provider.of<SignInController>(context, listen: false);
  final ip = Provider.of<InternetController>(context, listen: false);
  await ip.checkInternetConnection();

  if (ip.hasInternet == false) {
    // ignore: use_build_context_synchronously
    showSnackBar("Check your Internet connection", context);
  } else {
    await sp
        .forgetPass(
      emailController.text,
      userNameController.text,
    )
        .then((value) {
      if (sp.hasError == true) {
        showSnackBar(sp.errorCode.toString(), context);
        return;
      }
    });
  }
  (kIsWeb) ? null : showSnackBar('You will recieve an email soon', context);
}

/// resetUsername Function
///this function takes the [email] and the [context] of the page and send the email to the controller to request password reset and check for the result to show the error
Future<void> resetUsername(emailController, context) async {
  final sp = Provider.of<SignInController>(context, listen: false);
  final ip = Provider.of<InternetController>(context, listen: false);
  await ip.checkInternetConnection();

  if (ip.hasInternet == false) {
    // ignore: use_build_context_synchronously
    showSnackBar("Check your Internet connection", context);
  } else {
    await sp.forgetUsername(emailController.text).then((value) {
      if (sp.hasError == true) {
        showSnackBar(sp.errorCode.toString(), context);
      }
    });
  }
  (kIsWeb) ? null : showSnackBar('You will recieve an email soon', context);
}
/// submitInterest Function
///this function takes the [interest] and the [context] of the page and send the interest to the controller and check for the result to show the error
Future<void> submitInterest(List<String> list, context) async {
  final sp = Provider.of<SignInController>(context, listen: false);
  final ip = Provider.of<InternetController>(context, listen: false);
  await ip.checkInternetConnection();

  if (ip.hasInternet == false) {
    // ignore: use_build_context_synchronously
    showSnackBar("Check your Internet connection", context);
  } else {
    await sp.interest(list).then((value) {
      if (sp.hasError == true) {
        showSnackBar(sp.errorCode.toString(), context);
      }
    });
  }
  if (sp.username != null && (!kIsWeb)) {
    Navigator.of(context)
        .pushReplacementNamed(ChooseProfilePicture.routeName, arguments: {});
  } else {
    final mediaQuery = MediaQuery.of(context);
    final widthScreen = (mediaQuery.size.width);
    final heightScreen = (mediaQuery.size.height - mediaQuery.padding.top);
    // set up the AlertDialog
    AlertDialog profilePicturePage = AlertDialog(
      content: Container(
        width: widthScreen * 0.4,
        height: heightScreen * 0.73,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        child: const ChooseProfilePicture(),
      ),
    );
    (kIsWeb)
        ? showDialog(
            context: context,
            builder: (BuildContext context) {
              return profilePicturePage;
            },
          )
        : Navigator.of(context).pushReplacementNamed(
            ChooseProfilePicture.routeName,
            arguments: {});
    //.pushReplacementNamed(ChooseUserName.routeName, arguments: {});
  }
}

/// handling google sigin in
/// hanle google sign in by requesting the function of sign in with google in the controller and check for the result to show the error
Future handleGoogleSignIn(context) async {
  final sp = Provider.of<SignInController>(context, listen: false);
  final ip = Provider.of<InternetController>(context, listen: false);
  await ip.checkInternetConnection();

  if (ip.hasInternet == false) {
    // ignore: use_build_context_synchronously
    showSnackBar("Check your Internet connection", context);
  } else {
    await sp.signInWithGoogle().then((value) {
      if (sp.hasError == true) {
        showSnackBar(sp.errorCode.toString(), context);
        return;
      }
    });
  }
  (kIsWeb) ? null : Navigator.of(context).pop();
  (kIsWeb)
      ? Navigator.of(context)
          .pushReplacementNamed(Home.routeName, arguments: {})
      : Navigator.of(context)
          .pushReplacementNamed(ChooseUserName.routeName, arguments: {});
}

// handling facebookauth
/// hanle facebook sign in by requesting the function of sign in with facebook in the controller and check for the result to show the error
Future handleFacebookAuth(context) async {
  final sp = Provider.of<SignInController>(context, listen: false);
  final ip = Provider.of<InternetController>(context, listen: false);
  await ip.checkInternetConnection();

  if (ip.hasInternet == false) {
    // ignore: use_build_context_synchronously
    showSnackBar("Check your Internet connection", context);
    // facebookController.reset();
  } else {
    await sp.signInWithFacebook().then((value) {
      if (sp.hasError == true) {
        showSnackBar(sp.errorCode.toString(), context);
        return;
      }
    });
  }
  (kIsWeb) ? null : Navigator.of(context).pop();
  (kIsWeb)
      ? Navigator.of(context)
          .pushReplacementNamed(Home.routeName, arguments: {})
      : Navigator.of(context)
          .pushReplacementNamed(ChooseUserName.routeName, arguments: {});
}

/// handle after signin
/// to push the screen of home after sign in
handleAfterSignIn(context) {
  Future.delayed(const Duration(milliseconds: 1000)).then((value) {
    Navigator.of(context).pushReplacementNamed(Home.routeName, arguments: {});
  });
}
