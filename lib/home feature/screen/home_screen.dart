import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/app_colors.dart';
import 'package:todo_app/home%20feature/screen/home_page.dart';
import 'package:todo_app/home%20feature/services/cubit/note_cubit.dart';
import 'package:todo_app/home%20feature/widget/bottomnavbar_widget.dart';
import 'package:todo_app/home%20feature/widget/note_dialoge.dart';
import 'package:todo_app/profile%20feature/screen/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onIndexChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  static const TextStyle _textStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w400);

  final List<Widget> screens = [
    const HomePage(),
    const Center(child: Text("Search", style: _textStyle)),
    const Center(child: Text("Notifications", style: _textStyle)),
    const ProfileScreen(),
  ];

  void _onFabPressed() {
    final noteCubit = context.read<NoteCubit>();
    showDialog(
        context: context,
        builder: (BuildContext context) => NoteDialoge(noteCubit: noteCubit));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 0
          ? AppBar(
              leading: const IconButton(
                onPressed: null,
                icon: Icon(Icons.sort),
              ),
              backgroundColor: Colors.transparent,
              title: const Text(
                'Home',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              centerTitle: true,
            )
          : null,
      body: screens[_currentIndex],
      bottomNavigationBar: BottomnavbarWidget(
          currentIndex: _currentIndex, onIndexChanged: _onIndexChanged),
      floatingActionButton: FloatingActionButton(
        enableFeedback: true,
        elevation: 1,
        onPressed: _onFabPressed,
        shape: const CircleBorder(
          side: BorderSide(color: Color.fromARGB(255, 76, 77, 153), width: 1),
        ),
        backgroundColor: AppColors.accentColor,
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
