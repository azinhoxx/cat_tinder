import 'dart:ui';

import 'package:flutter/material.dart';

class SwiperSlideContainer extends StatelessWidget {
  final List<Widget> children;

  const SwiperSlideContainer({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    const borderRadius = 18.0;

    return MouseRegion(
      // cursor: SystemMouseCursors.click,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
            color: Theme.of(context).primaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 16,
                offset: const Offset(0, -3),
              ),
            ],
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
