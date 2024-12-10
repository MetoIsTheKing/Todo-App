import 'package:flutter/material.dart';
import 'package:todo_app/config/app_routes.dart';
import 'package:todo_app/config/app_theme.dart';

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
    );
  }
}
