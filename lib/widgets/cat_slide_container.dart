import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/decorations.dart';

class CatSlideContainer extends StatelessWidget {
  final List<Widget> children;
  final double borderRadius;

  const CatSlideContainer({
    super.key,
    required this.children,
    this.borderRadius = AppDecorations.defaultBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Stack(children: children),
        ),
      ),
    );
  }
}
