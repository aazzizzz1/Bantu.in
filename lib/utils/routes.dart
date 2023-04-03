//bikin routes jika halaman tidak ditemukan maka akan dilempar ke halaman error 404 not found page
import 'package:bantuin/screens/auth/login_screen.dart';
import 'package:bantuin/screens/auth/register_screen.dart';
import 'package:bantuin/screens/error/error_screen.dart';
import 'package:bantuin/screens/home/home_pages.dart';
import 'package:bantuin/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String home = '/';
  static const String initial = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String error = '/error';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomePages());
      case initial:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      default:
        return MaterialPageRoute(builder: (_) => ErrorScreen());
    }
  }
}

// cara pemanggilan routes
// Navigator.pushNamed(context, Routes.home);
// Navigator.pushNamed(context, Routes.login);
// Navigator.pushNamed(context, Routes.register);
// Navigator.pushNamed(context, Routes.error);

// cara pemanggilan routes dengan parameter
// Navigator.pushNamed(context, Routes.detail + '/$id');

// cara pemanggilan routes dengan adanya argument
// Navigator.pushNamed(context, Routes.detail, arguments: id);