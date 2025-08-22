import 'package:flutter/material.dart';
import 'package:nectar/presentation/pages/login_page.dart';
import 'package:nectar/presentation/pages/splash_page.dart';
import 'package:nectar/presentation/themes/buttons_theme.dart';
import 'package:nectar/presentation/themes/text_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nectar',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
        ),
        elevatedButtonTheme: ButtonsTheme.elevatedButtonTheme,
        textTheme: TextsTheme.textTheme
      ),
      home: LoginPage(),
       //const SplashPage()
    );
  }
}
