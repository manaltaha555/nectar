import 'package:flutter/material.dart';
import 'package:nectar/core/constants/app_colors.dart';

class TextsTheme {
  static TextTheme textTheme = TextTheme(
    headlineLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontFamily: "Gilori",
      fontSize: 48,
    ), //* used i get started page
    headlineMedium: TextStyle(
      color: AppColors.titleColor,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      fontFamily: "Gilory",
    ), //*used in titles (poduct info, home titles)
    titleLarge: TextStyle(
      color: AppColors.titleColor,
      fontSize: 26,
      fontWeight: FontWeight.w600,
      fontFamily: "Gilory",
    ),
    titleSmall: TextStyle(
      color: AppColors.titleColor,
      fontSize: 24,
      fontWeight: FontWeight.w400,
      fontFamily: "Gilory",
    ),
    bodyLarge: TextStyle(
      color: AppColors.titleColor,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: "Gilory",
    ),
    bodyMedium: TextStyle(
      color: AppColors.subtitleColor,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: "Gilory", //* used in subtitles (product card subtitles)
    ),
    bodySmall: TextStyle(
      color: AppColors.titleColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: "Gilory",
    ),
    labelLarge: TextStyle(
      color: AppColors.titleColor,
      fontSize: 18,
      fontWeight: FontWeight.w400,
      fontFamily: "Gilory",
    ),
    labelMedium: TextStyle(
      color: AppColors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: "Gilory",
    ),
    labelSmall: TextStyle(
      color: AppColors.darkGrey,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: "Gilory",
    ),
  );
}
