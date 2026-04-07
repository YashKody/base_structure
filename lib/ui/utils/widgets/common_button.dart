import 'package:base_structure/ui/utils/themes/app_colors.dart';
import 'package:base_structure/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final bool isDisabled;
  final VoidCallback? onTap;

  const CommonButton({
    super.key,
    required this.text,
    this.isDisabled = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //gradient
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.clrGreyB5B5B5),
        color: AppColors.clrWhiteFFFFFF,
        borderRadius: BorderRadius.circular(25),
      ),
      child: FilledButton(
        onPressed: (isDisabled) ? null : onTap,
        style: FilledButton.styleFrom(
          backgroundColor: Colors.transparent,
          // padding: EdgeInsetsGeometry.symmetric(vertical: 24, horizontal: 24)
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: CommonText(
            text: text,
            color: AppColors.clrBlack000000,
          ),
        ),
      ),
    );
  }
}
