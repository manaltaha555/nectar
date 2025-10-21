import 'package:flutter/material.dart';
import 'package:nectar/core/core.dart';
import 'package:nectar/features/home/screens/home_page.dart';
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
      theme:AppTheme.appTheme,
      home: HomePage()
      //LoginPage(),
       //const SplashPage()
    );
  }
}
