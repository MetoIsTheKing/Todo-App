import 'package:flutter/material.dart';
import 'package:todo_app/home%20feature/widget/theme_widget.dart';
import 'package:todo_app/profile%20feature/widget/menu_items.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)),
          title: const Text('Settings'),
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const ThemeWidget()));
                },
                child:
                    const MenuItem(icon: Icons.dark_mode, title: "Dark Mode"),
              ),
              const SizedBox(height: 15),
              const MenuItem(icon: Icons.brush, title: "Change app color"),
              const SizedBox(height: 15),
              const MenuItem(
                  icon: Icons.text_fields, title: "Change app typography"),
              const SizedBox(height: 15),
              const MenuItem(
                  icon: Icons.language, title: "Change app language"),
              const SizedBox(height: 15),
              const MenuItem(
                  icon: Icons.label_important_outline,
                  title: "Import from Google calendar"),
            ])));
  }
}
