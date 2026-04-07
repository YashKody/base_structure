import 'package:hive_ce/hive_ce.dart';
import 'package:hive_ce_flutter/adapters.dart';

class HiveHelper {
  HiveHelper._();

  static late Box _box;
  static const String _boxName = "info_box";

  static Future <void> init () async {
    Hive.initFlutter();
    _box = await Hive.openBox(_boxName);
  }

  static Box get box => _box;

  static Future <void> put<T> (String key, T value) async {
    await _box.put(key, value);
  }

  static T? get<T>(String key) {
     return _box.get(key) as T;
  }

  static Future <void> delete<T>(String key) async {
    await _box.delete(key);
  }
}