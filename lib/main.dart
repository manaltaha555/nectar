import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/core/core.dart';
import 'package:nectar/cubit/controllers/products_controller.dart';
import 'package:nectar/features/home/presenattion/screens/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ProductsController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Nectar',
          theme: AppTheme.appTheme,
          home: HomePage(),
          //LoginPage(),
          //const SplashPage()
        );
      },
    );
  }
}
