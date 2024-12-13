import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.6,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      // decoration: const BoxDecoration(color: Colors.red),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(
            child: SizedBox(
          height: 650,
          width: 250,
          child: Image.asset(
            'assets/images/Home.png',
            fit: BoxFit.cover,
          ),
        )),
        const SizedBox(height: 20),
        const SizedBox(
            child: Text(
          'What do you want to do today?',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        )),
        const SizedBox(height: 20),
        const SizedBox(
          child: Text(
            'Tap + to add your tasks',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        )
      ]),
    );
  }
}
