import 'package:flutter/material.dart';
import 'custom_text.dart';


ElevatedButton customButtonLogin({required String text,required Color color,required VoidCallback onClick}){
  return ElevatedButton(
                style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    backgroundColor:  WidgetStatePropertyAll<Color>(
                        color),
                        ),
                onPressed: onClick,
                child: CustomText(
                    text: text, fontWeight: FontWeight.w400, fontSize: 16),
              );
}