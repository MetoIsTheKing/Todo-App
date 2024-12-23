import 'package:flutter/material.dart';
import 'package:todo_app/profile%20feature/widget/profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const IconButton(
            onPressed: null,
            icon: Icon(Icons.arrow_back_ios),
            color: Color.fromRGBO(10, 10, 10, 0),
          ),
          centerTitle: true,
          title: const Text(
            'Profile',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ),
        body: const ProfileWidget());
  }
}
