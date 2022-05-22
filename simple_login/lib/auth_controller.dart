import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_login/LoginScreen.dart';
import 'package:simple_login/welcomeScreen.dart';

class AuthController extends GetxController {
  final String snackbarTitleSignUp = "About User";
  final String snackbarMessageSignUp = "User Message";
  final String messageTextSignUp = "Account Creation Failed";
  final String snackbarTitleLogin = "About Login";
  final String snackbarMessageLogin = "Login Message";
  final String messageTextLogin = "Login Failed";

  // AuthController instance
  static AuthController instance = Get.find();
  // email,password
  late Rx<User?> _user;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser); //Casting
    // our user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScren);
  }

  _initialScren(User? user) {
    if (user == null) {
      print("Login Page");
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => WelcomeScreen(
            email: user.email,
          ));
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar(snackbarTitleSignUp, snackbarMessageSignUp,
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText:
              Text(messageTextSignUp, style: TextStyle(color: Colors.white)),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ));
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(snackbarTitleSignUp, snackbarMessageSignUp,
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText:
              Text(messageTextSignUp, style: TextStyle(color: Colors.white)),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ));
    }
  }

  void logOut() async {
    await auth.signOut();
  }
}
