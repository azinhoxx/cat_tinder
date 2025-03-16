import 'package:flutter/material.dart';
import 'package:flutter_hw_1/widgets/base/cat_app_bar.dart';
import 'package:flutter_hw_1/widgets/base/error_message_widget.dart';

class ErrorScreen extends StatelessWidget {
  final String message;
  final Future<bool> Function()? onPressed;
  final String buttonText;

  const ErrorScreen({
    super.key,
    required this.message,
    this.onPressed,
    required this.buttonText,
  });

  Future<void> _handleBack(BuildContext context) async {
    bool result = false;
    if (onPressed != null) {
      result = await onPressed!();
    }
    if (context.mounted && result) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CatAppBar(automaticallyImplyLeading: false),
      body: Center(
        child: ErrorMessageWidget(
          message: message,
          onPressed: () => _handleBack(context),
          buttonText: buttonText,
        ),
      ),
    );
  }
}
