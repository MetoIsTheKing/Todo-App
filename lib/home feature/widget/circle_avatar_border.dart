import 'package:flutter/material.dart';

class CircleAvatarWithBorder extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const CircleAvatarWithBorder({
    super.key,
    required this.color,
    required this.isSelected, required Color backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? const Color.fromARGB(255, 56, 182, 240) : Colors.transparent,
          width: 3.0,
        ),
      ),
      child: CircleAvatar(
        backgroundColor: color,
      ),
    );
  }
}
