import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/app_colors.dart';

class BottomnavbarWidget extends StatefulWidget {

  final int currentIndex;
  final Function(int)
      onIndexChanged; // Callback to pass the updated index to the parent
  const BottomnavbarWidget({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged, // Pass callback in constructor
  });

  @override
  State<BottomnavbarWidget> createState() => _BottomnavbarWidgetState();
}

class _BottomnavbarWidgetState extends State<BottomnavbarWidget> {
 
  final List<IconData> icons = const [
    Icons.home,
    Icons.search,
    Icons.notifications,
    Icons.person,
  ];


  

  late int _currentIndex; // Local state for current index

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex; // Initialize with the passed index
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      leftCornerRadius: 30,
      rightCornerRadius: 30,
      notchMargin: 10,
      icons: icons,
      activeIndex: _currentIndex, // Use local state here
      height: 50,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      onTap: (index) {
        setState(() {
          _currentIndex = index; // Update local state
        });

        widget.onIndexChanged(
            index); // Notify parent widget about the index change
      },
      backgroundColor: AppColors.backgroundColor,
      activeColor: AppColors.accentColor,
      inactiveColor: Colors.grey,
    );
  }
}
