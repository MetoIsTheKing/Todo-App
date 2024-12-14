import 'package:flutter/material.dart';
import 'package:to_do_app/config/app_routes.dart';
import 'package:to_do_app/config/app_theme.dart';
//import 'package:todo_app/Screens/welcome_to_todo_app.dart';


class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      initialRoute: Routes.splash,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      //home: const WelcomeScreen(),
    );
  }
}
