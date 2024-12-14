import 'package:flutter/material.dart';
import 'package:to_do_app/Screens/reusable_widgets/custom_text.dart';
import 'package:to_do_app/core/app_colors.dart';


ElevatedButton customButtonRegister(
    {required String text,
    required Color color,
    required VoidCallback onClick}) {
  return ElevatedButton(
    style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            side: const BorderSide(
              width: 2,
              color: AppColors.accentColor,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll<Color>(color)),
    onPressed: onClick,
    child: CustomText(text: text, fontWeight: FontWeight.w400, fontSize: 16),
  );
}
