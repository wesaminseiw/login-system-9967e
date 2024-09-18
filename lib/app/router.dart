import 'package:flutter/material.dart';
import 'package:login_system/presentation/screens/phone_number_login_screen.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/login_screen.dart';
import '../presentation/screens/register_screen.dart';
import '../presentation/screens/verify_email_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/home':
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case '/register':
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );
      case '/verify':
        return MaterialPageRoute(
          builder: (context) => const VerifyEmailScreen(),
        );
      // case '/phone_login':
      //   return MaterialPageRoute(
      //     builder: (context) => const PhoneNumberLoginScreen(),
      //   );
      default:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
    }
  }
}
