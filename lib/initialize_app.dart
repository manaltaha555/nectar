import 'package:flutter/material.dart';
import 'package:nectar/core/services/hive_services.dart';

class InitializeApp {
  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await HiveService.instance.init();
    await HiveService.instance.openBox('favoritesBox');
  }
}