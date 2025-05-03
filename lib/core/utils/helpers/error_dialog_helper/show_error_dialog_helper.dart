import 'package:cat_tinder/features/cat_profiles/presentation/widgets/base/error_dialog/error_dialog.dart';
import 'package:flutter/material.dart';

Future<void> showErrorDialog(
  BuildContext context, {
  required String errorMessage,
  VoidCallback? onRetry,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return PopScope(
        canPop: false,
        child: ErrorDialog(errorMessage: errorMessage, onRetry: onRetry),
      );
    },
  );
}
