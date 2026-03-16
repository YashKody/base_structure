import 'package:flutter/material.dart';

class CommonInkWell extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final void Function()? onTap;

  const CommonInkWell({
    super.key,
    required this.child,
    this.borderRadius,
    this.padding,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      onTap: onTap,
      child: Padding(
        padding: padding ?? EdgeInsetsGeometry.all(4),
        child: child,
      ),
    );
  }
}
