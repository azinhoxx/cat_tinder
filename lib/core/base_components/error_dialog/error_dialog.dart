import 'package:cat_tinder/core/base_components/error_dialog/error_dialog_button.dart';
import 'package:flutter/material.dart';
import 'package:cat_tinder/core/utils/constants/app/app_decorations.dart';

class ErrorDialog extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? onRetry;

  const ErrorDialog({super.key, required this.errorMessage, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(20.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppDecorations.defaultBorderRadius),
        ),
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400, maxHeight: 320),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppDecorations.defaultBorderRadius),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: const Icon(Icons.error, size: 60, color: Colors.white),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const Text(
                    'Oops...',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    errorMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            ErrorDialogButton(onRetry: onRetry),
          ],
        ),
      ),
    );
  }
}
