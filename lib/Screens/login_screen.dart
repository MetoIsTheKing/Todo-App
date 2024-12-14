import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/config/app_routes.dart';
import 'package:todo_app/core/app_colors.dart';
import 'reusable_widgets/custom-text-form_field.dart';
import 'reusable_widgets/custom_button_login.dart';
import 'reusable_widgets/custom_text.dart';
import 'reusable_widgets/inside_button.dart';
import 'reusable_widgets/reuse_body_of_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new_outlined,
              color: AppColors.secondaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 25),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  text: "Login", fontWeight: FontWeight.w700, fontSize: 32),
              const SizedBox(
                height: 30,
              ),
              CustomText(
                  text: "Gmail", fontWeight: FontWeight.w400, fontSize: 16),
              const SizedBox(
                height: 10,
              ),
              TextFormFieldForEmail(
                  hint: "user@gmail.com", controller: emailController),
              const SizedBox(
                height: 20,
              ),
              CustomText(
                  text: "Password", fontWeight: FontWeight.w400, fontSize: 16),
              const SizedBox(
                height: 10,
              ),
              customTextFieldFOrPassword(
                  hint: "write your password", controller: passwordController),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 44, right: 44),
                child: SizedBox(
                  height: 50,
                  width: 500,
                  child: customButtonLogin(
                      text: "LOGIN",
                      color: AppColors.accentColor,
                      onClick: () {
                        if (formKey.currentState!.validate()) {
                          if (kDebugMode) {
                            print(emailController.text);
                          }
                          if (kDebugMode) {
                            print(passwordController.text);
                          }
                        }
                        Navigator.of(context)
                            .pushReplacementNamed(Routes.homePage);
                      }),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const SizedBox(
                height: 150,
              ),
              const Center(
                child: Text(
                    "-------------------------- or --------------------------"),
              ),
              const SizedBox(
                height: 10,
              ),
              elevatedButtonBody(
                  child: insideButton(
                      text: "Login With Google",
                      asset: "assets/images/google.png")),
              const SizedBox(
                height: 10,
              ),
              elevatedButtonBody(
                  child: insideButton(
                      text: "Login With Appe",
                      asset: "assets/images/apple.png")),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                      text: "Don’t have an account? ",
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                  InkWell(
                      onTap: () {},
                      child: CustomText(
                          text: "Register",
                          fontWeight: FontWeight.w400,
                          fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
