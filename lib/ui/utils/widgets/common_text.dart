import 'package:base_structure/ui/utils/themes/app_colors.dart';
import 'package:base_structure/ui/utils/themes/text_styles.dart';
import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final int? maxLines;
  final TextStyle? textStyle;
  final String? fontFamily;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final FontStyle? fontStyle;
  final Color? decorationColor;
  final TextDecoration? decoration;
  const CommonText({
    super.key,
    required this.text,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.maxLines,
    this.textStyle,
    this.fontFamily,
    this.textAlign,
    this.textOverflow,
    this.fontStyle,
    this.decorationColor,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines ?? 2,
      style:
          textStyle ??
          TextStyle(
            overflow: textOverflow ?? TextOverflow.ellipsis,
            color:
                color ??
                (Theme.of(context).brightness == Brightness.light
                    ? AppColors.clrBlack000000
                    : AppColors.clrWhiteFFFFFF),
            fontWeight: fontWeight ?? FontWeight.w400,
            fontSize: fontSize ?? 16,
            fontFamily: fontFamily ?? TextStyles.fontFamily,
            fontStyle: fontStyle ?? FontStyle.normal,
            decorationColor: decorationColor ?? AppColors.clrBlack000000,
            decoration: decoration ?? TextDecoration.none,
          ),
    );
  }
}
