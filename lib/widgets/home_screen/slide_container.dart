import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/decorations.dart';

class SlideContainer extends StatelessWidget {
  final List<Widget> children;

  const SlideContainer({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDecorations.defaultBorderRadius),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDecorations.defaultBorderRadius),
          ),
          child: Stack(fit: StackFit.expand, children: children),
        ),
      ),
    );
  }
}
