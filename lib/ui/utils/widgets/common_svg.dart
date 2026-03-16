import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonSVG extends StatelessWidget {
  final String svgPath;
  final double? width;
  final double? height;
  final Color? color;
  const CommonSVG({
    super.key,
    required this.svgPath,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      height: height ?? 20,
      width: width ?? 20,
      color: color,
    );
  }
}
