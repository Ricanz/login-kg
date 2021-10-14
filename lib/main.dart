// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:login_app/Screens/Welcome/welcome_screen.dart';
import 'package:login_app/constants.dart';
import 'package:login_app/routes.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Kampus Gratis',
      home: MyApp(),
      theme: ThemeData(
        primaryColor: kBlue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Montserrat',
      )));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      backgroundColor: Colors.white,
      image: Image.asset(
        'assets/images/Bumper-compress.gif',
        alignment: Alignment.bottomCenter,
      ),
      photoSize: 200.0,
      navigateAfterSeconds: WelcomeScreen(),
    );
  }
}

/*
MaterialApp(
onGenerateRoute: RouteGenerator.generateRoute,
debugShowCheckedModeBanner: false,
title: 'Kampus Gratis',
theme: ThemeData(
primaryColor: kBlue,
scaffoldBackgroundColor: Colors.white,
fontFamily: 'Montserrat',
),
home: const WelcomeScreen(),
// home: WelcomeScreen(),
// home: LoginPage(),
// home: Routing(),
);
*/

// class Routing extends StatelessWidget {
//   const Routing({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Kampus Gratis',
//       theme: ThemeData(
//         primaryColor: kBlue,
//         scaffoldBackgroundColor: Colors.white,
//         fontFamily: 'Montserrat',
//       ),
//       home: WelcomeScreen(),
//     );
//   }
// }
