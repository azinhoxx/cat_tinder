import 'package:flutter/material.dart';
import 'package:cat_tinder/core/utils/constants/app/app_decorations.dart';

class SlideDescription extends StatelessWidget {
  final String name;
  final String? origin;

  const SlideDescription({super.key, required this.name, this.origin});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: null,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(AppDecorations.defaultBorderRadius),
          ),
          color: Colors.black54,
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: <Widget>[
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              if (origin != null)
                Text(origin!, style: const TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
