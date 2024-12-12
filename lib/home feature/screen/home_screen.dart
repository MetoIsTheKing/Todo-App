import 'package:flutter/material.dart';
import 'package:todo_app/core/app_colors.dart';
import 'package:todo_app/home%20feature/widget/bottomnavbar_widget.dart';
import 'package:todo_app/home%20feature/widget/home_widget.dart';
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

  final List<Widget> screens = const [
    HomeWidget(),
    Center(child: Text("Search", style: _textStyle)),
    Center(child: Text("Notifications", style: _textStyle)),
    ProfileScreen(),
  ];

  void _onFabPressed() {
    // TODO: Implement FAB functionality (Show Dialog)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 0
          ? AppBar(
              leading: IconButton(
                onPressed: () => {},
                icon: const Icon(Icons.sort),
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
        onPressed: _onFabPressed,
        shape: const CircleBorder(),
        backgroundColor: AppColors.accentColor,
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
