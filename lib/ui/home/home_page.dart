import 'package:base_structure/ui/home/mobile/home_page_mobile.dart';
import 'package:base_structure/ui/home/web/home_page_web.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => HomePageMobile(),
      desktop: (context) => HomePageWeb(),
    );
  }
}