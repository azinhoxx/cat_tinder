import 'package:flutter/material.dart';

class SwiperNavigationButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? color;
  final IconData icon;

  const SwiperNavigationButton({
    super.key,
    this.onPressed,
    this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, color: color, icon: Icon(icon));
  }
}
