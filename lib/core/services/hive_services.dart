import 'package:hive_ce_flutter/adapters.dart';

class HiveService {
  HiveService._privateConstructor();

  static final HiveService instance = HiveService._privateConstructor();

  Future<void> init() async {
    await Hive.initFlutter();
  }

  Future<Box<T>> openBox<T>(String name) async {
    return await Hive.openBox<T>(name);
  }

  Future<void> put<T>(String boxName, dynamic key, T value) async {
    final box = await openBox<T>(boxName);
    await box.put(key, value);
  }

  Future<T?> get<T>(String boxName, dynamic key) async{
    final box = await openBox<T>(boxName);
    return box.get(key);
  }

  Future<void> delete(String boxName, dynamic key) async {
    final box = await openBox(boxName);
    await box.delete(key);
  }

  Future<void> closeBox(String name) async {
    await Hive.box(name).close();
  }

  Future<void> closeAll() async {
    await Hive.close();
  }
}
