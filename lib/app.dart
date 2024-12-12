import 'package:flutter/material.dart';
import 'package:todo_app/config/app_routes.dart';
import 'package:todo_app/config/app_theme.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});
  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final bool _isDarkMode = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme(
          brightness: _isDarkMode ? Brightness.dark : Brightness.light),
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      initialRoute: Routes.homePage,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
