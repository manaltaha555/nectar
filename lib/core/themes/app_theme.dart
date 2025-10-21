import 'package:flutter/material.dart';
import 'package:nectar/core/constants/app_colors.dart';
import 'package:nectar/core/themes/buttons_theme.dart';
import 'package:nectar/core/themes/text_theme.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        primaryColor: AppColors.primaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.white,
        ),
        elevatedButtonTheme: ButtonsTheme.elevatedButtonTheme,
        textTheme: TextsTheme.textTheme,
        cardTheme: CardThemeData(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
          side: BorderSide(color: AppColors.subtitleColor),

        ),
        )
      );
}