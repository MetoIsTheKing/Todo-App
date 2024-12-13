import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/config/app_routes.dart';
import 'package:todo_app/config/app_theme.dart';
import 'package:todo_app/home%20feature/services/cubit/note_cubit.dart';
import 'package:todo_app/home%20feature/services/notes_repository.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});
  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final bool _isDarkMode = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(NoteRepository(Supabase.instance.client)),
      child: MaterialApp(
        theme: appTheme(
            brightness: _isDarkMode ? Brightness.dark : Brightness.light),
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        initialRoute: Routes.homePage,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
