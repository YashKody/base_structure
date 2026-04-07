import 'package:base_structure/framework/utils/hive_helper.dart';
import 'package:base_structure/ui/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

class ThemeController extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  void getThemeMode () {
    bool isDark = HiveHelper.get(AppConstants.strIsDarkMode) ?? false;
    themeMode = isDark == true ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void changeThemeMode(ThemeMode newMode) async {
    themeMode = newMode;
    HiveHelper.put(
      AppConstants.strIsDarkMode,
      newMode == ThemeMode.dark
    );
    notifyListeners();
  }
}

final ChangeNotifierProvider <ThemeController> themeControllerProvider =
ChangeNotifierProvider<ThemeController>((ref) => ThemeController(),);