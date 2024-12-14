

import 'package:flutter/material.dart';
import 'package:to_do_app/Screens/register_screen.dart';
import 'package:to_do_app/Screens/reusable_widgets/custom-text-form_field.dart';
import 'package:to_do_app/Screens/reusable_widgets/custom_button_login.dart';
import 'package:to_do_app/Screens/reusable_widgets/custom_text.dart';
import 'package:to_do_app/Screens/reusable_widgets/inside_button.dart';
import 'package:to_do_app/Screens/reusable_widgets/reuse_body_of_button.dart';
import 'package:to_do_app/core/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController =TextEditingController();
    TextEditingController emailController =TextEditingController();
    var formKey =GlobalKey<FormState>();
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
        padding:  const EdgeInsets.only(left: 24, right: 25),
        child: Form(
          key:formKey,
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
              TextFormFieldForEmail(hint: "user@gmail.com", controller: emailController),
              const SizedBox(
                height: 20,
              ),
              CustomText(
                  text: "Password", fontWeight: FontWeight.w400, fontSize: 16),
              const SizedBox(
                height: 10,
              ),
              customTextFieldFOrPassword(hint: "write your password", controller: passwordController),
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
                        if(formKey.currentState!.validate()){
         print(emailController.text);
          print(passwordController.text);
                        }
                        // Navigator.push(context, MaterialPageRoute(builder: (context){
                        //   return const LoginScreen();
                        // }));
                      }),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                        "------------------------------------------------------- or ----------------------------------------------------- "),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              elevatedButtonBody(child: insideButton(text: "Login With Google", asset: "assets/images/google.png")),
              const SizedBox(
                height: 20,
              ),
              elevatedButtonBody(child: insideButton(text: "Login With Appe", asset: "assets/images/apple.png")),
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
                      onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context){
                        return const RegisterScreen();
                      }));
                      },
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
