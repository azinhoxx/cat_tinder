import 'package:flutter/material.dart';
import 'package:flutter_hw_1/providers/swiper_provider.dart';
import 'package:provider/provider.dart' show Selector;

class ErrorHandleButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const ErrorHandleButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 130),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF1565C0),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
        ),
        child: Selector<SwiperProvider, bool>(
          selector: (context, provider) => provider.isHandling,
          builder: (context, value, child) {
            if (value) {
              return SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Color(0xFF1565C0),
                  strokeWidth: 1.5,
                ),
              );
            }
            return Text(text, style: const TextStyle(letterSpacing: 1.0));
          },
        ),
      ),
    );
  }
}
