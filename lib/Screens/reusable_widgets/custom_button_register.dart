import 'package:flutter/material.dart';
import 'package:todo_app/core/app_colors.dart';
import 'custom_text.dart';



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
