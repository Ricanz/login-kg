import 'package:flutter/material.dart';
import 'package:login_app/Screens/Login/login_screen.dart';
import 'package:login_app/Screens/Register/register_screen.dart';
import 'package:login_app/Screens/Validasi/forget_password_screen.dart';
import 'package:login_app/main.dart';

import 'Screens/Change Password/change_password_screen.dart';
import 'Screens/Forget Password/forget_password_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // jika ingin mengirim argument
    // final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyApp());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case '/change-password':
        return MaterialPageRoute(builder: (_) => ChangePasswordPage());
      case '/forget-password':
        return MaterialPageRoute(builder: (_) => ForgetPasswordPage());
      case '/validasi':
        return MaterialPageRoute(builder: (_) => ValidasiPage());
      // return MaterialPageRoute(builder: (_) => AboutPage(args));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text("Error")),
        body: Center(child: Text('Error page')),
      );
    });
  }
}
