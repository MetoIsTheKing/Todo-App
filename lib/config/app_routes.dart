import 'package:flutter/material.dart';
import 'package:todo_app/Screens/login_screen.dart';
import 'package:todo_app/Screens/register_screen.dart';

import 'package:todo_app/Screens/splash_screen.dart';
import 'package:todo_app/Screens/welcome_to_todo_app.dart';
import 'package:todo_app/home%20feature/screen/home_screen.dart';
import 'package:todo_app/profile%20feature/screen/profile_screen.dart';

class Routes {
  static const String splash = '';
  static const String welcomeScreen = '/welcome';
  static const String logIn = '/welcome/login';
  static const String signUp = '/welcome/signup';
  static const String homePage = '/home';
  static const String taskPage = '/home/taskpage';
  static const String addNewTask = '/home/addnewtask';
  static const String profilePage = '/home/profilepage';
  static const String settingPage = '/home/profilepage/settingpage';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.welcomeScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case Routes.logIn:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.homePage:
        return MaterialPageRoute(
            builder: (_) => const HomeScreen());
      case Routes.profilePage:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('Undefined Route'),
        ),
      ),
    );
  }
}
