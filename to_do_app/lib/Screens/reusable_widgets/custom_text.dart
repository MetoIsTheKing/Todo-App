import 'package:flutter/material.dart';
import 'package:to_do_app/core/app_colors.dart';
import 'package:to_do_app/core/app_strings.dart';


// ignore: must_be_immutable, non_constant_identifier_names
Text CustomText({required String text,required FontWeight fontWeight,required double fontSize}){
  
  //CustomText({required String text,required FontWeight fontWeight,required double fontSize});

 
  
    return Text(
           text,
            style: TextStyle(
                color: AppColors.secondaryColor,
                fontFamily: AppStrings.fontFamily,
                fontWeight: fontWeight,
                fontSize: fontSize),
          );
  }
