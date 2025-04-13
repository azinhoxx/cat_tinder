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
      child: IntrinsicHeight(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            spacing: 20.0,
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
                  spacing: 8.0,
                  children: [
                    const Text(
                      'Oops...',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(errorMessage, textAlign: TextAlign.center),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                width: 140,
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ElevatedButton(
                  onPressed: onRetry,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size.fromHeight(50),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppDecorations.defaultBorderRadius),
                      ),
                    ),
                  ),
                  child: const Text(
                    'TRY AGAIN',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
