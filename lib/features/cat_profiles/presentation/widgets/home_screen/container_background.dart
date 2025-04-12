import 'package:flutter/material.dart';
import 'package:cat_tinder/core/utils/constants/app_decorations.dart';

class ContainerBackground extends StatelessWidget {
  final Widget child;

  const ContainerBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppDecorations.defaultBorderRadius),
        ),
        color: Colors.black54,
      ),
      child: child,
    );
  }
}
