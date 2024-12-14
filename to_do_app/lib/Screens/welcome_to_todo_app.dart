

import 'package:flutter/material.dart';
import 'package:to_do_app/Screens/login_screen.dart';
import 'package:to_do_app/Screens/reusable_widgets/custom_button_login.dart';
import 'package:to_do_app/Screens/reusable_widgets/custom_button_register.dart';
import 'package:to_do_app/Screens/reusable_widgets/custom_text.dart';
import 'package:to_do_app/core/app_colors.dart';

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
          Padding(
            padding: const EdgeInsets.only(left: 43, right: 44),
            child: CustomText(
              text: "Welcome to UpTodo",
              fontWeight: FontWeight.w700,
              fontSize: 32,
            ),
          ),
          const SizedBox(
            height: 60,
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
            height: 250,
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
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const LoginScreen();
                    }));
                  }),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 44, right: 44),
            child: SizedBox(
              height: 50,
              width: 400,
              child: customButtonRegister(
                  text: "Create account",
                  color: AppColors.primaryColor,
                  onClick: () {}),
            ),
          ),
        ],
      ),
    );
  }
}


/*

ElevatedButton(
                style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    backgroundColor: const WidgetStatePropertyAll<Color>(
                        AppColors.backgroundButonColor)),
                onPressed: () {},
                child: CustomText(
                    text: "LOGIN", fontWeight: FontWeight.w400, fontSize: 16),
              ),





ElevatedButton(
                style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 2,
                          color: AppColors.backgroundButonColor,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    backgroundColor: const WidgetStatePropertyAll<Color>(
                        AppColors.primaryColor)),
                onPressed: () {},
                child: CustomText(
                    text: "Create account",
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              )


*/