import 'package:flutter/material.dart';
import 'package:app/config/app_colors.dart';

class UtilsDecorations {
  
  static InputDecoration loginFormInputDecoration(String label, String hintText, IconButton? suffixIcon) {
   return InputDecoration(
                  labelText: label,
                  hintText: hintText,
                  labelStyle: const TextStyle(color: AppColors.primaryBlack,fontSize: 20),
                  hintStyle: const TextStyle(color: AppColors.primaryBlack, fontSize: 20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.primaryBlue),
                    borderRadius: BorderRadius.circular(15)
                  ),
          
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.primaryBlue),
                    borderRadius: BorderRadius.circular(15)
                  ),
          
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.primaryBlue),
                    borderRadius: BorderRadius.circular(15)
                )
                ,
                  suffixIcon: suffixIcon,
                  errorMaxLines: 2,
                
                );

  }
}