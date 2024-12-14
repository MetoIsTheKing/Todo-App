import 'package:flutter/material.dart';
import 'package:todo_app/config/app_routes.dart';
import 'package:todo_app/core/app_colors.dart';

import 'reusable_widgets/custom_button_login.dart';
import 'reusable_widgets/custom_button_register.dart';
import 'reusable_widgets/custom_text.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new_outlined,
            color: AppColors.secondaryColor),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 90,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 44, right: 44),
            child: CustomText(
              text: "Welcome to UpTodo",
              fontWeight: FontWeight.w700,
              fontSize: 32,
            ),
          ),
          const SizedBox(
            height: 450,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 44, right: 44),
            child: CustomText(
                text: "Please login to your account or create",
                fontWeight: FontWeight.w400,
                fontSize: 16),
          ),
          CustomText(
              text: "new account to continue",
              fontWeight: FontWeight.w400,
              fontSize: 16),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 44, right: 44),
            child: SizedBox(
              height: 50,
              width: 400,
              child: customButtonLogin(
                  text: "LOGIN",
                  color: AppColors.accentColor,
                  onClick: () {
                    Navigator.of(context).pushNamed(Routes.logIn);
                  }),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 44, right: 44),
            child: SizedBox(
              height: 50,
              width: 400,
              child: customButtonRegister(
                  text: "Create account",
                  color: AppColors.primaryColor,
                  onClick: () {
                    Navigator.of(context).pushNamed(Routes.signUp);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
