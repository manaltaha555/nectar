import 'package:flutter/material.dart';
import 'package:nectar/core/constants/app_colors.dart';

class TextsTheme {
  static TextTheme textTheme = TextTheme(
    headlineLarge: TextStyle(
      color: AppColors.titleColor,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      fontFamily: "Gilori",
    ),
    titleLarge: TextStyle(
      color: AppColors.titleColor,
      fontSize: 26,
      fontWeight: FontWeight.w600,
      fontFamily: "Gilori",
    ),
    titleSmall: TextStyle(
      color: AppColors.titleColor,
      fontSize: 24,
      fontWeight: FontWeight.w400,
      fontFamily: "Gilori",
    ),
    bodyLarge: TextStyle(
      color: AppColors.titleColor,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: "Gilori",),
    bodyMedium: TextStyle(
      color: AppColors.subtitleColor,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: "Gilori",
    ),
    bodySmall: TextStyle(
      color: AppColors.titleColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: "Gilori",
    ),
    labelLarge: TextStyle(
      color: AppColors.titleColor,
      fontSize: 18,
      fontWeight: FontWeight.w400,
      fontFamily: "Gilori",
    ),
    labelMedium: TextStyle(
      color: AppColors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: "Gilori",
    ),
    labelSmall: TextStyle(
      color: AppColors.darkGrey,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: "Gilori",
    ),
    
  );
}
