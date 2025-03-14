import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;
  final String buttonText;
  final VoidCallback? onPressed;

  const ErrorMessage({
    super.key,
    required this.message,
    required this.buttonText,
    this.onPressed,
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
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF1565C0),
              padding: const EdgeInsets.all(20.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
              ),
            ),
            child: Text(
              buttonText,
              style: TextStyle(
                color: const Color(0xFF1565C0),
                letterSpacing: 1.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
