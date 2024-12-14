
  import 'package:flutter/material.dart';
import 'package:to_do_app/Screens/reusable_widgets/custom_text.dart';


SizedBox insideButton({required String text,required String asset}) {
    return SizedBox(
              height: 50,
              width: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    asset,
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CustomText(
                      text:text,
                      fontWeight: FontWeight.w400,
                      fontSize: 16)
                ],
              ),
            );}

          