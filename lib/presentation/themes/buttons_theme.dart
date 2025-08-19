import 'package:flutter/material.dart';

class ButtonsTheme {
  static ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0XFF53B175),
      foregroundColor: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(25),
      ),
    ),
  );
}
