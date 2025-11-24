import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/core/core.dart';
import 'package:nectar/cubit/controllers/favorites_controller.dart';
import 'package:nectar/cubit/controllers/products_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/features/main_navigation_bar/bottom_navigation_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductsController()),
        BlocProvider(create: (context) => FavoritesController()..loadFavorites()),
      ],
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
          home: const BottomNavBarScreen(),
          //LoginPage(),
          //const SplashPage()
        );
      },
    );
  }
}
