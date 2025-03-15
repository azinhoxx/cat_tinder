import 'package:flutter/material.dart';
import 'package:flutter_hw_1/widgets/base/cat_app_bar.dart';
import 'package:flutter_hw_1/widgets/base/error_message_widget.dart';

class ErrorScreen extends StatelessWidget {
  final String message;
  final String buttonText;
  final VoidCallback? onPressed;

  const ErrorScreen({
    super.key,
    required this.message,
    required this.buttonText,
    this.onPressed,
  });

  void _handleBack(BuildContext context) {
    if (onPressed != null) {
      onPressed!();
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CatAppBar(automaticallyImplyLeading: false),
      body: Center(
        child: ErrorMessageWidget(
          message: message,
          buttonText: buttonText,
          onPressed: () => _handleBack(context),
        ),
      ),
    );
  }
}
