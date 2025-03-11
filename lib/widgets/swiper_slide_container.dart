import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/shadows.dart';

class SwiperSlideContainer extends StatelessWidget {
  final List<Widget> children;

  const SwiperSlideContainer({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    const borderRadius = 18.0;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
            color: Theme.of(context).primaryColor,
            boxShadow: AppShadows.primaryWidgetShadow,
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
            child: Stack(children: children),
          ),
        ),
      ),
    );
  }
}
