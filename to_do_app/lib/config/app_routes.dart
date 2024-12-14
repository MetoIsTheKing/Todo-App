import 'package:flutter/material.dart';
import 'package:to_do_app/Screens/splash_screen.dart';



class Routes{
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
      // case Routes.welcomeScreen:
      //   return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      // case Routes.logIn:
      //   return MaterialPageRoute(builder: (_) => const SigninScreen());
      // case Routes.signUp:
      //   return MaterialPageRoute(builder: (_) => const SignupScreen());
      // case Routes.homePage:
      //   return MaterialPageRoute(builder: (_) => const HomePage());
      // case Routes.profilePage:
      //   return MaterialPageRoute(builder: (_) => const ProfileScreen());  
      // case Routes.settingPage:
      //   return MaterialPageRoute(builder: (_) => const SettingsScreen());  
      
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