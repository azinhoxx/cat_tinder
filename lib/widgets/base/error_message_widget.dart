import 'package:flutter/material.dart';
import 'package:flutter_hw_1/widgets/base/error_handle_button.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String message;
  final String buttonText;
  final VoidCallback? onPressed;

  const ErrorMessageWidget({
    super.key,
    required this.message,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              message,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          ErrorHandleButton(text: buttonText, onPressed: onPressed),
        ],
      ),
    );
  }
}
