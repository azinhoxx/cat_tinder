import 'package:flutter/material.dart';

class SwiperNavigationButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? color;
  final IconData icon;
  final double? iconSize;

  const SwiperNavigationButton({
    super.key,
    this.onPressed,
    this.color,
    this.iconSize,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      iconSize: iconSize,
      color: color,
      padding: const EdgeInsets.all(10.0),
      icon: Icon(icon),
    );
  }
}
