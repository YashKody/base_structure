import 'package:base_structure/ui/splash/mobile/splash_page_mobile.dart';
import 'package:base_structure/ui/splash/web/splash_page_web.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => SplashPageMobile(),
      desktop: (context) => SplashPageWeb(),
    );
  }
}