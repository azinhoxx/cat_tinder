import 'package:flutter/material.dart';
import 'package:cat_tinder/core/utils/constants/app_decorations.dart';

class ContainerBackground extends StatelessWidget {
  final Widget child;
  final Color color;

  const ContainerBackground({
    super.key,
    required this.child,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(AppDecorations.defaultBorderRadius),
        ),
        color: color,
      ),
      child: child,
    );
  }
}
