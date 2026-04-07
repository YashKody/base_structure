import 'package:base_structure/framework/utils/hive_helper.dart';
import 'package:base_structure/ui/splash/mobile/splash_page_mobile.dart';
import 'package:base_structure/ui/splash/web/splash_page_web.dart';
import 'package:base_structure/ui/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  bool isFirstLaunch = true;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      isFirstLaunch = HiveHelper.get(AppConstants.strIsFirstLaunch) ?? true;
      if (isFirstLaunch) {
        HiveHelper.put(AppConstants.strIsFirstLaunch, false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => SplashPageMobile(),
      desktop: (context) => SplashPageWeb(),
    );
  }
}