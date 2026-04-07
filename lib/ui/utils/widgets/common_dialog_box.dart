import 'package:base_structure/ui/utils/widgets/common_button.dart';
import 'package:base_structure/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';

enum AppDialogType { info, success, error, warning }

Future<void> showAppDialog({
  required BuildContext context,
  String title = '',
  String message = '',
  Widget? icon,
  Widget? animation,
  AppDialogType type = AppDialogType.info,
  String? primaryButtonText,
  String? secondaryButtonText,
  VoidCallback? onPrimaryPressed,
  VoidCallback? onSecondaryPressed,
  bool autoClose = false,
  Duration autoCloseDuration = const Duration(seconds: 2),
}) {
  if (autoClose) {
    Future.delayed(autoCloseDuration, () {
      if (context.mounted) Navigator.pop(context);
    });
  }

  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      constraints: const BoxConstraints(maxWidth: 420),
      icon: icon ?? _getIcon(type),

      title: CommonText(
        text: title,
        textAlign: TextAlign.center,
        fontWeight: FontWeight.bold,
      ),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (animation != null) animation,
          const SizedBox(height: 8),
          CommonText(
            text: message,
            maxLines: 5,
            textAlign: TextAlign.center,
          ),
        ],
      ),

      actions: _buildActions(
        context,
        primaryButtonText,
        secondaryButtonText,
        onPrimaryPressed,
        onSecondaryPressed,
      ),

      actionsAlignment: MainAxisAlignment.center,
    ),
  );
}

Icon _getIcon(AppDialogType type) {
  switch (type) {
    case AppDialogType.success:
      return const Icon(Icons.check_circle, color: Colors.green);
    case AppDialogType.error:
      return const Icon(Icons.error, color: Colors.red);
    case AppDialogType.warning:
      return const Icon(Icons.warning, color: Colors.orange);
    default:
      return const Icon(Icons.info);
  }
}

List<Widget>? _buildActions(
  BuildContext context,
  String? primaryText,
  String? secondaryText,
  VoidCallback? onPrimary,
  VoidCallback? onSecondary,
) {
  if (primaryText == null && secondaryText == null) return null;

  return [
    if (secondaryText != null)
      CommonButton(
        text: secondaryText,
        onTap: () {
          Navigator.pop(context);
          onSecondary?.call();
        },
      ),
    if (primaryText != null)
      CommonButton(
        text: primaryText,
        onTap: () {
          Navigator.pop(context);
          onPrimary?.call();
        },
      ),
  ];
}