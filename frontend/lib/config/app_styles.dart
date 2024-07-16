import 'package:flutter/material.dart';
import 'package:app/config/app_colors.dart';

class AppStyles {
  // Ahora header1 es una función que acepta un color opcional.
  static TextStyle header1({Color color = AppColors.primaryWhite}) => 
      TextStyle(fontSize: 45, color: color, fontWeight: FontWeight.bold);

  static TextStyle header2({Color color = AppColors.primaryWhite, FontWeight fontWeight = FontWeight.normal}) => 
      TextStyle(fontSize: 30, color: color, fontWeight: fontWeight);
  
  static TextStyle header3({Color color = AppColors.primaryWhite, FontWeight fontWeight = FontWeight.normal}) => 
      TextStyle(fontSize: 25, color: color, fontWeight: fontWeight);
  
  static TextStyle header4({Color color = AppColors.primaryWhite, FontWeight fontWeight = FontWeight.normal}) => 
      TextStyle(fontSize: 20, color: color, fontWeight: fontWeight);

  static TextStyle label1({Color color = AppColors.primaryWhite, FontWeight fontWeight = FontWeight.normal}) =>
      TextStyle(fontSize: 18, color: color, fontWeight: fontWeight);

  static TextStyle label2({Color color = AppColors.primaryWhite, FontWeight fontWeight = FontWeight.normal}) => 
      TextStyle(fontSize: 16, color: color, fontWeight: fontWeight);


  static TextStyle subtitle1({Color color = AppColors.primaryWhite, FontWeight fontWeight = FontWeight.normal}) => 
      TextStyle(fontSize: 14, color: color, fontWeight: fontWeight);

  static TextStyle subtitle2({Color color = AppColors.primaryWhite, FontWeight fontWeight = FontWeight.normal}) =>
      TextStyle(fontSize: 12, color: color, fontWeight: fontWeight);   
  


}