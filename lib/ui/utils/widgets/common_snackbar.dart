import 'package:base_structure/ui/utils/themes/app_colors.dart';
import 'package:base_structure/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';

void showCommonErrorSnackbar({
  required final BuildContext context,
  required final String message,
  final Color? foregroundColor,
  final Color? backgroundColor,
  final Duration? duration
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor ?? AppColors.clrGreyB5B5B5,
      content: CommonText(text: message, color: foregroundColor ?? AppColors.clrBlack000000,),
      duration: duration ?? Duration(seconds: 1),
    )
  );
}