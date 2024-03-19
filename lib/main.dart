import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp_app_dev/auth/login.dart';
import 'package:gp_app_dev/auth/signup.dart';
import 'package:gp_app_dev/consist/Header.dart';
import 'package:gp_app_dev/consist/NavigationBar.dart';
import 'package:gp_app_dev/library/content.dart';
import 'package:gp_app_dev/profile/profilepage.dart';
import 'package:gp_app_dev/startpages/share_progress.dart';
import 'package:gp_app_dev/startpages/homepage.dart';
import 'package:gp_app_dev/startpages/welcome.dart';
import 'package:gp_app_dev/subscription/payment-.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthenticationWrapper(),
      routes: {
        "signup": (context) => const SignUp(),
        "login": (context) => const Login(),
        "welcome": (context) => const Welcome(),
        //"homepage": (context) => const Homepage(),
        "payment": (context) => newPaymentScene(),
        "content": (context) => const Content(),
        "profilepage": (context) => Profilepage(),
        "share_progress": (context) => ShareProgress(),
        "NavigationBarApp": (context) => const NavigationBarApp(),
      },
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final bool isLoggedIn = user != null && user.emailVerified;

    if (isLoggedIn) {
      // Return NavigationBarApp directly instead of navigating here
      return const NavigationBarApp();
    } else {
      return const Welcome();
    }
  }
}
