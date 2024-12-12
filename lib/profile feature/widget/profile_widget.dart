import 'package:flutter/material.dart';
import 'package:todo_app/profile%20feature/screen/setting_screen.dart';
import 'package:todo_app/profile%20feature/widget/menu_items.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  const SizedBox(height: 10),
                  const Text('Martha Hays',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          color: Color(0xff363636),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: const Text(
                          '10 Task left',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          color: Color(0xff363636),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: const Text(
                          '5 Task done',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (_) => const SettingScreen()));
                    },
                    child: const MenuItem(
                        icon: Icons.settings, title: "App Settings"),
                  ),
                  const SizedBox(height: 20),
                  const MenuItem(
                      icon: Icons.person_2_outlined,
                      title: "Change account name"),
                  const SizedBox(
                    height: 20,
                  ),
                  const MenuItem(
                      icon: Icons.key, title: "Change account password"),
                  const SizedBox(
                    height: 20,
                  ),
                  const MenuItem(
                      icon: Icons.camera_alt, title: "Change account image"),
                  const SizedBox(
                    height: 20,
                  ),
                  const MenuItem(icon: Icons.menu, title: "About US"),
                  const SizedBox(
                    height: 20,
                  ),
                  const MenuItem(icon: Icons.info, title: "FAQ"),
                  const SizedBox(
                    height: 20,
                  ),
                  const MenuItem(
                    icon: (Icons.logout),
                    iconColor: Color(0xffFF0000),
                    title: "Logout",
                    titleColor: Color(0xffFF0000),
                  ),
                ],
              ),
            )
          ]),
        );
  }
}