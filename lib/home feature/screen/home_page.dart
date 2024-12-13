import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/app_colors.dart';
import 'package:todo_app/home%20feature/services/cubit/note_cubit.dart';
import 'package:todo_app/home%20feature/widget/home_widget.dart';
import 'package:todo_app/home%20feature/widget/note_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<NoteCubit>().fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        if (state is NoteIsLoading) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.accentColor,
          ));
        } else if (state is NoteIsEmpty) {
          return const HomeWidget();
        } else if (state is NoteError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is NoteLoaded) {
          return ListView.builder(
            itemCount: state.notes.length,
            itemBuilder: (context, index) {
              final note = state.notes[index];
              final color =
                  Color(int.parse('FF${note.color}', radix: 16));;
              return NoteTile(
                tileColor: color,
                isCompleted: note.completed,
                title: note.content,
                priority: note.priority,
                category: note.category,
              );
            },
          );
        } else {
          return const Center(child: Text('Server Error'));
        }
      },
    );
  }
}
