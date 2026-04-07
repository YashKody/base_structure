import 'package:base_structure/ui/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CommonCheckbox extends StatelessWidget {
  final bool value;
  final void Function(bool?)? onTap;
  const CommonCheckbox({super.key, this.value = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: onTap,
      fillColor: WidgetStateColor.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            // return AppColors.clrGreenShade400;
            return AppColors.clrBlack000000; // Primary color of the app
          }
          return Colors.transparent;
        },
      ),
    );
  }
}
