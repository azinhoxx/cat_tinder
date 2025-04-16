import 'package:flutter/material.dart';
import 'package:cat_tinder/core/utils/constants/app/app_decorations.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/base/image_container.dart';

class CardImageSection extends StatelessWidget {
  final String url;

  const CardImageSection({required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ImageContainer(
            fit: BoxFit.cover,
            imageUrl: url,
            borderRadius: const BorderRadius.all(
              Radius.circular(AppDecorations.defaultBorderRadius),
            ),
          ),
        ),
      ],
    );
  }
}
