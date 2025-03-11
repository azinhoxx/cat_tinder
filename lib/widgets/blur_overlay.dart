import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

class BlurOverlay extends StatelessWidget {
  final Widget child;

  const BlurOverlay({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(color: Colors.black38),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
