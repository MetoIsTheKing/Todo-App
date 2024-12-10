import 'package:flutter/material.dart';
import 'package:todo_app/core/app_colors.dart';
import 'package:todo_app/core/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    bottomAppBarTheme: const BottomAppBarTheme(
        color: AppColors.primaryColor,
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 20,
        shape: CircularNotchedRectangle()),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontFamily: AppStrings.fontFamily,
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.secondaryColor),
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
    ),
    fontFamily: AppStrings.fontFamily,
    textTheme: const TextTheme(
      //Labels
      labelLarge: TextStyle(
          fontFamily: AppStrings.fontFamily,
          fontSize: 24,
          fontWeight: FontWeight.w700),
      labelMedium: TextStyle(
          fontFamily: AppStrings.fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w500),
      labelSmall: TextStyle(
          fontFamily: AppStrings.fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w400),
      //Body Text
      bodyLarge: TextStyle(
          fontFamily: AppStrings.fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(
          fontFamily: AppStrings.fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w400),
      bodySmall: TextStyle(
          fontFamily: AppStrings.fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w400),
      //Title Text
      titleLarge: TextStyle(
          fontFamily: AppStrings.fontFamily,
          fontSize: 32,
          fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
          fontFamily: AppStrings.fontFamily,
          fontSize: 24,
          fontWeight: FontWeight.w700),
    ),
  );
}
