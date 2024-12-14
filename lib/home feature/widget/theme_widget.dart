import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeWidget extends StatefulWidget {
  const ThemeWidget({
    super.key,
  });
  @override
  State<ThemeWidget> createState() => _ThemeWidgetState();
}

class _ThemeWidgetState extends State<ThemeWidget> {
  bool isDark = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Dark Mode"),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Center(
        child: CupertinoSwitch(
          value: isDark,
          onChanged: (bool value) {
            setState(() {
              isDark = value;
            });
          },
        ),
      ),
    );
  }
}
