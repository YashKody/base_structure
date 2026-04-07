import 'package:base_structure/framework/utils/hive_helper.dart';
import 'package:base_structure/framework/utils/objectbox_helper.dart';
import 'package:base_structure/framework/utils/theme_controller.dart';
import 'package:base_structure/ui/splash/mobile/splash_page_mobile.dart';
import 'package:base_structure/ui/splash/splash_page.dart';
import 'package:base_structure/ui/utils/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

late ObjectboxHelper objectbox;
void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  objectbox = await ObjectboxHelper.initObjectBox();
  await HiveHelper.init();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    ref.read(themeControllerProvider).getThemeMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ref.watch(themeControllerProvider).themeMode,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}